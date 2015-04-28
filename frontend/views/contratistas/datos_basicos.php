<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\p\Contratistas */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="contratistas-form">

    <?php $form = ActiveForm::begin([
    'action' => ['contratistas/datosbasicos'],
]); ?>

    <?= $form->field($model2, 'rif')->textInput(['maxlength' => 50]) ?>
    
    <?= $form->field($model2, 'denominacion')->textInput(['maxlength' => 50]) ?>    

    <?= $form->field($model, 'sigla')->textInput(['maxlength' => 50]) ?>
    
    <?= $form->field($model, 'tipo_sector')->dropDownList([ 'PUBLICO' => 'PUBLICO', 'PRIVADO' => 'PRIVADO', 'MIXTO' => 'MIXTO' ], ['prompt' => '']) ?>
   
    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Create'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>