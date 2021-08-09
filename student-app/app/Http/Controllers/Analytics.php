<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\DB;
use Validator;
use Illuminate\Http\Request;

class Analytics extends Controller
{
    public function index(Request $request){
        try {

            $validator = Validator::make($request->all(), [
                'month' =>'numeric|required',
                'year'=>'numeric|required'
                // 'courses'=>'required'

            ]);
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            } else {
                $month = $request->month;
                $year = $request->year;
                //pie chart
                $pie = ['created','pending','inprogress','closed'];
                $pie_data = [];
                // $created = DB::select(DB::raw("SELECT count(assigns.id)  as cout FROM assigns INNER JOIN tickets ON assigns.ticket_id = tickets.id WHERE tickets.course = '$request->courses' AND status=1 AND month(`assigns`.`created_at`) = $month AND year(`assigns`.`created_at`) = $year"));
                // $pending= DB::select(DB::raw("SELECT count(assigns.id)  as cout FROM assigns INNER JOIN tickets ON assigns.ticket_id = tickets.id WHERE tickets.course = '$request->courses' AND  status=2 AND month(`assigns`.`created_at`) = $month AND year(`assigns`.`created_at`) = $year"));
                // $inprogress = DB::select(DB::raw("SELECT count(assigns.id)  as cout FROM assigns INNER JOIN tickets ON assigns.ticket_id = tickets.id WHERE tickets.course = '$request->courses' AND  status=3 AND month(`assigns`.`created_at`) = $month AND year(`assigns`.`created_at`) = $year"));
                // $closed =  DB::select(DB::raw("SELECT count(assigns.id)  as cout FROM assigns INNER JOIN tickets ON assigns.ticket_id = tickets.id WHERE tickets.course = '$request->courses' AND  status=4 AND month(`assigns`.`created_at`) = $month AND year(`assigns`.`created_at`) = $year"));
                
                $created = DB::select(DB::raw("SELECT count(assigns.id)  as cout FROM assigns INNER JOIN tickets ON assigns.ticket_id = tickets.id  AND status=1 AND month(`assigns`.`created_at`) = $month AND year(`assigns`.`created_at`) = $year"));
                $pending= DB::select(DB::raw("SELECT count(assigns.id)  as cout FROM assigns INNER JOIN tickets ON assigns.ticket_id = tickets.id  AND  status=2 AND month(`assigns`.`created_at`) = $month AND year(`assigns`.`created_at`) = $year"));
                $inprogress = DB::select(DB::raw("SELECT count(assigns.id)  as cout FROM assigns INNER JOIN tickets ON assigns.ticket_id = tickets.id  AND  status=3 AND month(`assigns`.`created_at`) = $month AND year(`assigns`.`created_at`) = $year"));
                $closed =  DB::select(DB::raw("SELECT count(assigns.id)  as cout FROM assigns INNER JOIN tickets ON assigns.ticket_id = tickets.id  AND  status=4 AND month(`assigns`.`created_at`) = $month AND year(`assigns`.`created_at`) = $year"));

                $pie_data[] = $created[0]->cout;
                $pie_data[] = $pending[0]->cout;
                $pie_data[] = $inprogress[0]->cout;
                $pie_data[] =$closed[0]->cout;
                // horizontal bar chart
                $h_bar = DB::select('select id,name from users where role="labmember"');
                $h_label = [];
                $h_data = [];
                foreach($h_bar as $key => $value){
                    $h_label[$key] = $value->name; 
                    $id=$value->id;
                    $created =  DB::table('assigns')
                    ->where('user_id','=',$id)
                    ->where('status','=',1)
                    ->whereMonth('created_at', '=',$month)
                    ->whereYear('created_at', '=', $year)
                    ->get();
                    $pending=  DB::table('assigns')
                    ->where('user_id','=',$id)
                    ->where('status','=',2)
                    ->whereMonth('created_at', '=',$month)
                    ->whereYear('created_at', '=', $year)
                    ->get();
                    $inprogress =  DB::table('assigns')
                    ->where('user_id','=',$id)
                    ->where('status','=',3)
                    ->whereMonth('created_at', '=',$month)
                    ->whereYear('created_at', '=', $year)
                    ->get();
                    $closed=  DB::table('assigns')
                    ->where('user_id','=',$id)
                    ->where('status','=',4)
                    ->whereMonth('created_at', '=',$month)
                    ->whereYear('created_at', '=', $year)
                    ->get();
                    $h_data[$key][] = count($created);
                    $h_data[$key][] = count($pending);
                    $h_data[$key][] = count($inprogress);
                    $h_data[$key][] = count($closed);
                }
            
                // vertical bar chart
                $v_label = ['jan', 'feb', 'mar', 'apr', 'may','jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec'];
                $v_labels=[];
                $v_data = [];
                for($i = 0 ; $i<$month ;$i++) {
                    // $date = $month !== 12 ? '0'.$i+1 : $month;
                    $v_labels[$i] = $v_label[$i];
                    $ticket =  DB::table('tickets')
                    ->where('is_cancel','=',false)
                    ->whereMonth('created_at', '=',$i+1 )
                    ->whereYear('created_at', '=', $year)
                    ->get();
                     $v_data[$i] = count($ticket); 
                }
                    return response()->json(["pie_chart"=>["label"=>$pie,"data"=>$pie_data],"hbar_chart"=>["label"=>$h_label,"data"=>$h_data],"vbar_chart"=>["label"=>$v_labels,"data"=>$v_data]], 200);
             }
        } catch (\Exception $e) {
            return response()->json(['error' => $e], 500);
        }
    }
}
