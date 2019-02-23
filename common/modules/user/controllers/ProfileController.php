<?php

namespace common\modules\user\controllers;

use common\modules\user\models\User;
use common\modules\user\models\ProfileUpdateForm;
use common\modules\user\models\PasswordChangeForm;
use yii\filters\AccessControl;
use yii\web\Controller;
use Yii;
use common\modules\user\models\UploadImage;
use yii\web\UploadedFile;
 
 
class ProfileController extends Controller
{
	
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }
 
    public function actionIndex()
    {
        return $this->render('index', [
            'model' => $this->findModel(),
        ]);
    }
 
    public function actionUpdate()
    {
        $user = $this->findModel();
		$model = new ProfileUpdateForm($user);

        if ($model->load(Yii::$app->request->post()) && $model->update()) {
            return $this->redirect(['index']);
        } else {
			
			$image = new UploadImage();
			
			if(Yii::$app->request->isPost){
				$image->image = UploadedFile::getInstance($image, 'image');
				$image->upload();
			}
			
            return $this->render('update', [
                'model' => $model,
				'image' => $image,
            ]);
        }	
    }
	
    public function actionPasswordChange()
    {
        $user = $this->findModel();
        $model = new PasswordChangeForm($user);
 
        if ($model->load(Yii::$app->request->post()) && $model->changePassword()) {
            return $this->redirect(['index']);
        } else {
            return $this->render('passwordChange', [
                'model' => $model,
            ]);
        }
    }

    /**
     * @return User the loaded model
     */
    private function findModel()
    {
        return User::findOne(Yii::$app->user->identity->getId());
    }

}