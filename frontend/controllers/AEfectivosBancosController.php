<?php

namespace frontend\controllers;

use Yii;
use common\models\c\AEfectivosBancos;
use app\models\AEfectivosCajasSearch;
use app\models\AEfectivosBancosSearch;
use app\models\AInversionesNegociarSearch;

use common\components\BaseController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * AEfectivosBancosController implements the CRUD actions for AEfectivosBancos model.
 */
class AEfectivosBancosController extends BaseController
{
    public function behaviors()
    {
        return array_merge(parent::behaviors(),[
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ]);
    }

    public function actionEfectivosequivalentes()
    {
        //['scenario' => 'nacional']

        $efectivo_bancos = new AEfectivosBancosSearch();
        $query_eb = $efectivo_bancos::find()->indexBy('id'); // where `id` is your primary key
        $dataProvider_eb = new \yii\data\ActiveDataProvider([
            'query' => $query_eb,
        ]);

        $efectivo_caja = new AEfectivosCajasSearch();
        $query_ec = $efectivo_caja::find()->indexBy('id'); // where `id` is your primary key
        $dataProvider_ec = new \yii\data\ActiveDataProvider([
            'query' => $query_ec,
        ]);

        $inversiones = new AInversionesNegociarSearch();
        $query_in = $inversiones::find()->indexBy('id'); // where `id` is your primary key
        $dataProvider_in = new \yii\data\ActiveDataProvider([
            'query' => $query_in,
        ]);

        return $this->render('efectivosequivalentes', ['dataProvider_eb' => $dataProvider_eb, 'efectivo_bancos' => $efectivo_bancos, 'dataProvider_ec' => $dataProvider_ec, 'efectivo_caja' => $efectivo_caja, 'dataProvider_in' => $dataProvider_in, 'inversiones' => $inversiones]);
    }

    /**
     * Lists all AEfectivosBancos models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new AEfectivosBancosSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single AEfectivosBancos model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new AEfectivosBancos model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        //$nacional = true;
        $model = new AEfectivosBancos();
        //$model->scenario = 'nacional';
        if($model->scenario == 'nacional')
        {
            $model->nacional = true;
        }else  $model->nacional = false;

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing AEfectivosBancos model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        //$model->scenario = 'extranjero';
        if($model->nacional)
        {
            $model->scenario = 'nacional';
                        
        }else  $model->scenario = 'extranjero';

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {

            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing AEfectivosBancos model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the AEfectivosBancos model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return AEfectivosBancos the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = AEfectivosBancos::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
