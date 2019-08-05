<?php

namespace App;

use Webpatser\Uuid\Uuid;
use App\Helpers\ModelUID;
use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'lastname', 'firstname', 'email', 'password', 'phone_no'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * The transactions of a user
     * 
     */
    public function transactions()
    {
        return $this->hasMany('App\Transaction', 'user_uid', 'user_uid');
    }
    
    /**
     * Create uuid for users
     * 
     */
    public static function boot()
    {
        parent::boot();
        self::creating(function ($model) {
            $model->user_uid = ModelUID::generate('users');
        });
    }
}


