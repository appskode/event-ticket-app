<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Builder;

class Event extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'location',
        'image_url',
        'event_date',
        'sale_start_date',
        'sale_end_date',
        'is_active',
        'allow_cancellation',
        'cancellation_hours_before',
    ];

    protected $casts = [
        'event_date' => 'datetime',
        'sale_start_date' => 'datetime',
        'sale_end_date' => 'datetime',
        'is_active' => 'boolean',
        'allow_cancellation' => 'boolean',
        'price'=>'decimal:2',
    ];

    // Relationships
    public function ticketTypes()
    {
        return $this->hasMany(TicketType::class);
    }

    public function tickets()
    {
        return $this->hasMany(Ticket::class);
    }

    // Scopes
    public function scopeActive(Builder $query)
    {
        return $query->where('is_active', true);
    }

    public function scopeAvailableForSale(Builder $query)
    {
        return $query->where('is_active', true)
                    ->where('sale_start_date', '<=', now())
                    ->where('sale_end_date', '>=', now());
    }

    // Accessors & Mutators
    public function getIsSaleActiveAttribute()
    {
        return $this->is_active
            && $this->sale_start_date <= now()
            && $this->sale_end_date >= now();
    }

    public function getCanBeCancelledAttribute()
    {
        if (!$this->allow_cancellation) {
            return false;
        }

        $cancellationDeadline = $this->event_date->subHours($this->cancellation_hours_before);
        return now() <= $cancellationDeadline;
    }
}
