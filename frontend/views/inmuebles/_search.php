<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\InmueblesSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="inmuebles-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'bien_id') ?>

    <?= $form->field($model, 'descripcion') ?>

    <?= $form->field($model, 'direccion_ubicacion') ?>

    <?= $form->field($model, 'ficha_catastral') ?>

    <?php // echo $form->field($model, 'zonificacion') ?>

    <?php // echo $form->field($model, 'extension') ?>

    <?php // echo $form->field($model, 'titulo_supletorio') ?>

    <?php // echo $form->field($model, 'sys_status')->checkbox() ?>

    <?php // echo $form->field($model, 'sys_fecha') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
