<?php

namespace frontend\controllers;

use common\models\c\CuentasD1D2Beneficiario;
use kartik\widgets\ActiveForm;
use Yii;
use common\models\c\CuentasD1IslrPagadoAnticipo;
use app\models\CuentasD1IslrPagadoAnticipoSearch;
use common\components\BaseController;
use yii\db\Exception;
use yii\filters\auth\HttpBasicAuth;
use yii\helpers\ArrayHelper;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;

/**
 * CuentasD1IslrPagadoAnticipoController implements the CRUD actions for CuentasD1IslrPagadoAnticipo model.
 */
class CuentasD1IslrPagadoAnticipoController extends BaseController
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
     * Lists all CuentasD1IslrPagadoAnticipo models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CuentasD1IslrPagadoAnticipoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single CuentasD1IslrPagadoAnticipo model.
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
     * Creates a new CuentasD1IslrPagadoAnticipo model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new CuentasD1IslrPagadoAnticipo();
        $modelBeneficiarios = [new CuentasD1D2Beneficiario()];

        if ($model->load(Yii::$app->request->post())) {
            $modelBeneficiarios = CuentasD1D2Beneficiario::createMultiple(CuentasD1D2Beneficiario::className());
            CuentasD1D2Beneficiario::loadMultiple($modelBeneficiarios,Yii::$app->request->post());

            // ajax validation
            if (Yii::$app->request->isAjax) {
                Yii::$app->response->format = Response::FORMAT_JSON;
                return ArrayHelper::merge(
                    ActiveForm::validateMultiple($modelBeneficiarios),
                    ActiveForm::validate($modelBeneficiarios)
                );
            }

            // validate all models
            $valid = $model->validate();
            if($model->monto > 0)
                $valid = CuentasD1D2Beneficiario::validateMultiple($modelBeneficiarios) && $valid;


            if ($valid) {
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $model->save(false)) {
                        if($model->monto > 0)
                        foreach ($modelBeneficiarios as $modelBeneficiario) {
                            $modelBeneficiario->cuenta_id = $model->id;
                            if (! ($flag = $modelBeneficiario->save(false))) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }
                    if ($flag) {
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $model->id]);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
            }

            //return $this->redirect(['view', 'id' => $model->id]);
        }
            return $this->render('create', [
                'model' => $model, 'modelBeneficiarios'=>$modelBeneficiarios
            ]);

    }

    /**
     * Updates an existing CuentasD1IslrPagadoAnticipo model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $modelBeneficiarios = $model->islrBeneficiarios;

        if ($model->load(Yii::$app->request->post())) {

            $oldIDs = ArrayHelper::map($modelBeneficiarios, 'id', 'id');
            $modelBeneficiarios = CuentasD1D2Beneficiario::createMultiple(CuentasD1D2Beneficiario::classname(), $modelBeneficiarios);
            CuentasD1D2Beneficiario::loadMultiple($modelBeneficiarios, Yii::$app->request->post());
            if($model->monto > 0)
                $deletedIDs = array_diff($oldIDs, array_filter(ArrayHelper::map($modelBeneficiarios, 'id', 'id')));
            else
                $deletedIDs = ArrayHelper::map($modelBeneficiarios, 'id', 'id');

            // ajax validation
            if (Yii::$app->request->isAjax) {
                Yii::$app->response->format = Response::FORMAT_JSON;
                return ArrayHelper::merge(
                    ActiveForm::validateMultiple($modelBeneficiarios),
                    ActiveForm::validate($model)
                );
            }

            // validate all models
            $valid = $model->validate();
            if($model->monto > 0)
                $valid = CuentasD1D2Beneficiario::validateMultiple($modelBeneficiarios) && $valid;

            if ($valid) {
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $model->save(false)) {
                        if (! empty($deletedIDs)) {
                            CuentasD1D2Beneficiario::deleteAll(['id' => $deletedIDs]);
                        }
                        if($model->monto > 0)
                            foreach ($modelBeneficiarios as $modelBeneficiario) {
                                $modelBeneficiario->cuenta_id = $model->id;
                                if (! ($flag = $modelBeneficiario->save(false))) {
                                    $transaction->rollBack();
                                    break;
                                }
                            }
                    }
                    if ($flag) {
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $model->id]);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
            }

            //return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model, 'modelBeneficiarios'=>$modelBeneficiarios
            ]);
        }
    }

    /**
     * Deletes an existing CuentasD1IslrPagadoAnticipo model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {

        $model = $this->findModel($id);
        if($model){
            $modelBeneficiarios = $model->islrBeneficiarios;


            $flag = true;
            $transaction = \Yii::$app->db->beginTransaction();
            try {

                $deletedIDs = ArrayHelper::map($modelBeneficiarios, 'id', 'id');
                if (! empty($deletedIDs)) {
                    $flag = CuentasD1D2Beneficiario::deleteAll(['id' => $deletedIDs]) and $flag;
                }
                $flag = $model->delete() and $flag;
                if($flag)
                    $transaction->commit();
                else
                    $transaction->rollBack();
            } catch (Exception $e) {
                $transaction->rollBack();
            }
        }

        return $this->redirect(['index']);
    }

    /**
     * Finds the CuentasD1IslrPagadoAnticipo model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return CuentasD1IslrPagadoAnticipo the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = CuentasD1IslrPagadoAnticipo::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
