<?php

namespace App\Http\Controllers;

use App\Models\assigns;
use App\Models\Ticket;
use App\Mail\TicketClosed;
use App\Mail\TicketAssigned;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Validator;

class AssignController extends Controller
{
   
  
    public function labassign(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'ticket_id' => 'numeric|required',
                'labmem_id' => 'numeric|required',
                'timeslot' => 'numeric|required',
            ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            } else {
                $sql = DB::table('status')
                ->where('title','=','created')
                ->get();
                $assigns =new assigns();
                $assigns->ticket_id = $request->ticket_id;
                $assigns->user_id = $request->labmem_id;
                $assigns->timeslot = $request->timeslot;
                $assigns->status = $sql[0]->id;
                $status = $assigns->save();
                if (!empty($status)) {
                    $ticket = Ticket::findOrFail($request->ticket_id);
                    $ticket->is_assigned = true;
                    $status = $ticket->save();
                    $user = DB::select(DB::raw('SELECT email FROM users WHERE id = '.$request->labmem_id));
                    if($status){
                        $mail = new TicketAssigned($ticket);
                        Mail::to($user[0]->email)->send($mail);
                        return response()->json($assigns, 200);
                    }else{
                        return response()->json(["message" => 'ticket fail to updated'], 202);
                    }  
                } else {
                    return response()->json(["message" => 'ticket does not assigned'], 202);
                }
            }
        } catch (\Exception $e) {
            return response()->json(['error' => $e], 500);
        }
    }
   
    public function assignstatus(Request $request){
        
        try {
            $validator = Validator::make($request->all(), [
                'ticket_id' => 'numeric|required',
                'status' => 'numeric|required',
            ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            } else {
                $assign = assigns::findOrFail($request->ticket_id);
                $assign->status = $request->status;
                $status = $assign->save();
                if (!empty($status)) {
                    if($request->status === 4){
                        $app =  DB::select('SELECT ticket_id,issue_title,issue_description,(SELECT email FROM users WHERE id= tickets.users_id)as email FROM tickets WHERE id='.$assign->ticket_id);
                        $response = [];
                        $response['ticket_id'] = $app[0]->ticket_id;
                        $response['title'] = $app[0]->issue_title;
                        $response['description'] = $app[0]->issue_description;
                        $mail = new TicketClosed($response);
                        Mail::to($app[0]->email)->send($mail);
                        return response()->json($assign, 200);
                    }else{
                        return response()->json(["message" => 'email does not go '], 202);
                    } 
                } else {
                    return response()->json(["message" => 'status field not updated error'], 202);
                }
            }

        } catch (\Exception $e) {
            return response()->json(['error' => $e], 500);
        }
    }
    public function assigndes(Request $request){
        
        try {
            $validator = Validator::make($request->all(), [
                'ticket_id' => 'numeric|required',
                'description' => 'required',
            ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            } else {
                $assign = assigns::findOrFail($request->ticket_id);
                $assign->description = $request->description;
                $status = $assign->save();
                if (!empty($status)) {
                    return response()->json($assign, 200);
                } else {
                    return response()->json(["message" => 'description field not updated error'], 202);
                }
            }

        } catch (\Exception $e) {
            return response()->json(['error' => $e], 500);
        }
    }
    public function creator(Request $request)
    {
        try {

            $validator = Validator::make($request->all(), [
                'labmem_id' => 'numeric|required',
                'status' =>'numeric|required'
            ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            } else {
           $assigns = DB::select(DB::raw("SELECT assigns.id,tickets.ticket_id,name,course,issue_title,(SELECT title from category WHERE id = tickets.issue_category)as issue_category,issue_description ,(SELECT title FROM status WHERE id=assigns.status) AS status,date, (SELECT time FROM timeslots WHERE id = assigns.timeslot)as timeslots FROM assigns INNER JOIN tickets ON assigns.ticket_id = tickets.id WHERE assigns.user_id =$request->labmem_id AND status=$request->status ORDER BY assigns.id DESC"));
                if (count($assigns) === 0) {

                    return response()->json(["message" => ' does not have ticket'], 202);
                } else {
                    
                    return response()->json(["data"=>$assigns,"counts"=>count($assigns)], 200);
                }
            }
        } catch (\Exception $e) {
            return response()->json(['error' => $e], 500);
        }
    }
    public function assignaccept(Request $request){
        
        try {
            $validator = Validator::make($request->all(), [
                'ticket_id' => 'numeric|required',
            ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            } else {
                $assign = assigns::find($request->ticket_id);
                $status = $assign->delete();
                if (!empty($status)) {
                    $ticket = Ticket::findOrFail($assign->ticket_id);
                    $ticket->is_assigned = false ;
                    $status = $ticket->save();
                    if($status){
                        return response()->json([$ticket,$assign], 200);
                    }else{
                        return response()->json(["message" => 'ticket fail to updated'], 202);
                    }  
                } else {
                    return response()->json(["message" => 'accepted field not updated error'], 202);
                }
            }

        } catch (\Exception $e) {
            return response()->json(['error' => $e], 500);
        }
    }
    public function labheadview(Request $request)
    {
        try {

            $validator = Validator::make($request->all(), [
                'status' =>'numeric|required'
            ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            } else {
              $assigns = DB::select(DB::raw("SELECT tickets.ticket_id,name,course,issue_title,(SELECT title from category WHERE id = tickets.issue_category)as issue_category,issue_description ,(SELECT title FROM status WHERE id=assigns.status) AS status,date,(SELECT time FROM timeslots WHERE id = assigns.timeslot)as timeslot FROM assigns INNER JOIN tickets ON assigns.ticket_id = tickets.id WHERE status=$request->status ORDER BY assigns.id DESC"));
                if (count($assigns) === 0) {

                    return response()->json(["message" => ' does not have ticket'], 202);
                } else {
                    
                    return response()->json(["data"=>$assigns,"count"=>count($assigns)], 200);
                }
            }
        } catch (\Exception $e) {
            return response()->json(['error' => $e], 500);
        }
    }
    public function labmemSpcific(Request $request)
    {
        try {

            $validator = Validator::make($request->all(), [
                'labmem_id' => 'numeric|required',
                'assign_id' => 'numeric|required'
            ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            } else {
           $assigns = DB::select(DB::raw("SELECT assigns.id,tickets.ticket_id,name,course,issue_title,(SELECT title from category WHERE id = tickets.issue_category)as issue_category,issue_description ,(SELECT title FROM status WHERE id=assigns.status) AS status,date, (SELECT time FROM timeslots WHERE id = assigns.timeslot)as timeslots FROM assigns INNER JOIN tickets ON assigns.ticket_id = tickets.id WHERE assigns.user_id =$request->labmem_id AND assigns.id = $request->assign_id"));
                if (count($assigns) === 0) {

                    return response()->json(["message" => ' does not have ticket'], 202);
                } else {
                    
                    return response()->json($assigns[0], 200);
                }
            }
        } catch (\Exception $e) {
            return response()->json(['error' => $e], 500);
        }
    }
    
    
}