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
            $table->string('lga')->nullable();
            $table->string('state')->nullable();
            $table->enum('suspended', ['Yes', 'No'])->default('No');
            $table->string('residential_state')->nullable();
            $table->string('residential_lga')->nullable();
            $table->string('residential_town')->nullable();
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
            $table->dropColumn([
                'house_no',
                'street_name',
                'suspended',
                'lga',
                'state',
                'sex',
                'residential_state',
                'residential_town',
                'residential_lga',
            ]);
        });
    }
}
