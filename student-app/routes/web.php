<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Http\Controllers\AuthController;

use Illuminate\Support\Facades\DB;
use App\Models\User;


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
    return view('welcome');
});
Route::get('/forgetpassword/{slug}',function ($slug) {
    $data['slug'] = $slug;
    return view('forgetpassword.forgetpassword',$data);
});

Route::post('/resetsubmit',[AuthController::class,'reset'])->name('reset');
Route::get('/resetsuccess',function(){
    return view('forgetpassword.success');
})->name('resetsuccess');
Route::get('/reseterror',function(){
    return view('forgetpassword.error');
})->name('reseterror');