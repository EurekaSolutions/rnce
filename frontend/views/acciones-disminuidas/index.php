<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\AccionesDisminuidasSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Acciones Disminuidas');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="acciones-disminuidas-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

<?php
    if(isset($documento) && $documento->disminucion_capital){
    echo Html::tag('h1','Disminucion del Capital');
       echo  GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'summary'=>'',
        'columns' => [
           // ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'justificacion:ntext',
            'tipo_disminucion',
            'valor_comun',
            'valor_preferencial',
             'numero_comun',
             'numero_preferencial',
            // 'acta_constitutiva_id',
            // 'valor_comun_actual',
            // 'valor_preferencial_actual',
            // 'numero_comun_actual',
            // 'numero_preferencial_actual',
            'capital_social',
            // 'creado_por',
            // 'actualizado_por',
            // 'sys_status:boolean',
            // 'sys_creado_el',
            // 'sys_actualizado_el',
            // 'sys_finalizado_el',
            // 'contratista_id',
            // 'documento_registrado_id',
            // 'actual:boolean',

            ['class' => 'yii\grid\ActionColumn','template'=>'{update}{delete}'],
        ],
    ]);if(!$searchModel->existeregistro() && $documento->disminucion_capital){ ?>
   <p>
        <?= Html::a(Yii::t('app', 'Sobre el valor'), ['create','id'=>'valor'], ['class' => 'btn btn-success']) ?> <?= Html::a(Yii::t('app', 'Sobre el numero'), ['create','id'=>'cantidad'], ['class' => 'btn btn-success']) ?>
    </p>
      
         <?php }  }else{?>
        
            <div class="alert-warning alert fade in">
               

                <h4>No existe ningun procedimiento referente a disminucionde capital activo</h4>

            </div>
        <?php } ?>
   

</div>
