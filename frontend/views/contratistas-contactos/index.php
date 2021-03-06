<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ContratistasContactosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Persona de contacto');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="contratistas-contactos-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

   

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'summary'=>'',
       // 'filterModel' => $searchModel,
        'columns' => [
           // ['class' => 'yii\grid\SerialColumn'],
            
            [
                'attribute'=>'contacto_id',
                'label'=>'Nombre y Apellido',
                'value'=>'contacto.denominacion'
            ],
            [
                'attribute'=>'contacto_id',
                'label'=>'Numero identificacion',
                'value'=>'contacto.rif'
            ],
            //'id',
            //'contacto_id',
            //'contratista_id',
            //'sys_status:boolean',
            //'sys_creado_el',
            // 'sys_actualizado_el',
            // 'sys_finalizado_el',

            ['class' => 'yii\grid\ActionColumn','template'=>'{update} {delete}'],
        ],
    ]); ?>
    <?php 
    if(!$searchModel->existeregistro()){ ?>
       <p>
        <?= Html::a(Yii::t('app', 'Agregar Persona de contacto'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?php } ?>

</div>
