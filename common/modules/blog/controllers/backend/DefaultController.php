<?php
/**
 * Project: yii2-blog for internal using
 * Author: common\modules
 * Copyright (c) 2018.
 */

namespace common\modules\blog\controllers\backend;

class DefaultController extends BaseAdminController
{
    public function actionIndex()
    {
        //if(!Yii::$app->user->can('readPost')) throw new HttpException(403, 'No Auth');

        return $this->render('index');
    }
}
