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
        Schema::create('defenses', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('kingdom_id')->index('kingdom_id');
            $table->integer('troop_id')->index('troop_id');
            $table->integer('quantity_used')->nullable()->default(0);
            $table->boolean('result')->nullable()->default(false);
            $table->timestamp('created_at')->nullable()->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('defenses');
    }
};
