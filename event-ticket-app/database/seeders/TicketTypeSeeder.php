<?php

namespace Database\Seeders;

use App\Models\Event;
use App\Models\TicketType;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TicketTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $events = Event::all();

        foreach ($events as $event) {
            if (str_contains($event->name, 'Music Festival')) {
                TicketType::create([
                    'event_id' => $event->id,
                    'name' => 'Early Bird',
                    'description' => 'Limited time early bird discount',
                    'price' => 89.99,
                    'total_quantity' => 500,
                    'available_quantity' => 500,
                ]);

                TicketType::create([
                    'event_id' => $event->id,
                    'name' => 'General Admission',
                    'description' => 'Standard festival access',
                    'price' => 129.99,
                    'total_quantity' => 2000,
                    'available_quantity' => 2000,
                ]);

                TicketType::create([
                    'event_id' => $event->id,
                    'name' => 'VIP',
                    'description' => 'VIP access with premium amenities',
                    'price' => 299.99,
                    'total_quantity' => 200,
                    'available_quantity' => 200,
                ]);
            } elseif (str_contains($event->name, 'Tech Conference')) {
                TicketType::create([
                    'event_id' => $event->id,
                    'name' => 'Student',
                    'description' => 'Discounted rate for students',
                    'price' => 99.00,
                    'total_quantity' => 100,
                    'available_quantity' => 100,
                ]);

                TicketType::create([
                    'event_id' => $event->id,
                    'name' => 'Regular',
                    'description' => 'Standard conference access',
                    'price' => 299.00,
                    'total_quantity' => 500,
                    'available_quantity' => 500,
                ]);

                TicketType::create([
                    'event_id' => $event->id,
                    'name' => 'Premium',
                    'description' => 'Premium access with networking events',
                    'price' => 599.00,
                    'total_quantity' => 100,
                    'available_quantity' => 100,
                ]);
            } else {
                TicketType::create([
                    'event_id' => $event->id,
                    'name' => 'Standard',
                    'description' => 'Standard event access',
                    'price' => 75.00,
                    'total_quantity' => 300,
                    'available_quantity' => 300,
                ]);

                TicketType::create([
                    'event_id' => $event->id,
                    'name' => 'Premium',
                    'description' => 'Premium experience package',
                    'price' => 150.00,
                    'total_quantity' => 100,
                    'available_quantity' => 100,
                ]);
            }
        }
    }
}
