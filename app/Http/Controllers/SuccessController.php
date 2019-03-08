<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Order;
use App\Prepaid;
use App\Product;

class SuccessController extends Controller
{
    public function index(Request $request, $id){
    
        
        $result = Order::with('prepaids')->with('products')->with('user')->findOrFail($id);

        return view('success.index',['result' => $result]);
    


    
    }    



    

    public function storepayment(Request $request, $id){

        $mobilenumber = $request->get('mobile_number');
        $shippingaddress = $request->get('shipping_address');

        $storepayment = Order::with('products')->with('prepaids')->findOrFail($id);

        return view('success.payment',['storepayment' => $storepayment,'mobilenumber'=>$mobilenumber,'shippingaddress' =>$shippingaddress]);
       
    }

    public function paymentproses(Request $request){


        $time1 = date('Y-m-d').' '.'09:00:00' ;
        $time2 = date('Y-m-d').' '.'15:00:00' ;
        
           $id = $request->get('id');
           $mobilenumber = $request->get('mobile_number');
           $shippingaddress = $request->get('shipping_address');
           $invoicepayment = $request->get('invoice_number');

           $user = \Auth::user()->id;

           $paymentproses = Order::with('prepaids')->with('products')->where('user_id',$user)->findOrFail($id);

           if($paymentproses->user_id == $user && $paymentproses->status !== 'CANCELED'   ){

            if($paymentproses->invoice_number == $invoicepayment){ 
        
                    if($mobilenumber || !$shippingaddress){
        
                        if($paymentproses->created_at >= $time1 && $paymentproses->created_at <= $time2 ){
                              
                            $paymentproses->status = ordertimesuccess();
        
        
                        }else{
        
                            $paymentproses->status = ordertimefailed();
        
                            
        
                        }
        
                        $paymentproses->update();
        
                        if($paymentproses->status == 'SUCCESS'){
        
                            return redirect()->route('home')->with('status','Pembelian pulsa anda berhasil di proses');
        
                        }else{
        
                            return redirect()->route('home')->with('status','Maaf, Pembelian pulsa anda gagal kami proses');
        
                        }
        
                    }else{
        
                            $paymentproses->status = 'SUCCESS';
                            $paymentproses->shipping_code = shippingCode();
                            $paymentproses->update();
        
                            return redirect()->route('home')->with('status','Sukses, Barang anda akan segera kami antar');  
        
                    }
        
        
            }else{
        
                return redirect()->route('home')->with('status','Failed paid, tidak boleh memasukan Invoice Number lain Atau Salah memasukan invoice number');
        
            }
        
        
        }else{
           
           return redirect()->route('home')->with('status','Failed paid, maaf pembayaran anda gagal karena melebihi waktu yang ditentukan');
        
        }
        
        


    }


    public function trash(){

        $ordertrash = Order::onlyTrashed()->paginate(20);

        return view('success.trash',['ordertrash' => $ordertrash]);


    }

    public function restore($id){
        $order = Order::trashedbin($id);
        
        if($order->trashed()){
            $order->restore();
            return redirect()->route('success.trash')->with('status', 'order successfully restored');
        } else {
            return redirect()->route('success.trash')->with('status', 'order is not in trash');
        }
    }

    public function deletePermanent($id){
        $order = Order::deletebin($id);
      
        if(!$order->trashed()){
          return redirect()->route('success.trash')->with('status', 'order is not in trash!')->with('status_type', 'alert');
        } else {
          $order->products()->detach();
          $order->prepaids()->detach();
          $order->forceDelete();
      
          return redirect()->route('success.trash')->with('status', 'order permanently deleted!');
        }
    }

}
