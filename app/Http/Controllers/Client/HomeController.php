<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\categories;
use App\Models\posts;
use App\Models\comment;

use Mail;
class HomeController extends Controller
{
    protected $db;
    public function testEmail()
    {
        $name = 'test name for email';
        Mail::send('emails/test',compact('name'),function($email){
            $email->to('quangthinh13@gmail.com','thinhdq');
        });
    }
    public function __construct()
    {
        $this->db = new categories();
        $this->dbPosts = new posts();
    }
    public function index()
    {
        $dataNavBar = categories::all();
        $dataPostsHeath = categories::with('posts')->where('name','sức khỏe')->get();
        $dataPostsHeath = $dataPostsHeath[0];
        $dataPostsSport = categories::with('posts')->where('name','thể thao')->get();
        $dataPostsSport = $dataPostsSport[0];
//        dd($dataPosts);
        return view('clients.dashboard.index',compact('dataNavBar','dataPostsHeath','dataPostsSport'));
    }
    public function getNewsById($id)
    {
        $dataNavBar = categories::all();
        $dataDetail = posts::with('categories')->find($id);
        $postDetailComment = posts::with('comment', 'comment.user')->where('id', $id)->first();
        return view('clients.content.index',compact('dataDetail','dataNavBar','postDetailComment'));
    }

    public function showDashboardLogged()
    {
        $dataNavBar = categories::all();
        $dataPostsHeath = categories::with('posts')->where('name','sức khỏe')->get();
        $dataPostsHeath = $dataPostsHeath[0];
        $dataPostsSport = categories::with('posts')->where('name','thể thao')->get();
        $dataPostsSport = $dataPostsSport[0];
        return view('clients/dashboardLogged/index',compact('dataNavBar','dataPostsHeath','dataPostsSport'));
    }
    public function getNewsByIdLogged($id)
    {
        $dataNavBar = categories::all();
        $dataDetail = posts::with('categories','user')->find($id);
        $postDetailComment = posts::with('comment', 'comment.user')->where('id', $id)->first();
        // dd($postDetailComment);
        return view('clients.content-logged.index',compact('dataDetail','dataNavBar','postDetailComment'));
    }
}
