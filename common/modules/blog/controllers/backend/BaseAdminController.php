<?php
/**
 * Copyright (c) 2018
 * cms Smetana
 * project: alt-money
 *
 */

namespace common\modules\blog\controllers\backend;

use common\modules\blog\traits\ModuleTrait;
use dektrium\user\filters\AccessRule;
use yii\filters\VerbFilter;
use yii\web\Controller;

class BaseAdminController extends Controller
{

    use ModuleTrait;

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'delete' => ['POST'],
                ],
            ]
        ];
    }

    public function init()
    {
        if ($this->module->adminAccessControl) {
            $this->attachBehavior('access', [
                'class' => $this->module->adminAccessControl,
            ]);
        }

        parent::init();
    }
}
