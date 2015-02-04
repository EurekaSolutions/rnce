<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\SustentoContsSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="sustento-conts-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'descripcion') ?>

    <?= $form->field($model, 'tipo_sustento_id') ?>

    <?= $form->field($model, 'contratista_id') ?>

    <?= $form->field($model, 'ano') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
