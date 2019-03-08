<?php 

    if(!function_exists('generateCode')){

        function generateCode(){

            $prefix = rand(100,500).date('dm').rand(10,99) ;
            $codelength = 10;
     
             
            $db = DB::table('orders');
            $db->select(DB::raw('max("invoice_number") as maxkode'));
            $db->where('invoice_number', 'LIKE', "%$prefix%");
     
            $get = $db->first();
            $data = $get->maxkode;
     
            if($db->count() > 0){
     
             $code = substr($data, strlen($prefix));
             $countcode = 1+1;
     
            }else{
                $countcode = 1;
            }
     
            $newcode = $prefix.str_pad($countcode, $codelength - strlen($prefix), "0", STR_PAD_LEFT);

            return $newcode;
     
     
            //-------------------------------------------------------------------------------------------------


        }

        
    }
    