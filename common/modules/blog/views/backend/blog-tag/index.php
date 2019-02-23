<?php
/**
 * Project: yii2-blog for internal using
 * Author: common\modules
 * Copyright (c) 2018.
 */

use common\modules\blog\Module;
use yii\grid\GridView;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $searchModel backend\modules\blog\models\BlogTagSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Module::t('blog', 'Blog Tags');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="blog-tag-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Module::t('blog', 'Create ') . Module::t('blog', 'Blog Tag'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\CheckboxColumn'],

            'id',
            'name',
            'frequency',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
