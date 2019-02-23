<?php

use yii\db\Migration;

/**
 * Class m190108_182853_profile
 */
class m190108_182853_profile extends Migration
{
    public function up()
    {
		$this->addColumn('{{%user}}', 'firstname', $this->string(64)->after('email'));
		$this->addColumn('{{%user}}', 'lastname', $this->string(64)->after('firstname'));
		$this->addColumn('{{%user}}', 'phone', $this->string(64)->after('lastname'));
		$this->addColumn('{{%user}}', 'birthdate', $this->date()->after('phone'));
        $this->addColumn('{{%user}}', 'avatar', $this->string(64)->after('birthdate'));
    }

    public function down()
    {
        $this->dropColumn('{{%user}}', 'firstname');
		$this->dropColumn('{{%user}}', 'lastname');
		$this->dropColumn('{{%user}}', 'phone');
		$this->dropColumn('{{%user}}', 'birthdate');
		$this->dropColumn('{{%user}}', 'avatar');
    }
}
