<?php

/* @var $factory \Illuminate\Database\Eloquent\Factory */

use App\Transaction;
use Faker\Generator as Faker;

$factory->define(Transaction::class, function (Faker $faker) {
    return [
        'amount' => $faker->randomFloat($nbMaxDecimals = 2, $min = 3, $max = 10000),
        'transaction_type' => 'Bill paymanent',
        'month' => $faker->month(),
        'status' => 'completed'
    ];
});
