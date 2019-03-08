<?php 

    if(!function_exists('prepaidValidationForm')){

        function prepaidValidationForm(){

            $validation =  \Validator::make(Request::all(),[

               
                'mobile_number' => 'Required|numeric|regex:(^(081))|digits_between:7,12',
                'value' => 'Required',
                
                    ])->validate();   

            

                return $validation;
                    


                    //-------------------------------------------------------------------------------------------------


        }

        
    }

