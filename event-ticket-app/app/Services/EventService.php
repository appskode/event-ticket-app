<?php

namespace App\Services;

use App\Models\Event;
use App\Models\TicketType;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;

class EventService extends BaseService
{
    /**
     * Get paginated events
     */
    public function getEvents(int $perPage = 10): LengthAwarePaginator
    {
        try {
            return Event::active()
                ->with(['ticketTypes' => function ($query) {
                    $query->active()->available();
                }])
                ->orderBy('event_date', 'asc')
                ->paginate($perPage);
        } catch (\Exception $e) {
            $this->handleException($e, 'Get Events');
            throw $e;
        }
    }

    /**
     * Get single event
     */
    public function getEvent(int $id): Event
    {
        try {
            $event = Event::with(['ticketTypes' => function ($query) {
                $query->active();
            }])->find($id);

            if (!$event) {
                throw new \Illuminate\Database\Eloquent\ModelNotFoundException('Event not found');
            }

            return $event;
        } catch (\Exception $e) {
            $this->handleException($e, 'Get Event');
            throw $e;
        }
    }

    /**
     * Create new event
     */
    public function createEvent(array $data): Event
    {
        try {
            $validatedData = $this->validate($data, [
                'name' => 'required|string|max:255',
                'description' => 'required|string',
                'location' => 'required|string|max:255',
                'image_url' => 'nullable|url',
                'event_date' => 'required|date|after:now',
                'sale_start_date' => 'required|date|before:event_date',
                'sale_end_date' => 'required|date|after:sale_start_date|before:event_date',
                'allow_cancellation' => 'boolean',
                'cancellation_hours_before' => 'integer|min:1|max:168',
            ]);

            return Event::create($validatedData);
        } catch (\Exception $e) {
            $this->handleException($e, 'Create Event');
            throw $e;
        }
    }

    /**
     * Add ticket type to event
     */
    public function addTicketType(int $eventId, array $data): TicketType
    {
        try {
            $event = $this->getEvent($eventId);

            $validatedData = $this->validate($data, [
                'name' => 'required|string|max:255',
                'description' => 'nullable|string',
                'price' => 'required|numeric|min:0',
                'total_quantity' => 'required|integer|min:1',
            ]);

            return TicketType::create([
                'event_id' => $event->id,
                'name' => $validatedData['name'],
                'description' => $validatedData['description'],
                'price' => $validatedData['price'],
                'total_quantity' => $validatedData['total_quantity'],
                'available_quantity' => $validatedData['total_quantity'],
            ]);
        } catch (\Exception $e) {
            $this->handleException($e, 'Add Ticket Type');
            throw $e;
        }
    }


    /**
     * Search events - FIXED VERSION
     */
    public function searchEvents(array $searchParams): LengthAwarePaginator
    {
        try {
            $validatedData = $this->validate($searchParams, [
                'q' => 'required|string|min:1|max:255',
                'page' => 'sometimes|integer|min:1',
                'per_page' => 'sometimes|integer|min:1|max:50',
                'location' => 'sometimes|string|max:255',
                'date_from' => 'sometimes|date|date_format:Y-m-d',
                'date_to' => 'sometimes|date|date_format:Y-m-d|after_or_equal:date_from',
            ]);

            // FIXED: Remove sold_quantity from select - it doesn't exist in your schema
            $query = Event::with(['ticketTypes' => function($query) {
                $query->select('id', 'event_id', 'name', 'description', 'price', 'total_quantity', 'available_quantity', 'is_active');
            }]);

            // Apply search filters
            $query->where(function($q) use ($validatedData) {
                $q->where('name', 'LIKE', '%' . $validatedData['q'] . '%')
                  ->orWhere('description', 'LIKE', '%' . $validatedData['q'] . '%');
            });

            if (!empty($validatedData['location'])) {
                $query->where('location', 'LIKE', '%' . $validatedData['location'] . '%');
            }

            if (!empty($validatedData['date_from'])) {
                $query->whereDate('event_date', '>=', $validatedData['date_from']);
            }

            if (!empty($validatedData['date_to'])) {
                $query->whereDate('event_date', '<=', $validatedData['date_to']);
            }

            // Only show events that are currently on sale
            $query->where('sale_start_date', '<=', now())
                  ->where('sale_end_date', '>=', now());

            // Order by relevance
            $query->orderByRaw("CASE WHEN name LIKE ? THEN 1 ELSE 2 END", [$validatedData['q'] . '%'])
                  ->orderBy('event_date', 'asc');

            $perPage = min($validatedData['per_page'] ?? 10, 50);
            $events = $query->paginate($perPage);

            $events->getCollection()->transform(function ($event) {
                $event->min_price = $event->ticketTypes->min('price') ?? 0;
                $event->max_price = $event->ticketTypes->max('price') ?? 0;
                $event->has_available_tickets = $event->ticketTypes->some(function ($ticketType) {
                    return $ticketType->available_quantity > 0;
                });
                $event->days_until_event = now()->diffInDays($event->event_date, false);
                return $event;
            });

            return $events;
        } catch (\Exception $e) {
            $this->handleException($e, 'Search Events');
            throw $e;
        }
    }

    /**
     * Get search suggestions
     */
    public function getSearchSuggestions(string $searchTerm, int $limit = 5): array
    {
        try {
            $suggestions = collect();

            // Get event suggestions
            $events = DB::table('events')
                ->where('name', 'LIKE', '%' . $searchTerm . '%')
                ->where('event_date', '>=', now())
                ->select('name', 'location', 'event_date')
                ->orderByRaw("CASE WHEN name LIKE ? THEN 1 ELSE 2 END", [$searchTerm . '%'])
                ->limit($limit)
                ->get();

            foreach ($events as $event) {
                $suggestions->push([
                    'type' => 'event',
                    'text' => $event->name,
                    'subtitle' => $event->location . ' • ' . \Carbon\Carbon::parse($event->event_date)->format('M d, Y'),
                    'value' => $event->name
                ]);
            }

            // Get location suggestions if we have space
            if ($suggestions->count() < $limit) {
                $remainingLimit = $limit - $suggestions->count();

                $locations = DB::table('events')
                    ->where('location', 'LIKE', '%' . $searchTerm . '%')
                    ->where('event_date', '>=', now())
                    ->select('location')
                    ->distinct()
                    ->limit($remainingLimit)
                    ->get();

                foreach ($locations as $location) {
                    $suggestions->push([
                        'type' => 'location',
                        'text' => $location->location,
                        'subtitle' => 'Location',
                        'value' => $location->location
                    ]);
                }
            }

            return $suggestions->take($limit)->values()->toArray();
        } catch (\Exception $e) {
            $this->handleException($e, 'Get Search Suggestions');
            throw $e;
        }
    }
}
