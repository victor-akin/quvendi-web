<?php

namespace App;

use App\Helpers\ModelUID;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
     /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $hidden = [
        'id', 
    ];

    /**
     * Get the user that owns a transaction.
     */
    public function user()
    {
        return $this->belongsTo('App\User', 'user_uid', 'user_uid');
    }

    /**
     * create uuid for transactions
     * 
     */
    public static function boot()
    {
        parent::boot();
        self::creating(function ($model) {
            $model->transaction_uid = ModelUID::generate('transactions');
            $model->user_uid = DB::table('users')->select('user_uid')->get()->random()->user_uid;
            // $model->user_uid = ModelUID::generate('transactions');
        });
    }
}
