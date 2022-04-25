<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\categories;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\PostRegisterRequest as PostRegister;
use App\Http\Requests\PostLoginClientRequest as PostLogin;
use App\Models\User;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class LoginController extends Controller
{
    protected $user;
    public function __construct(User $user)
    {
        $this->user = $user;
    }
    public function index()
    {
        $dataNavBar = categories::all();
        return view('clients/login/index',compact('dataNavBar'));
    }
    public function handleLogin(PostLogin $request)
    {
        
        $username = $request->input('usernane');
        $password = $request->input('password');

        if (Auth::attempt(['name' => $username, 'password' => $password])) {
            // Authentication was successful...
            $request->session()->put('sessionUserName',$username);
            $request->session()->put('sessionIdUser',Auth::id());
            return redirect()->route('client.showDashboardLogged');
        }
        else{
            return redirect()->back()->with('msg','Thông tin đăng nhập không chính xác, vui lòng đăng nhập lại');
        }
    }
    public function showModalRegister()
    {
        $dataNavBar = categories::all();
        return view('clients/login/register',compact('dataNavBar'));
    }
    public function handleRegister(PostRegister $request)
    {
        $dataInsert = [
            'name'=>$request->name,
            'fullname'=>$request->fullname,
            'email'=>$request->email,
            'password'=>bcrypt($request->password),
            'level'=>2,
        ];
        $user = User::create($dataInsert);
        $roleIds = 8;
        $user->roles()->attach($roleIds);
        if($user)
        {
            return back()->with('msg','Đăng kí tài khoản thành công')->with('type','success');
        }else{
            return back()->with('msg','Đăng kí thất bại, vui lòng kiểm tra lại')->with('type','danger');
        }
    }
    public function handleLogout(Request $request)
    {
        $request->session()->forget('sessionUserName','sessionIdUser');
        return redirect()->route('client.home');
    }

    public function showForgetPassword()
    {
        $dataNavBar = categories::all();
        return view('clients/login/forgerPassword',compact('dataNavBar'));
    }
    public function handleForgetPassword(Request $request)
    {
        $request->validate([
            'email'=>'required|exists:users'
        ],[
            'email.required'=>'Vui lòng nhập địa chỉ email',
            'email.exists'=>'Email này không tồn tại trong hệ thống, vui lòng nhập lại'
        ]);
        $token = strtoupper(Str::random(10));
        $customer = User::where('email',$request->email)->first();
        $customer->update(['token' =>$token]);
        
        Mail::send('emails/getPassword',compact('customer'),function($email) use($customer){
            $email->subject('Báo dân trí - Lấy lại mật khẩu tài khoản');
            $email->to($customer->email,$customer->fullname);
            
        });
        return redirect()->back()->with('msg','Vui lòng check email để thực hiện thay đổi mật khẩu')->with('type','success');
    }
    public function getPassword(User $user,$id,$token) 
    {
        $infoUser = User::where('id',$id)->first();
        $idUser = $id;
        $dataNavBar = categories::all();
        if($infoUser->token === $token)
        {
            return view('emails/confirmPassword',compact('dataNavBar','idUser'));
        }
        return abort(404);
    }
    public function handleGetPassword(User $user,$id, Request $request)
    {
        $request->validate([
            'password'=>'required',
            'confirm_password'=>'required|same:password'
        ],[ 
            'password.required'=>'Mật khẩu không được để trống',
            'confirm_password.required'=>'Nhập lại mật khẩu không được để trống',
            'confirm_password'=>'Mật khẩu chưa khớp',
        ]);
        $password_h = bcrypt($request->password);
        $user->find($id)->update(['password'=> $password_h,'token'=>null]);
        return redirect()->route('client.modalLogin')->with('msg','Đổi mật khẩu thành công bạn có thể đăng nhập')->with('type','success');
    }
}
