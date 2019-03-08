<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Order;



class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {

      
    $keyword = $request->get('keyword') ? $request->get('keyword') : '';    
                

        if($keyword){

            $show= Order::keywordorder($keyword)->paginate(20);

        }else{

            $show= Order::history()->paginate(20);
           
            }
        
       

        return view('home',['show' => $show]);
    
    }

    public function delete($id){


        $deleteorder = Order::deletehistory($id);
        $deleteorder->delete();


        return redirect()->route('home')->with('status','Data transaksi berhasil di hapus');


    }

  

    
}
