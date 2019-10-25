<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class State extends Model
{
    public function states()
    {
        return $this->hasMany('App\LGA');
    }
}
