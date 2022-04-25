<div style="width:600px; margin: 0 auto">
    <div style="text-align:center">
        <h2>Xin chào {{ $customer->fullname }}</h2>
        <p>Email này để giúp bạn lấy lại mật khẩu tài khoản đã bị quên</p>
        <p>Vui lòng click vào link dưới đây để đặt lại mật khẩu</p>
        <p>Chú ý: mã xác nhận trong link chỉ có hiệu lực trong 24h</p>
        <p>
            <a href="{{ route('client.getPassword',['id'=>$customer->id, 'token'=>$customer->token]) }}" style="display:inline-block;background: green; color:#fff; padding:7px 25px; font-weight:bold">Kích hoạt tài khoản</a>
        </p>
    </div>

</div>