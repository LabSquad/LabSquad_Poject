<?php

namespace App\Http\Controllers;

use App\Models\Ticket;
use App\Models\Timeslots;
use App\Mail\TicketMail;
use App\Mail\TicketCancel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

use Validator;

class TicketsController extends Controller
{
    public function index(Request $request)
    {
        try {
           $ticket = DB::select('SELECT id,ticket_id,name,course,issue_title,(SELECT title from category WHERE id = tickets.issue_category)as issue_category ,issue_description,date,timeslot,users_id as student_id FROM tickets WHERE is_assigned=false AND is_cancel = false ORDER BY id DESC');
           foreach($ticket as $key => $val){
            $t = $val->timeslot;
             $times = DB::select("SELECT id,time FROM timeslots WHERE id IN ($t)");
            $val->timeslot=$times;
           }
            if (!empty($ticket)) {
                return response()->json($ticket, 200);
            } else {
                return response()->json(["message" => 'ticket does not have any data'], 202);
            }
        } catch (\Exception $e) {
            return response()->json(['error' => $e], 500);
        }
    }
    public function store(Request $request)
    {
        // try {
            $validator = Validator::make($request->all(), [
                'name' => 'string|required',
                'course' => 'string|required',
                'issue_title' => 'string|required',
                'issue_category' => 'numeric|required',
                'issue_description' => 'string|required',
                'date' => 'string|required',
                'timeslot' => 'required',
                'student_id' => 'numeric|required',
            ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            } else {
                $str_result = '0123456789';
                $timeslo = implode(',',$request->timeslot);
                $length_of_string = 6;
                $tkt =  "TKT" . substr(str_shuffle($str_result), 0, $length_of_string);
                $app = new Ticket();
                $app->ticket_id = $tkt;
                $app->name =$request->name  ;
                $app->course = $request->course;
                $app->issue_title = $request->issue_title ;
                $app->issue_category = $request->issue_category;
                $app->issue_description = $request->issue_description;
                $app->date = $request->date;
                $app->timeslot ="$timeslo";
                $app->users_id = $request->student_id;
                $status = $app->save();
                if (!empty($status)) {
                    $response = [];
                    $response['id'] = $app->id;
                    $response['ticket_id'] = $app->ticket_id;
                    $response['name'] = $app->name;
                    $response['course'] = $app->course;
                    $response['issue_title'] = $app->issue_title;
                    $response['issue_category'] = $app->issue_category;
                    $response['issue_description'] = $app->issue_description;
                    $response['date'] = $app->date;
                    $response['student_id'] = $app->users_id;
                    $user = DB::select(DB::raw('SELECT email FROM users WHERE id = '.$app->users_id));
                    if(!empty($user)){
                        $mail = new TicketMail($response);
                        Mail::to($user[0]->email)->send($mail);
                        return response()->json($response, 200);
                    }else{
                        return response()->json(["message" => 'email does not have '], 202);
                    }      
                } else {
                    return response()->json(["message" => 'Tickets does not have any data'], 202);
                }
            }
        // } catch (\Exception $e) {
        //     return response()->json(['error' => $e], 500);
        // }
    }
    public function specific(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'ticket_id' => 'numeric|required'
            ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            }
           $ticket = DB::select('SELECT id,(SELECT name FROM users WHERE id=tickets.users_id)as name,course,issue_title,(SELECT title from category WHERE id = tickets.issue_category) as issue_category,issue_description,date,(SELECT time from timeslots WHERE id = tickets.timeslot)as timeslot,users_id as student_id FROM tickets WHERE id='.$request->ticket_id);
            if (!empty($ticket)) {
                return response()->json($ticket, 200);
            } else {
                return response()->json(["message" => 'ticket does not have any data'], 202);
            }
        } catch (\Exception $e) {
            return response()->json(['error' => $e], 500);
        }
    }
    public function timeAvailable(){
    try{
        $timeReserved = [];
        $count = 0;
        $time = DB::select(DB::raw("SELECT id,time FROM timeslots WHERE available = TRUE"));
        foreach($time as $value){
            $slot = DB::table('assigns')
                    ->where('timeslot','=',$value->id)
                    ->whereDay('created_at', '=', date('d'))
                    ->whereMonth('created_at', '=', date('m'))
                    ->whereYear('created_at', '=', date('Y'))
                    ->get();
            if(count($slot) >= 5){
                $timeReserved[$count]['id'] = $value->id;
                $timeReserved[$count]['time'] = $value->time;
                $timeReserved[$count]['reserved'] = true;
            }else{
                $timeReserved[$count]['id'] = $value->id;
                $timeReserved[$count]['time'] = $value->time;
                $timeReserved[$count]['reserved'] = false;
            }
            $count++;
           
        }
        if (!empty($timeReserved)) {
            return response()->json($timeReserved, 200);
        } else {
            return response()->json(["message" => 'time db does not have any data'], 202);
        }

    } catch (\Exception $e) {
        return response()->json(['error' => $e], 500);
    }
    }
    public function addtime(Request $request){
        try{
            $validator = Validator::make($request->all(), [
                'time_slot' => 'required'
            ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            }
            $time = new Timeslots();
            $time->time = $request->time_slot;
            $time->save();
            if (!empty($time)) {
                return response()->json($time, 200);
            } else {
                return response()->json(["message" => 'time db does not have any data'], 202);
            }
    
        } catch (\Exception $e) {
            return response()->json(['error' => $e], 500);
        }
        }
        public function updatetime(Request $request){
            try{
                $validator = Validator::make($request->all(), [
                    'timeslot_id' =>'numeric|required',
                    'time_available' => 'boolean|required'
                ]);
                if ($validator->fails()) {
                    return response()->json($validator->errors(), 422);
                }
                $time = Timeslots::findOrFail($request->timeslot_id);
                $time->available = $request->time_available;
                $status = $time->save();
                if ($status) {
                    return response()->json($time, 200);
                } else {
                    return response()->json(["message" => 'time db does not have any data'], 202);
                }
        
            } catch (\Exception $e) {
                return response()->json(['error' => $e], 500);
            }
            }
            public function gettimes(){
                try{
                   
                    $time = DB::select(DB::raw('SELECT id,time,available FROM timeslots'));
                    
                    if (!empty($time)) {
                        return response()->json($time, 200);
                    } else {
                        return response()->json(["message" => 'time db does not have any data'], 202);
                    }
            
                } catch (\Exception $e) {
                    return response()->json(['error' => $e->getMessage()], 500);
                }
                }
        public function ticketCancel(Request $request){
            try{
                $validator = Validator::make($request->all(), [
                    'ticket_id' =>'numeric|required',
                ]);
                if ($validator->fails()) {
                    return response()->json($validator->errors(), 422);
                }
                $ticket = Ticket::findOrFail($request->ticket_id);
                $ticket->is_cancel = true;
                $status = $ticket->save();
                $user = DB::select(DB::raw('SELECT email FROM users WHERE id = '.$ticket->users_id));
                if ($status) {
                    if($ticket->is_assigned == "1"){
                        $id = $ticket->id;
                        $assign = DB::select(DB::raw("DELETE FROM assigns WHERE ticket_id = $id"));
                        $mail = new TicketCancel($ticket);
                        Mail::to($user[0]->email)->send($mail);
                        return response()->json(["msg"=>"ticket cancelled"], 200);
                    }else{
                        $mail = new TicketCancel($ticket);
                        Mail::to($user[0]->email)->send($mail);
                        return response()->json($ticket, 200);
                    }
                } else {
                    return response()->json(["message" => 'time db does not have any data'], 202);
                }
        
            } catch (\Exception $e) {
                return response()->json(['error' => $e], 500);
            }
        }
}
