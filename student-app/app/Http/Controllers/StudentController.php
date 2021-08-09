<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Validator;

class StudentController extends Controller
{
    public function index(Request $request){
        try{
            $validator = Validator::make($request->all(),[
                'user_type'=>'required|string',
            ]);
    
            if($validator->fails()){
                return response()->json($validator->errors(),422);
            }
           $students = DB::table('users')
            ->selectRaw('id,name')
            ->where('role','=',$request->user_type)
            ->get();
            if(!empty($students)){
                return response()->json($students,200);
            }else{
                return response()->json(["message"=>'student does not have any data'],202);
            }
            
        }
        catch(\Exception $e){
            return response()->json(['error'=>$e],500);
        }
    }
    public function category(){
        try {
            $category = DB::select('SELECT id,title FROM category');
             if (!empty($category)) {
                 return response()->json($category, 200);
             } else {
                 return response()->json(["message" => 'catagory does not have any data'], 202);
             }
         } catch (\Exception $e) {
             return response()->json(['error' => $e], 500);
         }
    }
    public function status(){
        try {
            $status = DB::select('SELECT id,title FROM status');
             if (!empty($status)) {
                 return response()->json($status, 200);
             } else {
                 return response()->json(["message" => 'catagory does not have any data'], 202);
             }
         } catch (\Exception $e) {
             return response()->json(['error' => $e], 500);
         }
    }
    public function getTicketById(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'student_id' => 'numeric|required'
            ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            } else {
                $id = $request->student_id;
           $ticket = DB::select("SELECT ticket_id,id,course,issue_title,(SELECT title from category WHERE id = tickets.issue_category)as issue_category ,issue_description,date, (SELECT time from timeslots WHERE id = tickets.timeslot)as timeslot FROM tickets WHERE users_id=$id AND is_cancel = 0 ORDER BY id DESC");
            if (!empty($ticket)) {
                return response()->json($ticket, 200);
            } else {
                return response()->json(["message" => 'ticket does not have any data'], 202);
            }
        }
        } catch (\Exception $e) {
            return response()->json(['error' => $e], 500);
        }
    
    }
    public function lableadchange(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'users_id' => 'numeric|required',
                'role'=>'string|required'
            ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            } else {
           $lablead = User::findOrFail($request->users_id);
           $lablead->role = $request->role;
           $status = $lablead->save();
            if ($status) {
                return response()->json($lablead, 200);
            } else {
                return response()->json(["message" => 'ticket does not have any data'], 202);
            }
        }
        } catch (\Exception $e) {
            return response()->json(['error' => $e], 500);
        }
    
    }
    
}
