<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\TicketsController;
use App\Http\Controllers\AssignController;
use App\Http\Controllers\Analytics;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/signup',[AuthController::class,'register']);
Route::post('/login',[AuthController::class,'login']);
Route::get('/userByType',[StudentController::class,'index']);
Route::put('/userRoleChange',[StudentController::class,'lableadchange']);
Route::get('/category',[StudentController::class,'category']);
Route::get('/timeslots',[TicketsController::class,'gettimes']);
Route::get('/timeslots/reserve',[TicketsController::class,'timeAvailable']);
Route::post('/timeslots',[TicketsController::class,'addtime']);
Route::put('/timeslots/available',[TicketsController::class,'updatetime']);
Route::get('/ticketStatus',[StudentController::class,'status']);
Route::get('/student/ticket',[StudentController::class,'getTicketById']);
Route::get('/alltickets',[TicketsController::class,'index']);
Route::get('/ticket',[TicketsController::class,'specific']);
Route::put('/ticket/cancel',[TicketsController::class,'ticketCancel']);
Route::post('/ticket/memberTicketsByStatus',[AssignController::class,'creator']);
Route::get('/ticket/allTicketsByStatus',[AssignController::class,'labheadview']);
Route::put('/assign/status',[AssignController::class,'assignstatus']);
Route::post('/assign/taskreject',[AssignController::class,'assignaccept']);
Route::put('/assign/updateDesc',[AssignController::class,'assigndes']);
Route::post('/ticket/assigns',[AssignController::class,'labassign']);
Route::post('/ticket',[TicketsController::class,'store']);
Route::post('/forget',[AuthController::class,'forget']);
Route::post('/analytics',[Analytics::class,'index']);
Route::get('/ticket/labmem',[AssignController::class,'labmemSpcific']);


