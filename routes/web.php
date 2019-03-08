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
Auth::routes();

Route::group(['middleware'=>'auth'], function(){

    Route::get('/success/trash','SuccessController@trash')->name('success.trash');
    Route::get('/', 'HomeController@index')->name('home');
    Route::get('/home', 'HomeController@index');
    Route::get('/home/delete/{id}','HomeController@delete')->name('home.delete');   
    Route::get('/success/{id}', 'SuccessController@index')->name('success.index');
    Route::post('/storepayment/{id}', 'SuccessController@storepayment')->name('success.storepayment');
    Route::get('/payment', 'SuccessController@payment')->name('success.payment');
    Route::post('/paymentproses','SuccessController@paymentproses')->name('success.paymentproses');
    Route::post('/success/{id}/restore', 'SuccessController@restore')->name('success.restore');
    Route::delete('/success/{id}/delete-permanent', 'SuccessController@deletePermanent')->name('success.delete-permanent');
  


    Route::resource('prepaid','PrepaidController');
    Route::resource('product','ProductController');
    





});

