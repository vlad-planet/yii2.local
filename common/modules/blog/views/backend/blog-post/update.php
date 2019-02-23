<?php
/**
 * Project: yii2-blog for internal using
 * Author: common\modules
 * Copyright (c) 2018.
 */

use common\modules\blog\Module;

/* @var $this yii\web\View */
/* @var $model backend\modules\blog\models\BlogPost */

$this->title = Module::t('blog', 'Update ') . Module::t('blog', 'Blog Post') . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => Module::t('blog', 'Blog Posts'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Module::t('blog', 'Update');
?>
<div class="blog-post-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
