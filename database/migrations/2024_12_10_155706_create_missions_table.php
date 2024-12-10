<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('missions', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('name', 100);
            $table->text('description')->nullable();
            $table->string('reward_resources')->nullable();
            $table->string('reward_troops')->nullable();
            $table->string('difficulty', 50)->nullable()->default('Medium');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('missions');
    }
};
