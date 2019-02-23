<?php
$params = array_merge(
    require __DIR__ . '/../../common/config/params.php',
    require __DIR__ . '/../../common/config/params-local.php',
    require __DIR__ . '/params.php',
    require __DIR__ . '/params-local.php'
);

return [
    'id' => 'app-frontend',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'frontend\controllers',
    //'defaultRoute' => 'blog', //set blog as default route
    'modules' => [
        'blog' => [
            'class' => 'common\modules\blog\Module',
            'controllerNamespace' => 'common\modules\blog\controllers\frontend',
            'blogPostPageCount' => 6,
            'blogCommentPageCount' => 10, //20 by default
            'enableComments' => true, //false by default
            'schemaOrg' => [ // empty array [] by default! 
                'publisher' => [
                    'logo' => '/img/logo.png',
                    'logoWidth' => 191,
                    'logoHeight' => 74,
                    'name' => 'My Company',
                    'phone' => '+1 800 488 80 85',
                    'address' => 'City, street, house'
                ]
            ]
        ],
    ],
    'components' => [
        'request' => [
            //'csrfParam' => '_csrf-frontend',
			'baseUrl' => '',
			// !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => 'tKexoY4w4dFB68T1qxxa',
            'csrfParam' => '_frontendCSRF',
        ],
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
            'identityCookie' => [
				//'name' => '_identity-frontend', 'httpOnly' => true
				'name' => '_frontendUser', // unique for frontend
			],
        ],
        'session' => [
            // this is the name of the session cookie used for login on the frontend
            //'name' => 'advanced-frontend',
			'name' => 'PHPFRONTSESSID',
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
