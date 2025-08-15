<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        User::create([
            'name' => 'Francisco',
            'email' => 'francisco@example.com',
            'password' => bcrypt('123456')
        ]);

        // Puedes crear más si quieres
        User::factory()->count(5)->create(); // usando factories
    }
}
