<?php

namespace App\Http\Controllers;

use App\ApiCode;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\ResetPasswordRequest;
use App\Mail\Forgetpassword;
use Illuminate\Support\Facades\Mail;
use Illuminate\Routing\UrlGenerator;


use Validator;

class AuthController extends Controller
{
     public function register(Request $request)
    {
        try{
            $validator = Validator::make($request->all(),[
                'name'=>'required',
                'email'=>'required|email|unique:users',
                'password'=>'required',
                'role'=>'required'
            ]);
    
            if($validator->fails()){
                return response()->json($validator->messages(),422);
            }
            $str_result = '0123456789qwertyuioplkjhgfdsazxcvbnm';
            $length_of_string = 15;
            $input = $request->all();
            $input['password'] = bcrypt($input['password']);
            $input['slug'] = substr(str_shuffle($str_result), 0, $length_of_string);
           
            $user = User::create($input);
    
            $responseArray = [];
            $responseArray['token'] = $user->createToken('MyApp')->accessToken;
            $responseArray['name'] = $user->name;
            $responseArray['role'] = $user->role;
            $responseArray['user_id'] = $user->id;
            
            return response()->json($responseArray,200);  
        } catch(\Exception $e){
            return response()->json(['error'=>$e],500);
        }
       
    }
    public function login(Request $request){ 
        try{
            $validator = Validator::make($request->all(),[
                'email'=>'required|email',
                'password'=>'required',
            ]);
            if($validator->fails()){
                return response()->json($validator->errors(),422);
            }
                if(Auth::attempt(['email'=>$request->email,'password'=>$request->password])){
                    $user = Auth::user();
                    $responseArray = [];
                    $responseArray['token'] = $user->createToken('MyApp')->accessToken;
                    $responseArray['name'] = $user->name;
                    $responseArray['role'] = $user->role;
                    $responseArray['user_id'] = $user->id;
                    
                    return response()->json($responseArray,200);

                }else{
                    return response()->json(['error'=>'Unauthenticated'],203);
                }
            } catch(\Exception $e){
                return response()->json(['error'=>$e],500);
            }
     }
     public function forget(Request $request,UrlGenerator $url){
        try{
            $validator = Validator::make($request->all(),[
                'email'=>'required|email',
            ]);
            if($validator->fails()){
                return response()->json($validator->errors(),422);
            }
            $email = $request->email;
            $user = DB::select(DB::raw("SELECT slug FROM users WHERE email ='$email'"));
            $details['link'] = $url->to("/forgetpassword/".$user[0]->slug);
            $mail = new Forgetpassword($details);
            Mail::to($request->email)->send($mail);
            return response()->json(['msg'=>"reset link send"], 200);

            } catch(\Exception $e){
                return response()->json(['error'=>$e],500);
            }
     }
     public function reset(Request $request) {
        try{
            $validator = Validator::make($request->all(),[
                'password'=>'required',
                'cpassword'=>'required|same:password'
            ]);
            if ($validator->fails()) {
                return redirect()->back()
                            ->withErrors($validator)
                            ->withInput();
            }
        $user  = DB::select(DB::raw("SELECT id FROM users WHERE slug='$request->slug'"));
        $id=$user[0]->id;
        $update = User::findOrFail($id);
        $update->password = bcrypt($request->password);
        $status = $update->save();
        if($status){
            return redirect('/resetsuccess');
        }else{
            return redirect('/reseterror');
            
        }
    } catch(\Exception $e){
        return response()->json(['error'=>$e],500);
    }
       
   
       
    }
    

}
