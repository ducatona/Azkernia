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
        Schema::table('defenses', function (Blueprint $table) {
            $table->foreign(['kingdom_id'], 'defenses_ibfk_1')->references(['id'])->on('kingdoms')->onUpdate('no action')->onDelete('no action');
            $table->foreign(['troop_id'], 'defenses_ibfk_2')->references(['id'])->on('troops')->onUpdate('no action')->onDelete('no action');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('defenses', function (Blueprint $table) {
            $table->dropForeign('defenses_ibfk_1');
            $table->dropForeign('defenses_ibfk_2');
        });
    }
};
