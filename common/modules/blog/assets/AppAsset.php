<?php
/**
 * Project: yii2-blog for internal using
 * Author: common\modules
 * Copyright (c) 2018.
 */

namespace common\modules\blog\assets;

use yii\web\AssetBundle;

class AppAsset extends AssetBundle
{
    public $sourcePath;
    public $baseUrl = '@web';
    public $css = [
        'css/blog-style.css',
    ];
    public $js = [
    ];
    public $depends = [
        'yii\bootstrap\BootstrapAsset',
        '\common\modules\blog\widgets\FontAwesome\AssetBundle'
    ];
	
	public function init()
	{
		$this->sourcePath = dirname(dirname(__DIR__)) .'/blog/assets/default';
		return $this->sourcePath;
	}
	
}
