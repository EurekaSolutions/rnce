<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\FondosEmergenciasSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="fondos-emergencias-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'fecha_cierre') ?>

    <?= $form->field($model, 'saldo_fondo') ?>

    <?= $form->field($model, 'monto_perdida') ?>

    <?= $form->field($model, 'monto_utilizado') ?>

    <?php // echo $form->field($model, 'monto_asociados') ?>

    <?php // echo $form->field($model, 'corto_plazo')->checkbox() ?>

    <?php // echo $form->field($model, 'numero_plazo') ?>

    <?php // echo $form->field($model, 'interes')->checkbox() ?>

    <?php // echo $form->field($model, 'tasa_interes') ?>

    <?php // echo $form->field($model, 'saldo_fondo_actual') ?>

    <?php // echo $form->field($model, 'monto_actual') ?>

    <?php // echo $form->field($model, 'creado_por') ?>

    <?php // echo $form->field($model, 'actualizado_por') ?>

    <?php // echo $form->field($model, 'sys_status')->checkbox() ?>

    <?php // echo $form->field($model, 'sys_creado_el') ?>

    <?php // echo $form->field($model, 'sys_actualizado_el') ?>

    <?php // echo $form->field($model, 'sys_finalizado_el') ?>

    <?php // echo $form->field($model, 'contratista_id') ?>

    <?php // echo $form->field($model, 'documento_registrado_id') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
