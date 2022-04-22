<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class roles extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $table = 'roles';
    protected $guarded = [];

    public function user()
    {
        return $this->belongsToMany(user::class,'user_role','role_id','user_id');
    }
    public function permissions()
    {
        return $this->belongsToMany(permissions::class,'role_permission','role_id','permission_id');
    }

}
