<?php

namespace frontend\controllers;

use Yii;
use common\models\p\Certificados;
use common\models\a\ActivosDocumentosRegistrados;
use common\models\p\ActasConstitutivas;
use common\models\p\OrigenesCapitales;
use common\models\p\Acciones;
use common\models\p\Suplementarios;
use app\models\CertificadosSearch;
use common\components\BaseController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * CertificadosController implements the CRUD actions for Certificados model.
 */
class CertificadosController extends BaseController
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
     * Lists all Certificados models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CertificadosSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $model= new Certificados();
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'model'=>$model,
        ]);
    }
    public function actionPagocapital()
    {
        $searchModel = new CertificadosSearch();
        $searchModel->tipo_certificado="PAGO_CAPITAL";
        $documento=$searchModel->Modificacionactual();
        if(isset($documento)){
            $searchModel->documento_registrado_id= $documento->documento_registrado_id;
          
        }
      
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        return $this->render('pagocapital', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'documento'=>$documento,
        ]);
    }
    public function actionAumentocapital()
    {
        $searchModel = new CertificadosSearch();
        $searchModel->tipo_certificado="AUMENTO_CAPITAL";
        $documento=$searchModel->Modificacionactual();
        if(isset($documento)){
            $searchModel->documento_registrado_id= $documento->documento_registrado_id;
          
        }
      
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        return $this->render('aumentocapital', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'documento'=>$documento,
        ]);
    }
     public function actionVentacertificado()
    {
        $searchModel = new CertificadosSearch();
        $searchModel->tipo_certificado="VENTA_ACCION";
        $documento=$searchModel->Modificacionactual();
        if(isset($documento)){
            $searchModel->documento_registrado_id= $documento->documento_registrado_id;
          
        }
      
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        return $this->render('ventacertificado', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'documento'=>$documento,
        ]);
    }
    public function actionCreate($id='principal')
    {
        $model = new Certificados();
        switch ($id){
            case 'principal':
                $model->scenario=$id;
                $model->tipo_certificado='PRINCIPAL';
                break;
            case 'pago':
                $model->scenario=$id;
                $model->tipo_certificado='PAGO_CAPITAL';
                break;
            case 'aumento':
                $model->scenario=$id;
                $model->tipo_certificado='AUMENTO_CAPITAL';
                
                break;
             case 'venta':
                $model->scenario=$id;
                $model->tipo_certificado='VENTA_ACCION';
                
                break;
                
                break;
            default :
                break;
        }
        
        if($model->scenario=='principal'){
            if(!$model->validardenominacion()){
                Yii::$app->session->setFlash('error','Su denominacion comercial no le permite crear certificados');
                return $this->redirect(['index']);
            }
        }
      
        if($model->existeregistro()){
            
            Yii::$app->session->setFlash('error','Usuario posee certificados cargados o no ha creado un documento registrado');
            switch ($model->tipo_certificado){
                case 'PRINCIPAL':
                    return $this->redirect(['index']);
                    break;
                case 'PAGO_CAPITAL':
                    return $this->redirect(['pagocapital']);
                    break;
                case 'AUMENTO_CAPITAL':
                    return $this->redirect(['aumentocapital']);
                    break;
                case 'VENTA_ACCION':
                    return $this->redirect(['ventacertificado']);
                    break;
                default :
                    break;
            }
        }
        if($model->scenario=='aumento'){
            if(!$model->Pagocompleto()){
                Yii::$app->session->setFlash('error','No existe un aumento de capital valido, realice el pago de capital');
                return $this->redirect(['aumentocapital']);
            }
        }
        
        if ( $model->load(Yii::$app->request->post())) {
            
            switch ($model->tipo_certificado){
                case 'PRINCIPAL':
                    $model->suscrito=true;
                    $model->actual=true;
                    $model->contratista_id = Yii::$app->user->identity->contratista_id;
                    $paga_acta = new Certificados();
                    $paga_acta->numero_asociacion= $model->numero_asociacion_pagada;
       
                    $paga_acta->numero_aportacion= $model->numero_aportacion_pagada;
                    
                    $paga_acta->numero_rotativo= $model->numero_rotativo_pagada;
                  
                    $paga_acta->numero_inversion= $model->numero_inversion_pagada;
                    $paga_acta->capital=$model->capital_pagado;
             
                    $paga_acta->contratista_id = $model->contratista_id;
                    $paga_acta->documento_registrado_id= $model->documento_registrado_id;
                    $paga_acta->suscrito=false;
                    $paga_acta->actual=true;
                    $paga_acta->fecha_informe=$model->fecha_informe;
                    $paga_acta->tipo_certificado=$model->tipo_certificado;
                    $paga_acta->certificacion_aporte_id=$model->certificacion_aporte_id;
                                
                        $transaction = \Yii::$app->db->beginTransaction();
             
                        try {
                            if ($paga_acta->save(false)) {
                                if ($model->save()) {
                               
                                $transaction->commit();
                                 return $this->redirect(['index']);

                          
                          
                               
                            }else{
                                $transaction->rollBack();
                               // Yii::$app->session->setFlash('error','Erroren la carga del capital sucrito');
                             return $this->render('create',['model'=>$model]);
                                            }
                            
                        }else{
                            
                            $transaction->rollBack();
                          
                           // Yii::$app->session->setFlash('error','Erroren la carga del capital pagado');
                             return $this->render('create',['model'=>$model]);
                        }
                      
                    
                    } catch (Exception $e) {
                         $transaction->rollBack();
                    }
                break;
                
                case 'PAGO_CAPITAL':
                
                    $model->suscrito=false;
                    if($model->save()){
                        Yii::$app->session->setFlash('success','Registro creado con exito');
                        return $this->redirect(['pagocapital']);
                    }else{
                        Yii::$app->session->setFlash('error','Error en la creacion del capital');
                        return $this->render('create',['model'=>$model]);
                    }
                
                
                break;
                case 'AUMENTO_CAPITAL':
                    $model->suscrito=true;
                    $model->actual=false;
                    $model->contratista_id = Yii::$app->user->identity->contratista_id;
                    $paga_acta = new Certificados();
                    $paga_acta->numero_asociacion= $model->numero_asociacion_pagada;
       
                    $paga_acta->numero_aportacion= $model->numero_aportacion_pagada;
                    
                    $paga_acta->numero_rotativo= $model->numero_rotativo_pagada;
                  
                    $paga_acta->numero_inversion= $model->numero_inversion_pagada;
                    $paga_acta->capital=$model->capital_pagado;
             
                    $paga_acta->contratista_id = $model->contratista_id;
                    $paga_acta->documento_registrado_id= $model->documento_registrado_id;
                    $paga_acta->suscrito=false;
                    $paga_acta->actual=false;
                    $paga_acta->fecha_informe=$model->fecha_informe;
                    $paga_acta->tipo_certificado=$model->tipo_certificado;
                    $paga_acta->certificacion_aporte_id=$model->certificacion_aporte_id;
                                
                        $transaction = \Yii::$app->db->beginTransaction();
             
                        try {
                            if ($paga_acta->save(false)) {
                                if ($model->save()) {
                               
                                $transaction->commit();
                                 return $this->redirect(['aumentocapital']);

                          
                          
                               
                            }else{
                                $transaction->rollBack();
                               // Yii::$app->session->setFlash('error','Erroren la carga del capital sucrito');
                             return $this->render('create',['model'=>$model]);
                                            }
                            
                        }else{
                            
                            $transaction->rollBack();
                          
                           // Yii::$app->session->setFlash('error','Erroren la carga del capital pagado');
                             return $this->render('create',['model'=>$model]);
                        }
                      
                    
                    } catch (Exception $e) {
                         $transaction->rollBack();
                    }
                break;
                case 'VENTA_ACCION':
                
                    $model->suscrito=false;
                    if($model->save()){
                        Yii::$app->session->setFlash('success','Registro creado con exito');
                        return $this->redirect(['ventacertificado']);
                    }else{
                        Yii::$app->session->setFlash('error','Error en la creacion');
                        return $this->render('create',['model'=>$model]);
                    }
                
                
                break;
            default :
                break;
            }
            
        }
        return $this->render('create',['model'=>$model]);
    }
    /**
     * Displays a single Certificados model.
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
     * Updates an existing Certificados model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
      public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        switch ($model->tipo_certificado){
            case 'PRINCIPAL':
                if(!$model->suscrito){
                    $model = Certificados::findOne(['documento_registrado_id'=>$model->documento_registrado_id,'suscrito'=>true,'tipo_certificado'=>$model->tipo_certificado]);

                }
                $model->scenario='principal';
            break;
            
            case 'PAGO_CAPITAL':
                $model->scenario='pago';
                break;
            case 'AUMENTO_CAPITAL':
                if(!$model->suscrito){
                    $model = Certificados::findOne(['documento_registrado_id'=>$model->documento_registrado_id,'suscrito'=>true,'tipo_certificado'=>$model->tipo_certificado]);

                }
                $model->scenario='aumento';
            break;
            case 'VENTA_ACCION':
                $model->scenario='venta';
                break;
            default :
                break;
         }

        if ($model->load(Yii::$app->request->post())) {
            switch ($model->tipo_certificado){
                case 'PRINCIPAL':
                    $paga_acta = Certificados::findOne(['documento_registrado_id'=>$model->documento_registrado_id,'suscrito'=>false,'tipo_certificado'=>$model->tipo_certificado]);
                    if($paga_acta->capital>$model->capital_pagado){
                       // $origen_capital= OrigenesCapitales::findAll(['documento_registrado_id'=>$model->documento_registrado_id,'tipo_origen'=>$model->tipo_accion]);
                        $origen_capital= OrigenesCapitales::find()->where(['documento_registrado_id'=>$model->documento_registrado_id,'tipo_origen'=>$model->tipo_certificado])->orderBy('monto')->all();
                        if(isset($origen_capital)){
                            foreach ($origen_capital as $origen) {
                                if($origen->sumarmonto(false)>$model->capital_pagado){
                                    if(!$origen->delete()){
                                        $transaction->rollBack();
                                        Yii::$app->session->setFlash('error','Error al eliminar el origen de capital');
                                        return $this->redirect(['index']);
                                    }   
                                }
                            }
                        }
                    }
                    $paga_acta->numero_asociacion= $model->numero_asociacion_pagada;
       
                    $paga_acta->numero_aportacion= $model->numero_aportacion_pagada;
                    $paga_acta->fecha_informe=$model->fecha_informe;
                    $paga_acta->numero_rotativo= $model->numero_rotativo_pagada;
                  
                    $paga_acta->numero_inversion= $model->numero_inversion_pagada;
                    $paga_acta->capital=$model->capital_pagado;
                    $paga_acta->certificacion_aporte_id=$model->certificacion_aporte_id;
             
                    $transaction = \Yii::$app->db->beginTransaction();
             
                    try {
                        if ($paga_acta->save(false)) {
                            if ($model->save()) {
                                $transaction->commit();
                                return $this->redirect(['index']);
                            }else{
                                $transaction->rollBack();
                                //Yii::$app->session->setFlash('error','Erroren la carga del capital sucrito');
                                return $this->render('update',['model'=>$model]);
                            }
                            
                        }else{
                            $transaction->rollBack();
                            //Yii::$app->session->setFlash('error','Erroren la carga del capital pagado');
                            return $this->render('update',['model'=>$model]);
                        }
                      
                    
                    } catch (Exception $e) {
                         $transaction->rollBack();
                    }
                break;
                case 'PAGO_CAPITAL':
                    $transaction = \Yii::$app->db->beginTransaction();
                    try {
                        $modelaux= $this->findModel($model->id);
                        if($modelaux->capital>$model->capital){
                            $origen_capital= OrigenesCapitales::find()->where(['documento_registrado_id'=>$model->documento_registrado_id,'tipo_origen'=>$model->tipo_certificado])->orderBy('monto')->all();
                                if(isset($origen_capital)){
                                    foreach ($origen_capital as $origen) {
                                        if($origen->sumarmonto(false)>$model->capital){
                                            if(!$origen->delete()){
                                                $transaction->rollBack();
                                                Yii::$app->session->setFlash('error','Error al eliminar el origen de capital');
                                                return $this->redirect(['pagocapital']);
                                            }   
                                        }
                                    }
                                }
                        
                        }
                        if($model->save()){
                             $transaction->commit();
                             Yii::$app->session->setFlash('success','Actualizacion realizada con exito');
                            return $this->redirect(['pagocapital']);
                        }else{
                            $transaction->rollBack();
                        return $this->render('update',['model'=>$model]);
                        }
                        
                    } catch (Exception $e) {
                         $transaction->rollBack();
                    }
                
                break;
                case 'AUMENTO_CAPITAL':
                    $paga_acta = Certificados::findOne(['documento_registrado_id'=>$model->documento_registrado_id,'suscrito'=>false,'tipo_certificado'=>$model->tipo_certificado]);
                    if($paga_acta->capital>$model->capital_pagado){
                       // $origen_capital= OrigenesCapitales::findAll(['documento_registrado_id'=>$model->documento_registrado_id,'tipo_origen'=>$model->tipo_accion]);
                        $origen_capital= OrigenesCapitales::find()->where(['documento_registrado_id'=>$model->documento_registrado_id,'tipo_origen'=>$model->tipo_certificado])->orderBy('monto')->all();
                        if(isset($origen_capital)){
                            foreach ($origen_capital as $origen) {
                                if($origen->sumarmonto(false)>$model->capital_pagado){
                                    if(!$origen->delete()){
                                        $transaction->rollBack();
                                        Yii::$app->session->setFlash('error','Error al eliminar el origen de capital');
                                        return $this->redirect(['index']);
                                    }   
                                }
                            }
                        }
                    }
                    $paga_acta->numero_asociacion= $model->numero_asociacion_pagada;
       
                    $paga_acta->numero_aportacion= $model->numero_aportacion_pagada;
                    $paga_acta->fecha_informe=$model->fecha_informe;
                    $paga_acta->numero_rotativo= $model->numero_rotativo_pagada;
                  
                    $paga_acta->numero_inversion= $model->numero_inversion_pagada;
                    $paga_acta->capital=$model->capital_pagado;
                    $paga_acta->certificacion_aporte_id=$model->certificacion_aporte_id;
             
                    $transaction = \Yii::$app->db->beginTransaction();
             
                    try {
                        if ($paga_acta->save(false)) {
                            if ($model->save()) {
                                $transaction->commit();
                                return $this->redirect(['aumentocapital']);
                            }else{
                                $transaction->rollBack();
                                //Yii::$app->session->setFlash('error','Erroren la carga del capital sucrito');
                                return $this->render('update',['model'=>$model]);
                            }
                            
                        }else{
                            $transaction->rollBack();
                            //Yii::$app->session->setFlash('error','Erroren la carga del capital pagado');
                            return $this->render('update',['model'=>$model]);
                        }
                      
                    
                    } catch (Exception $e) {
                         $transaction->rollBack();
                    }
                break;
                case 'VENTA_ACCION':
                
                    if($model->save()){
                        Yii::$app->session->setFlash('success','Registro actualizado con exito');
                        return $this->redirect(['ventacertificado']);
                    }else{
                        Yii::$app->session->setFlash('error','Error en la actualizacion');
                        return $this->render('create',['model'=>$model]);
                    }
                
                
                break;
                default :
                    break;
            }
        }else{
            if($model->tipo_certificado=="PRINCIPAL" || $model->tipo_certificado=="AUMENTO_CAPITAL"){
                $paga_acta = Certificados::findOne(['documento_registrado_id'=>$model->documento_registrado_id,'suscrito'=>false,'tipo_certificado'=>$model->tipo_certificado]);
                $model->numero_asociacion_pagada=$paga_acta->numero_asociacion;
                $model->numero_aportacion_pagada=$paga_acta->numero_aportacion;
                $model->numero_rotativo_pagada=$paga_acta->numero_rotativo;
                $model->numero_inversion_pagada=$paga_acta->numero_inversion;
                $model->capital_pagado=$paga_acta->capital;
            }
            return $this->render('update',['model'=>$model]);
        }
    }

    /**
     * Deletes an existing Certificados model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
         public function actionDelete($id)
            
    {
        $model = $this->findModel($id);
        $opcion=$model->tipo_certificado;
        $transaction = \Yii::$app->db->beginTransaction();
        try {
            if($opcion=="PRINCIPAL" || $opcion=="AUMENTO_CAPITAL"){
                $model2 = Certificados::findOne(['documento_registrado_id'=>$model->documento_registrado_id,'suscrito'=>!$model->suscrito,'tipo_certificado'=>$model->tipo_certificado]);
                if(!$model2 ->delete()){
                    $transaction->rollBack();
                    Yii::$app->session->setFlash('error','Error al eliminar el capital');
                    if($opcion=="PRINCIPAL"){
                    return $this->redirect(['index']);
                    }else{
                         return $this->redirect(['aumentocapital']);
                    }
                }
            }
            if($opcion!='VENTA_ACCION'){
             $origen_capital= OrigenesCapitales::findAll(['documento_registrado_id'=>$model->documento_registrado_id,'tipo_origen'=>$model->tipo_certificado]);
            if(isset($origen_capital)){
                foreach ($origen_capital as $origen) {
                    if(!$origen->delete()){
                        $transaction->rollBack();
                        Yii::$app->session->setFlash('error','Error al eliminar el origen de capital asociado');
                        
                        switch ($opcion){
                            case 'PRINCIPAL':
                   
                                return $this->redirect(['index']);
                            break;
                            case 'PAGO_CAPITAL':
                                $model->delete();
                                return $this->redirect(['pagocapital']);
                            break;
                            case 'AUMENTO_CAPITAL':
                                $model->delete();
                                return $this->redirect(['aumentocapital']);
                            break;
                            default :
                            break;
                        }
                    }
                    
                }
            }
            }
            if(!$model->delete()){
                $transaction->rollBack();
                Yii::$app->session->setFlash('error','Error al eliminar');
                
            }else{
                $transaction->commit();
            }
            switch ($opcion){
                case 'PRINCIPAL':
                   
                    return $this->redirect(['index']);
                    break;
                case 'PAGO_CAPITAL':
                    $model->delete();
                    return $this->redirect(['pagocapital']);
                    break;
                case 'AUMENTO_CAPITAL':
                    $model->delete();
                    return $this->redirect(['aumentocapital']);
                    break;
                 case 'VENTA_ACCION':
                    $model->delete();
                    return $this->redirect(['ventasuplementario']);
                    break;
                default :
                    break;
                }
            
        } catch (Exception $e) {
            $transaction->rollBack();
        }
  
    }
    /**
     * Finds the Certificados model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Certificados the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Certificados::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
