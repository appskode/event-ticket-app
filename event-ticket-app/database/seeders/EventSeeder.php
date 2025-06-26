<?php

namespace Database\Seeders;

use App\Models\Event;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Carbon\Carbon;

class EventSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $events = [
            [
                'name' => 'Summer Music Festival 2025',
                'description' => 'The biggest summer music festival featuring top artists from around the world.',
                'location' => 'Central Park, New York',
                'image_url' => 'https://image.jimcdn.com/app/cms/image/transf/none/path/sa6549607c78f5c11/image/i82f8384a1348ab84/version/1554202007/tomorrowland-best-summer-music-festivals-europe.jpg',
                'event_date' => Carbon::now()->addMonths(2),
                'sale_start_date' => Carbon::now(),
                'sale_end_date' => Carbon::now()->addMonths(2)->subDays(1),
                'is_active' => true,
                'allow_cancellation' => true,
                'cancellation_hours_before' => 48,
            ],
            [
                'name' => 'Tech Conference 2025',
                'description' => 'Annual technology conference with industry leaders and innovators.',
                'location' => 'Convention Center, San Francisco',
                'image_url' => 'https://images.stockcake.com/public/2/9/2/292f8e62-8891-41bb-9d82-cf81027244bf_large/tech-conference-speech-stockcake.jpg',
                'event_date' => Carbon::now()->addMonths(3),
                'sale_start_date' => Carbon::now(),
                'sale_end_date' => Carbon::now()->addMonths(3)->subDays(3),
                'is_active' => true,
                'allow_cancellation' => true,
                'cancellation_hours_before' => 72,
            ],
            [
                'name' => 'Food & Wine Festival',
                'description' => 'Culinary experience featuring world-class chefs and wine tastings.',
                'location' => 'Napa Valley, California',
                'image_url' => 'https://www.disneyfoodblog.com/wp-content/uploads/2022/07/2022-WDW-EPCOT-international-food-and-wine-festival-atmosphere-entrance-decorations-stock-9.jpg',
                'event_date' => Carbon::now()->addMonths(1),
                'sale_start_date' => Carbon::now(),
                'sale_end_date' => Carbon::now()->addMonths(1)->subDays(2),
                'is_active' => true,
                'allow_cancellation' => false,
                'cancellation_hours_before' => 0,
            ],
        ];

        foreach ($events as $event) {
            Event::create($event);
        }
    }
}
