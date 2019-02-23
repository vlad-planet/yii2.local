<?php
$params = array_merge(
    require __DIR__ . '/../../common/config/params.php',
    require __DIR__ . '/../../common/config/params-local.php',
    require __DIR__ . '/params.php',
    require __DIR__ . '/params-local.php'
);

return [
    'id' => 'app-backend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => [
		'log',
		'common\modules\blog\Bootstrap',
		],
	'homeUrl' => '/admin',
    'modules' => [
        'blog' => [
            'class' => 'common\modules\blog\Module',
            'controllerNamespace' => 'common\modules\blog\controllers\backend',
            //'adminAccessControl' => 'common\components\AdminAccessControl', // null - by default 
	   ],
    ],
    'components' => [
        'request' => [
            //'csrfParam' => '_csrf-backend',
			'baseUrl' => '/admin',
			// !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => '[DIFFERENT UNIQUE KEY]',
            'csrfParam' => '_backendCSRF',
        ],
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
            'identityCookie' => [
				//'name' => '_identity-backend', 'httpOnly' => true
				'name' => '_backendUser', // unique for backend
			],
        ],
        'session' => [
            // this is the name of the session cookie used for login on the backend
            //'name' => 'advanced-backend',
			'name' => 'PHPBACKSESSID',
            'savePath' => sys_get_temp_dir(),
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
            ],
        ],
    ],
    'params' => $params,
];
