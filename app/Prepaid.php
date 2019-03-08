<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Prepaid extends Model
{
    // public function orders(){
    //     return $this->belongsToMany('App\Order');
    // }

    public function orders(){
        return $this->morphToMany('App\Order','orderable');
    }

    


    public function getPriceAttribute($value){

        $result = 'Rp '.number_format($value,0,',','.');
	    return $result;

    }



}
