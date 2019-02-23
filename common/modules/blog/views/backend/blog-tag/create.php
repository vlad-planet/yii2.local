<?php
/**
 * Project: yii2-blog for internal using
 * Author: common\modules
 * Copyright (c) 2018.
 */

use common\modules\blog\Module;


/* @var $this yii\web\View */
/* @var $model backend\modules\blog\models\BlogTag */

$this->title = Module::t('blog', 'Create ') . Module::t('blog', 'Blog Tag');
$this->params['breadcrumbs'][] = ['label' => Module::t('blog', 'Blog Tags'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="blog-tag-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
