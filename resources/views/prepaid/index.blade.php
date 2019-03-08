@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">Prepaid Balance</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <form method="post" action="{{route('prepaid.store')}}">
                    {{csrf_field()}}

                       

                        <div class="form-group">
                            <label for="exampleInputEmail1">Mobile Number</label>
                            <input type="text" name="mobile_number" value="{{old('mobile_number')}}" class="form-control" placeholder="Mobile Number">
                            @if($errors->has('mobile_number'))<small>{{$errors->first('mobile_number')}}</small>@endif
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Value</label>
                            <select class="form-control" name='value' value="{{old('value')}}">
                            <option value=''>Choose Value</option>
                            @foreach($value as $result)
                            <option value="{{$result}}">{{'Rp '.$result}}</option>
                            @endforeach
                            </select>
                            @if($errors->has('value'))<small>{{$errors->first('value')}}</small>@endif
                        </div>
                        
                        <div class="text-center">
                            <button type="submit" name="submit" value="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection