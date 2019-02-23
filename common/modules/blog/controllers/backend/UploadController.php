<?php

namespace common\modules\blog\controllers\backend;

use yii\web\Response;

class UploadController extends BaseAdminController
{

    public $enableCsrfValidation = false;

    public function init()
    {
        parent::init();
        $this->module = \Yii::$app->getModule(\Yii::$app->getModule('blog')->redactorModule);
        $this->attachBehavior('content', [
            'class' => 'yii\filters\ContentNegotiator',
            'formats' => [
                'application/json' => Response::FORMAT_JSON
            ],
        ]);
    }

    public function actions()
    {
        return [
            'file' => 'common\modules\blog\widgets\Redactor\actions\FileUploadAction',
            'image' => 'common\modules\blog\widgets\Redactor\actions\ImageUploadAction',
            'image-json' => 'common\modules\blog\widgets\Redactor\actions\ImageManagerJsonAction',
            'file-json' => 'common\modules\blog\widgets\Redactor\actions\FileManagerJsonAction',
        ];
    }

}
