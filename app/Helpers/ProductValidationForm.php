<?php 

    if(!function_exists('productValidationForm')){

        function productValidationForm(){

            $validation =  \Validator::make(Request::all(),[

               
                'title_product' => 'required|min:10|max:150',
                'shipping_address' => 'required|min:10|max:150',
                'price'=> 'Required|digits_between:0,10'
               
                    ])->validate();   

            

                return $validation;
                    


                    //-------------------------------------------------------------------------------------------------


        }

        
    }


