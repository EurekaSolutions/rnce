<?php

namespace frontend\controllers;

use common\models\a\ActivosBienes;
use Yii;
use common\models\a\ActivosDesincorporacionActivos;
use app\models\ActivosDesincorporacionActivosSearch;
use common\components\BaseController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ActivosDesincorporacionActivosController implements the CRUD actions for ActivosDesincorporacionActivos model.
 */
class ActivosDesincorporacionActivosController extends BaseController
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
     * Lists all ActivosDesincorporacionActivos models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ActivosDesincorporacionActivosSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single ActivosDesincorporacionActivos model.
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
     * Creates a new ActivosDesincorporacionActivos model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new ActivosDesincorporacionActivos();
        $modelBien = new ActivosBienes();

        if ($model->load(Yii::$app->request->post()) && $modelBien->load(Yii::$app->request->post())) {
            $transaction = \Yii::$app->db->beginTransaction();
            try {
                if (($modelBien = ActivosBienes::findOne($modelBien->id)) !== null) {
                    if ($model->save()) {
                        $modelBien->desincorporacion_id = $model->id;
                        if($modelBien->save())
                        {
                            $transaction->commit();
                        }
                    }
                } else {
                    throw new NotFoundHttpException('The requested page does not exist.');
                }

                $transaction->rollBack();
            }catch (Exception $e) {
                $transaction->rollBack();
            }
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model, 'modelBien'=>$modelBien
            ]);
        }
    }

    /**
     * Updates an existing ActivosDesincorporacionActivos model.
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
     * Deletes an existing ActivosDesincorporacionActivos model.
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
     * Finds the ActivosDesincorporacionActivos model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ActivosDesincorporacionActivos the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ActivosDesincorporacionActivos::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
