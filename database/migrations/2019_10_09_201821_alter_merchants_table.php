<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterMerchantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('merchants', function(Blueprint $table) {
            $table->string('office_number')->nullable();
            $table->string('street_name')->nullable();
            $table->string('town')->nullable();
            $table->string('lga')->nullable();
            $table->string('state')->nullable();
            $table->string('contact_person_title')->nullable();
            $table->string('contact_person_firstname')->nullable();
            $table->string('contact_person_lastname')->nullable();
            $table->enum('contact_person_sex', ['male', 'female'])->nullable();
            $table->string('contact_person_phone')->nullable();
            $table->string('contact_person_email')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('merchants', function(Blueprint $table) {
            $table->dropColumn(['office_number', 'street_name', 'town', 'lga', 'state', 'contact_person_title',
                'contact_person_firstname', 'contact_person_lastname', 'contact_person_sex', 'contact_person_phone',
                'contact_person_email']);
        });
    }
}
