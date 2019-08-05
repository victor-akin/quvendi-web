<?php

namespace App\Helpers;

use Illuminate\Support\Facades\DB;
use Exception;

class ModelUID
{

    protected $tables = [
        'users' => 'users',
        'transactions' => 'transactions',
    ];

    private static function uid()
    {
        // change $limit to increase number of charaters generated
        $limit = 12;
        return strtoupper(trim(chunk_split(substr(base_convert(sha1(uniqid(mt_rand())), 16, 36), 0, $limit), 4, '-'), '-'));
    }


    public static function generate($table = false)
    {
        if(!$table){
            return abort(403, 'Table does not exist.');
        }

        $columns = [
            'users' => 'user_uid',
            'transactions' => 'transaction_uid',
        ];
        
        $column = $columns[$table];

        $uid = static::uid();

        $uidExists = DB::table($table)->where($column, $uid)->exists();

        if($uidExists){
            return static::generate($table);
        }

        return $uid;
    }

}


