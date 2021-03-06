<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\AccionesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Acciones');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="acciones-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

   

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'summary'=>'',
        'columns' => [
           // ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'suscrito:boolean',
            'capital',
            'numero_preferencial',
            'valor_preferencial',
            'numero_comun',
            'valor_comun',
            [
                'attribute'=>'certificacion_aporte_id',
                'label'=>'Certificador Aporte',
                'value'=>'certificacionAporte.naturalJuridica.denominacion'
            ],
            'fecha_informe',
            // 'sys_status:boolean',
            // 'sys_creado_el',
            // 'sys_actualizado_el',
            // 'sys_finalizado_el',
            // 'tipo_accion',
            
            // 'acta_constitutiva_id',

            ['class' => 'yii\grid\ActionColumn','template'=>'{update}{delete}'],
        ],
    ]); ?>
     <?php 
    if(!$model->existeregistro() && $model->validardenominacion()){ ?>
       <p>
        <?= Html::a(Yii::t('app', 'Agregar Acciones'), ['create','id'=>'principal'], ['class' => 'btn btn-success']) ?>
    </p>
    <?php } ?>
</div>
