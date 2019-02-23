<?php
return [
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm'   => '@vendor/npm-asset',
    ],
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
	'modules' => [
        'blog' => [
            'class' => common\modules\blog\Module::class,
            'urlManager' => 'urlManager',// 'urlManager' by default, or maybe you can use own component urlManagerFrontend
            'imgFilePath' => '@frontend/web/img/blog/',
            'imgFileUrl' => '/img/blog/',
            'userModel' => \common\models\User::class,
            'userPK' => 'id', //default primary key for {{%user}} table
            'userName' => 'username', //uses in view (may be field `username` or `email` or `login`)
		],
		'user' => [
            'class' => common\modules\user\Module::class,
			//'class' => vladplanet\user\Module::class,
        ],
    ],
	'timeZone' => 'Europe/Moscow', //time zone affect the formatter datetime format
	'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
		'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [               
            ],
        ],
        'formatter' => [ //for the showing of date datetime
            'dateFormat' => 'yyyy-MM-dd',
            'datetimeFormat' => 'yyyy-MM-dd HH:mm:ss',
            'decimalSeparator' => '.',
            'thousandSeparator' => ' ',
            'currencyCode' => 'EUR',
        ],
		//'language' => 'en-US',
		'i18n' => [
			'translations' => [
				'app*' => [
					'class' => 'yii\i18n\PhpMessageSource',
					'basePath' => '@common/messages',
					'sourceLanguage' => 'en_US',
					'fileMap' => [
						'app'       => 'app.php',
						'app/error' => 'error.php',
					],
				],
			],
		],
    ],
];
