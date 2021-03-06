<?php

namespace frontend\controllers;

use Yii;
use common\models\p\AccionesDisminuidas;
use app\models\AccionesDisminuidasSearch;
use common\models\p\Acciones;
use common\components\BaseController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * AccionesDisminuidasController implements the CRUD actions for AccionesDisminuidas model.
 */
class AccionesDisminuidasController extends BaseController
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
     * Lists all AccionesDisminuidas models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new AccionesDisminuidasSearch();
          $documento=$searchModel->Modificacionactual();
        if(isset($documento)){
            $searchModel->documento_registrado_id= $documento->documento_registrado_id;
          
        }
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'documento'=>$documento,
        ]);
    }

    /**
     * Displays a single AccionesDisminuidas model.
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
     * Creates a new AccionesDisminuidas model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate($id)
    {
        $model = new AccionesDisminuidas();
        
        if($id=='valor'){
            $model->scenario=$id;
        }else{
            if($id=='cantidad'){
                 $model->scenario=$id;
            }else{
                Yii::$app->session->setFlash('error','Parametro incorrecto');
               return $this->redirect(['index']);
               
            }
        }
        if(!$model->Validardenominacion()){
            Yii::$app->session->setFlash('error','Denominacion comercial invalida');
          return $this->redirect(['index']);
        }
        if($model->existeregistro()){
            
            Yii::$app->session->setFlash('error','Usuario posee ua disminucion de capital en curso o no ha creado una modificacion');
            return $this->redirect(['index']);
        }
       
        if ($model->load(Yii::$app->request->post())) {
        $transaction = \Yii::$app->db->beginTransaction();
        try {
            if($model->save()){
            
            $accion = Acciones::findOne(['contratista_id'=>Yii::$app->user->identity->contratista_id,'suscrito'=>true,'actual'=>true]);
            $accion_actual=Acciones::findOne(['contratista_id'=>Yii::$app->user->identity->contratista_id,'suscrito'=>true,'actual'=>false,'tipo_accion'=>'ACTUAL']);
            if(isset($accion_actual)){
                $accion =$accion_actual;
            }                   
            if($accion->tipo_accion=='ACTUAL'){
                 if(!$accion->delete()){
                    $transaction->rollBack();
                    // Yii::$app->session->setFlash('error','');
                    return $this->render('create',['model'=>$model]);
                }
            }
            $accion= new Acciones();
            $accion->numero_preferencial=$model->numero_preferencial;
            $accion->numero_comun=$model->numero_comun;
            $accion->valor_preferencial=$model->valor_preferencial;
            $accion->valor_comun=$model->valor_comun;
            $accion->tipo_accion='ACTUAL';
            $accion->suscrito=true;
            $accion->capital=$model->capital_social;
            $accion->documento_registrado_id=$model->documento_registrado_id;
            $accion->contratista_id=Yii::$app->user->identity->contratista_id;
            if ($accion->save(false)) {
                $transaction->commit();
                return $this->redirect(['index']);
            }else{
                $transaction->rollBack();
                // Yii::$app->session->setFlash('error','');
                return $this->render('create',['model'=>$model]);
            }
            
            }else{
                $transaction->rollBack();
                return $this->render('create',['model'=>$model]);
            }
            
                
        } catch (Exception $e) {
             $transaction->rollBack();
        }
          
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing AccionesDisminuidas model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post())) {
            $transaction = \Yii::$app->db->beginTransaction();
        try {
            if($model->save()){
            
            $accion = Acciones::findOne(['contratista_id'=>Yii::$app->user->identity->contratista_id,'suscrito'=>true,'actual'=>true]);
            $accion_actual=Acciones::findOne(['contratista_id'=>Yii::$app->user->identity->contratista_id,'suscrito'=>true,'actual'=>false,'tipo_accion'=>'ACTUAL']);
            if(isset($accion_actual)){
                $accion =$accion_actual;
            }                   
            if($accion->tipo_accion=='ACTUAL'){
                 if(!$accion->delete()){
                    $transaction->rollBack();
                    // Yii::$app->session->setFlash('error','');
                    return $this->render('create',['model'=>$model]);
                }
            }
            $accion= new Acciones();
            $accion->numero_preferencial=$model->numero_preferencial;
            $accion->numero_comun=$model->numero_comun;
            $accion->valor_preferencial=$model->valor_preferencial;
            $accion->valor_comun=$model->valor_comun;
            $accion->tipo_accion='ACTUAL';
            $accion->suscrito=true;
            $accion->capital=$model->capital_social;
            $accion->documento_registrado_id=$model->documento_registrado_id;
            $accion->contratista_id=Yii::$app->user->identity->contratista_id;
            if ($accion->save(false)) {
                $transaction->commit();
                return $this->redirect(['index']);
            }else{
                $transaction->rollBack();
                // Yii::$app->session->setFlash('error','');
                return $this->render('update',['model'=>$model]);
            }
            
            }else{
                $transaction->rollBack();
                return $this->render('update',['model'=>$model]);
            }
            
                
        } catch (Exception $e) {
             $transaction->rollBack();
        }
          
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing AccionesDisminuidas model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $model=$this->findModel($id);
   
        $transaction = \Yii::$app->db->beginTransaction();
        try {
        $accion=Acciones::findOne(['contratista_id'=>Yii::$app->user->identity->contratista_id,'suscrito'=>true,'actual'=>false,'tipo_accion'=>'ACTUAL']);
            if(isset($accion)){
                if(!$accion->delete()){
                     $transaction->rollBack();
                    return $this->redirect(['index']);
                }
              
            }    
        if($model->delete()){
           $transaction->commit();
        }else{
              $transaction->rollBack();
        }
        return $this->redirect(['index']);    
        } catch (Exception $ex) {
                $transaction->rollBack();
        }
    }

    /**
     * Finds the AccionesDisminuidas model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return AccionesDisminuidas the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = AccionesDisminuidas::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
