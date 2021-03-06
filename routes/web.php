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
  
    // echo ModelUID::generate('transactions');
    return redirect('/admin');
    // return view('welcome');
});

Auth::routes();

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});


Route::get('/tq', function() {
    $user = App\User::find(1);
    return json_encode(['response' => $user]);
});