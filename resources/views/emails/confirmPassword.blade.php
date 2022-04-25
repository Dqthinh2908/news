@extends('clients.layout-home')
@section('title','Đặt lại mật khẩu')
@section('content')
    <div class="container">
        <div class="modal__bodys">
            <div class="auth-form">
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                    @if(session('msg'))
                        <div class="alert alert-{{session('type')}}">
                            {{session('msg')}}
                        </div>
                    @endif
                    <form action="{{ route('client.handleGetPassword',['id'=>$idUser]) }}" method="post" role="form">
                        @csrf
                        <div class="auth-form-header">
                            <h3 class="auth-form-heading">Đặt lại mật khẩu</h3>
                        </div>
                        <div class="auth-form-body-list">
                            <div class="auth-form-body-item">
                                <h6>Mật khẩu</h6>
                                <input type="password" name="password" class="auth-form-body-item-input username" placeholder="Input field ">
                            </div>
                            <div class="auth-form-body-item">
                                <h6>Nhập lại mật khẩu</h6>
                                <input type="password" name="confirm_password" class="auth-form-body-item-input username" placeholder="Input field ">
                            </div>
                        </div>
                        
                        <div class="">
                            <button type="submit" class="auth-form__controls-btn-login ">Đặt lại mật khẩu</button>
                        </div>
                    </form>
            </div>
        </div>
    </div>

@endsection
