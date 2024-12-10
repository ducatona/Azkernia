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
        Schema::create('resources', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('kingdom_id')->index('kingdom_id');
            $table->integer('gears')->nullable()->default(500);
            $table->integer('empty_valves')->nullable()->default(500);
            $table->integer('steam')->nullable()->default(500);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('resources');
    }
};
