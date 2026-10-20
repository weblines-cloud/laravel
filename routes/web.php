<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

// Health check for Weblines (Laravel's own /up works too).
Route::get('/health', fn () => response()->json(['status' => 'ok']));
