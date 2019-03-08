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

    public function scopeHistory ($query){
        return $query->where('user_id',\Auth::user()->id)->orderBy('created_at','DESC');
    }

    public function scopeKeywordorder ($query, $value){
        return $query->where('user_id',\Auth::user()->id)->where('invoice_number','LIKE',"%$value%")->orderBy('created_at','DESC');
    }

    public function scopeDeletehistory ($query, $value){
        return $query->findOrFail($value);
    }

    public function scopeTrashedbin ($query, $value){
        return $query->withTrashed()->findOrFail($value);
    }

    public function scopeDeletebin ($query, $value){
        return $query->withTrashed()->findOrFail($value);
    }


    
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
