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
        Schema::table('troops', function (Blueprint $table) {
            $table->foreign(['kingdom_id'], 'troops_ibfk_1')->references(['id'])->on('kingdoms')->onUpdate('no action')->onDelete('no action');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('troops', function (Blueprint $table) {
            $table->dropForeign('troops_ibfk_1');
        });
    }
};
