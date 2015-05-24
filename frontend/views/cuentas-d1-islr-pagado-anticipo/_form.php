<?php

use kartik\builder\Form;

use kartik\widgets\ActiveForm;
use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\c\CuentasD1IslrPagadoAnticipo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="cuentas-d1-islr-pagado-anticipo-form">

    <?php $form = ActiveForm::begin(); ?>

    <?php

    echo '<h2> Cuenta D-1 - Impuesto sobre la Renta: </h2>';
    echo Form::widget([       // 3 column layout
        'model'=>$model,
        'form'=>$form,
        'columns'=>4,
        'columnSize'=>'xs',
        'attributes'=>$model->formAttribs
    ]);

    ?>

<!--
    <?/*= $form->field($model, 'isrl_pagado')->textInput(['maxlength' => true]) */?>

    <?/*= $form->field($model, 'nro_documento')->textInput() */?>

    <?/*= $form->field($model, 'saldo_ph')->textInput() */?>

    <?/*= $form->field($model, 'importe_pagado_ejer_econo')->textInput() */?>

    <?/*= $form->field($model, 'importe_aplicado_ejer_econo')->textInput() */?>

    <?/*= $form->field($model, 'saldo_cierre')->textInput() */?>

    <?/*= $form->field($model, 'monto')->textInput() */?>

    <?/*= $form->field($model, 'contratista_id')->textInput() */?>

    <?/*= $form->field($model, 'anho')->textInput(['maxlength' => true]) */?>

    <?/*= $form->field($model, 'creado_por')->textInput() */?>

    <?/*= $form->field($model, 'actualizado_por')->textInput() */?>

    <?/*= $form->field($model, 'sys_status')->checkbox() */?>

    <?/*= $form->field($model, 'sys_creado_el')->textInput() */?>

    <?/*= $form->field($model, 'sys_actualizado_el')->textInput() */?>

    <?/*= $form->field($model, 'sys_finalizado_el')->textInput() */?>

   --> <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
