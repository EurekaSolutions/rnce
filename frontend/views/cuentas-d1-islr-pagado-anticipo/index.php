<?php

use kartik\dynagrid\DynaGrid;
use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CuentasD1IslrPagadoAnticipoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Cuentas D1 Islr Pagado Anticipos');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="cuentas-d1-islr-pagado-anticipo-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
       <!-- <?/*= Html::a(Yii::t('app', 'Create Cuentas D1 Islr Pagado Anticipo'), ['create'], ['class' => 'btn btn-success']) */?>-->
    </p>
<!--
    <?/*= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'isrl_pagado',
            'nro_documento',
            'saldo_ph',
            'importe_pagado_ejer_econo',
            // 'importe_aplicado_ejer_econo',
            // 'saldo_cierre',
            // 'monto',
            // 'contratista_id',
            // 'anho',
            // 'creado_por',
            // 'actualizado_por',
            // 'sys_status:boolean',
            // 'sys_creado_el',
            // 'sys_actualizado_el',
            // 'sys_finalizado_el',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); */?>
    -->

    <?php

    $columns =
        [
            ['class'=>'kartik\grid\SerialColumn', 'order'=>DynaGrid::ORDER_FIX_LEFT],
            'islrPagado.nombre',
            'nro_documento',
            [
                'attribute'=>'saldo_ph',
                'hAlign'=>'right',
                'vAlign'=>'middle',
                'width'=>'100px',
                'format'=>['decimal', 2],
                'pageSummary'=>true
            ],

            [
                'attribute'=>'importe_pagado_ejer_econo',
                'hAlign'=>'right',
                'vAlign'=>'middle',
                'width'=>'100px',
                'format'=>['decimal', 2],
                'pageSummary'=>true
            ],
            [
                'attribute'=>'importe_aplicado_ejer_econo',
                'hAlign'=>'right',
                'vAlign'=>'middle',
                'width'=>'100px',
                'format'=>['decimal', 2],
                'pageSummary'=>true
            ],
            [
                'attribute'=>'saldo_cierre',
                'hAlign'=>'right',
                'vAlign'=>'middle',
                'width'=>'100px',
                'format'=>['decimal', 2],
                'pageSummary'=>true
            ],

            [
                'class'=>'kartik\grid\ActionColumn',
                'dropdown'=>false,
                //'urlCreator'=>function($action, $model, $key, $index) { return '#'; },
                'template'=>'{update} {delete}',
                'buttons'=>[
                    /*'update' =>['url'=>Url::toRoute(['aa-obligaciones-bancarias/update','id'=>$model->id])], function ($url,$model) {
                        $url = Url::toRoute(['aa-obligaciones-bancarias/update','id'=>$model->id]);
                        return Html::a(

                            '<span class="glyphicon glyphicon-user"></span>',

                            $url);

                    },*/
                    /*             'delete' => function ($url,$model) {
                                     //$url = Url::toRoute(array_merge(['modify'], $urlConfig));
                                     return Html::a(

                                         '<span class="glyphicon glyphicon-user"></span>',

                                         $url);

                                 },*/
                ],
                'viewOptions'=>['title'=>"Ver", 'data-toggle'=>'tooltip'],
                'updateOptions'=>['title'=>"Actualizar", 'data-toggle'=>'tooltip'],
                'deleteOptions'=>['title'=>"Eliminar", 'data-toggle'=>'tooltip'],
                'order'=>DynaGrid::ORDER_FIX_RIGHT
            ],
            ['class'=>'kartik\grid\CheckboxColumn', 'order'=>DynaGrid::ORDER_FIX_RIGHT],
        ];
    $dynagrid = DynaGrid::begin([
        'columns'=>$columns,
        'theme'=>'panel-info',
        'showPersonalize'=>true,
        'storage'=>'cookie',
        'gridOptions'=>[
            'dataProvider'=>$dataProvider,
            //'filterModel'=>$searchModel,
            'showPageSummary'=>true,
            'floatHeader'=>true,
            //'pjax'=>true,
            'summary'=>'',
            'panel'=>[
                'heading'=>'<h3 class="panel-title"><i class="glyphicon glyphicon-book"></i> ISLR Pagado por anticipado  - D1</h3>',
                'before' =>  '<div style="padding-top: 7px;"><em> <!--Cuenta AA - Obligaciones Bancarias--> </em></divs>',
                'after' => false
            ],
            'toolbar' =>  [
                ['content'=>
                    Html::a(Yii::t('app', '<i class="glyphicon glyphicon-plus"></i>'), ['create'], ['class' => 'btn btn-success'])  /*. ' '.
                Html::a('<i class="glyphicon glyphicon-repeat"></i>', ['dynagrid-demo'], ['data-pjax'=>0, 'class' => 'btn btn-default', 'title'=>'Reset Grid'])*/
                ],
                ['content'=>'{dynagridFilter}{dynagridSort}{dynagrid}'],
                '{export}', ['class' => '\kartik\grid\ActionColumn', 'template' => '{view}',
                    'buttons' => [ 'imprimir' => function ($url, $model, $key) {
                        return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url,[
                            'title' => 'Imprimir',
                        ]);
                    },
                    ]
                ],
            ],


        ],
        'options'=>['id'=>'dynagrid-d1-ISLR'] // a unique identifier is important
    ]);

    if (substr($dynagrid->theme, 0, 6) == 'simple') {
        $dynagrid->gridOptions['panel'] = false;
    }

    DynaGrid::end();

    ?>

</div>
