<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    // var_dump($_SERVER);
    // echo extension_loaded('pgsql') ? 'yes':'no';
    // phpinfo();
    return view('welcome');
});
