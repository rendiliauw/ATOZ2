<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Model
{
    use softDeletes;

   

    // public function prepaids(){
    //     return $this->belongsToMany('App\Prepaid');
    // }

    // public function products(){
    //     return $this->belongsToMany('App\Product');
    // }
    
    public function user(){
        return $this->belongsTo('App\User');
    }

    public function prepaids(){
        return $this->morphedByMany('App\Prepaid','orderable');
    }

    public function products(){
        return $this->morphedByMany('App\Product','orderable');
    }

    public function getTotalPriceAttribute($value){

        $result = 'Rp '.number_format($value,0,',','.');
	    return $result;
    }

    public function getCreatedAtAttribute($value){
        return \Carbon\Carbon::parse($value)->format('d-m-Y');
    }

   


    
}
