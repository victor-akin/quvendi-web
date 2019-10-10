<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function(Blueprint $table) {
            $table->string('house_no')->nullable();
            $table->string('street_name')->nullable();
            $table->string('town')->nullable();
            $table->string('lga')->nullable();
            $table->string('state')->nullable();
            $table->string('residential_address')->nullable()->change();
            $table->enum('sex', ['male', 'female'])->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function(Blueprint $table) {
            $table->dropColumn(['house_no', 'street_name', 'town', 'lga', 'state', 'sex']);
        });
    }
}
