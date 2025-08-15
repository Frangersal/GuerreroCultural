<?php

use Illuminate\Support\Facades\Route;
use App\Models\User;

Route::get('/', function () {
    $user = User::first(); // toma el primer usuario
    return view('welcome', compact('user'));
});