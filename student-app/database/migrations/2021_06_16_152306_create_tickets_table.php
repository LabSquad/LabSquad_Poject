<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTicketsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tickets', function (Blueprint $table) {
            $table->id(); 
            $table->unsignedBigInteger('users_id');
            $table->string('name')->nullable();
            $table->string('course')->nullable();
            $table->string('issue_category')->nullable();
            $table->string('issue_title')->nullable();
            $table->string('issue_description')->nullable();
            $table->string('date')->nullable();
            $table->string('timeslot')->nullable();
            $table->boolean('is_assigned')->default(0);
            $table->foreign('users_id')->references('id')->on('users')->onDelete('CASCADE');
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tickets');
    }
}
