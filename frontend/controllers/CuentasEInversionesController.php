<?php

namespace frontend\controllers;

use common\models\c\CuentasEInversionesInfoAdicional;
use common\models\c\CuentasETiposMovimientos;
use Yii;
use common\models\c\CuentasEInversiones;
use app\models\CuentasEInversionesSearch;
use common\components\BaseController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * CuentasEInversionesController implements the CRUD actions for CuentasEInversiones model.
 */
class CuentasEInversionesController extends BaseController
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all CuentasEInversiones models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CuentasEInversionesSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single CuentasEInversiones model.
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
     * Creates a new CuentasEInversiones model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new CuentasEInversiones();

        $modelInfoAdicional = new CuentasEInversionesInfoAdicional();

        $modelTipoMovimientoAdquisicion = new CuentasETiposMovimientos();
        $modelTipoMovimientoAdquisicion->movimiento_id = 58;

        $modelTipoMovimientoAdicion = new CuentasETiposMovimientos();
        $modelTipoMovimientoAdicion->movimiento_id = 59;

        $modelTipoMovimientoRetiro = new CuentasETiposMovimientos();
        $modelTipoMovimientoRetiro->movimiento_id = 60;

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            if ($modelTipoMovimientoAdquisicion->load(Yii::$app->request->post()) && $modelTipoMovimientoAdicion->load(Yii::$app->request->post()) && $modelTipoMovimientoRetiro->load(Yii::$app->request->post())) {
                
            }
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model, 'modelInfoAdicional'=>$modelInfoAdicional, 'modelTipoMovimientoAdquisicion'=>$modelTipoMovimientoAdquisicion, 'modelTipoMovimientoAdicion'=>$modelTipoMovimientoAdicion,
                 'modelTipoMovimientoRetiro'=>$modelTipoMovimientoRetiro,
            ]);
        }
    }

    /**
     * Updates an existing CuentasEInversiones model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing CuentasEInversiones model.
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
     * Finds the CuentasEInversiones model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return CuentasEInversiones the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = CuentasEInversiones::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
