<?php

use Illuminate\Support\Facades\Route;



use App\Http\Controllers\AuthController;

Route::view('/login', 'auth.login')->name('login');
Route::view('/register', 'auth.register')->name('register');
Route::view('/principal', 'principal')->name('principal')->middleware('auth');

Route::view('/welcome', 'welcome')->name('welcome');

// Rutas de procesamiento
Route::post('/register', [AuthController::class, 'register'])->name('register');
Route::post('/login', [AuthController::class, 'login'])->name('login');

// Ruta para cerrar sesión
Route::get('/logout', [AuthController::class, 'logout'])->name('logout');
