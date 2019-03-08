@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">Product Title</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <form method="post" action="{{route('product.store')}}">
                    {{csrf_field()}}

                       

                        <div class="form-group">
                            <label for="exampleInputEmail1">Product Title</label>
                            <input type="text" name="title_product" value="{{old('title_product')}}" class="form-control" placeholder="Product title">
                            @if($errors->has('title_product'))<small>{{$errors->first('title_product')}}</small>@endif
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Shipping Address</label>
                            <textarea class="form-control" name="shipping_address" rows="3" placeholder="Shipping address">{{old('shipping_address')}}</textarea>
                            @if($errors->has('shipping_address'))<small>{{$errors->first('shipping_address')}}</small>@endif
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Price</label>
                            <input type="text" name="price" class="form-control" value="{{old('price')}}" placeholder="Price">
                            @if($errors->has('price'))<small>{{$errors->first('price')}}</small>@endif
                        </div>

                       
                        
                        <div class="text-center">
                            <button type="submit" name="submit" value="submit" class="btn btn-primary btn-sm">Submit</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection