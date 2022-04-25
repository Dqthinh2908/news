@extends('clients.layout-home')
@section('title','Quên mật khẩu')
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
                    <form action="{{route('client.handleForgetPassword')}}" method="POST" class="">
                        @csrf
                        <div class="auth-form-header">
                            <h3 class="auth-form-heading">Lấy lại mật khẩu</h3>
                        </div>
                        <div class="auth-form-aside">
                            <p href="" class="auth-form-helper">Vui lòng nhập email mà bạn đã đăng ký tài khoản trong hệ thống của chúng tôi    
                            </p>
                        </div>
                        <div class="auth-form-body-list">
                            <div class="auth-form-body-item">
                                <h6>Email</h6>
                                <input type="text" name="email" class="auth-form-body-item-input username" placeholder="Input field ">
                            </div>
                        </div>
                        
                        <div class="auth-form__controls">
                            <button type="submit" class="auth-form__controls-btn-login ">Gửi xác nhận email</button>
                        </div>
                    </form>
            </div>
        </div>
    </div>

@endsection
