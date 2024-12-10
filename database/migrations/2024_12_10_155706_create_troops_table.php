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
        Schema::create('troops', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('kingdom_id')->index('kingdom_id');
            $table->string('type', 50);
            $table->integer('quantity')->nullable()->default(0);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('troops');
    }
};
