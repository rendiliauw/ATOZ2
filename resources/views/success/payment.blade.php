@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">Pay your order</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <form method="post" action="{{route('success.paymentproses',['id'=>$storepayment->id])}}">
                    
                    
                    {{--  {{method_field('PUT')}}  --}}
                    {{csrf_field()}}
                    

                        <input type="hidden" name="id" value="{{$storepayment->id}}">

                        <div class="form-group">
                            <input type="text" name="invoice_number" value="{{$storepayment->invoice_number}}" class="form-control text-center" placeholder="Order no" required>
                        </div>

                        <div class="form-group">
                            <input type="hidden" name="mobile_number" value="{{$mobilenumber}}" class="form-control text-center">
                        </div>

                        <div class="form-group">
                            <input type="hidden" name="shipping_address" value="{{$shippingaddress}}" class="form-control text-center">
                        </div>

                       
                        
                        <div class="text-center">
                            <button type="submit" name="submit_payment" value="SUCCESS" class="btn btn-primary mt-3 btn-sm">Submit</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection