<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\AccionistasOtrosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Accionistas Otros');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="accionistas-otros-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Accionistas Otros'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'contratista_id',
            'natural_juridica_id',
            'porcentaje_accionario',
            'valor_compra',
            // 'fecha',
            // 'accionista:boolean',
            // 'junta_directiva:boolean',
            // 'rep_legal:boolean',
            // 'cargo',
            // 'documento_registrado_id',
            // 'sys_status:boolean',
            // 'sys_creado_el',
            // 'sys_actualizado_el',
            // 'sys_finalizado_el',
            // 'repr_legal_vigencia',
            // 'empresa_fusionada_id',
            // 'tipo_obligacion',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>