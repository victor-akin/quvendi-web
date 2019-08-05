<?php

namespace App\GraphQL\Queries;

use App\Transaction;
use Illuminate\Support\Facades\Auth;
use GraphQL\Type\Definition\ResolveInfo;
use Nuwave\Lighthouse\Support\Contracts\GraphQLContext;

class Transactions
{
    /**
     * Return a value for the field.
     *
     * @param  null  $rootValue Usually contains the result returned from the parent field. In this case, it is always `null`.
     * @param  mixed[]  $args The arguments that were passed into the field.
     * @param  \Nuwave\Lighthouse\Support\Contracts\GraphQLContext  $context Arbitrary data that is shared between all fields of a single query.
     * @param  \GraphQL\Type\Definition\ResolveInfo  $resolveInfo Information about the query itself, such as the execution state, the field name, path to the field from the root, and more.
     * @return mixed
     */
    public function resolve($rootValue, array $args, GraphQLContext $context, ResolveInfo $resolveInfo)
    {
       if(!Auth::guard('api')->check()){
           return ['status'=> 'dummy data'];
       } else {
           // get user_uid
           $user_uid = Auth::guard('api')->user()->user_uid;

           // get latest transactions of user with user_uid
           $transactions = Transaction::orderBy('created_at','desc')->where('user_uid', $user_uid)->take(10)->get();
        
           return $transactions;   
       }
    }
}
