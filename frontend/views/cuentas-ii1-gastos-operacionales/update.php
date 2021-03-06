<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\c\CuentasIi1GastosOperacionales */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Cuentas Ii1 Gastos Operacionales',
]) . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Cuentas Ii1 Gastos Operacionales'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="cuentas-ii1-gastos-operacionales-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
