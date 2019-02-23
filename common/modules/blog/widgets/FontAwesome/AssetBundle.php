<?php
/**
 * AssetBundle.php
 * @author Revin Roman
 * @link https://rmrevin.ru
 */

namespace common\modules\blog\widgets\FontAwesome;

/**
 * Class AssetBundle
 * @package common\modules\blog\widgets\FontAwesome
 */
class AssetBundle extends \yii\web\AssetBundle
{

    /**
     * @inherit
     */
    public $sourcePath;

    /**
     * @inherit
     */
    public $css = [
        'css/font-awesome.min.css',
    ];

    /**
     * Initializes the bundle.
     * Set publish options to copy only necessary files (in this case css and font folders)
     * @codeCoverageIgnore
     */
    public function init()
    {
        parent::init();

        $this->publishOptions['beforeCopy'] = function ($from, $to) {
            return preg_match('%(/|\\\\)(fonts|css)%', $from);
        };
		
		$this->sourcePath = dirname(dirname(__DIR__)) . '\widgets\FontAwesome';
    }
}
