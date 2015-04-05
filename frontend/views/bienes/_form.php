<?php

use yii\helpers\Html;
//use yii\widgets\ActiveForm;
//use yii\jui\DatePicker;
use kartik\form\ActiveForm;
use kartik\datetime\DateTimePicker;
use yii\helpers\ArrayHelper;
use common\models\SysFormasOrg;
use common\models\SysTiposBienes;

/* @var $this yii\web\View */
/* @var $model app\models\Bienes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="bienes-form">

    <?php $form = ActiveForm::begin([
       // 'id' => 'login-form-inline', 
        'type' => ActiveForm::TYPE_HORIZONTAL,
        'formConfig' => ['labelSpan' => 3, 'deviceSize' => ActiveForm::SIZE_SMALL]
    ]); 
        $principioContable = ArrayHelper::map(SysFormasOrg::find()->all(), 'id', 'nombre');
        $tipoBien = ArrayHelper::map(SysTiposBienes::find()->all(), 'id', 'nombre');
    ?>

    <?= $form->field($model, 'sys_tipo_bien_id')->dropDownList(
            $tipoBien,
            ['prompt'=>'Seleccione tipo de bien']
        );
    ?>

    <?= $form->field($model, 'principio_contable')->dropDownList(
            $principioContable,
            ['prompt'=>'Seleccione el principio contable']
        );
    ?>

    

    <?php /* $form->field($model, 'deterioro')->checkbox()*/ ?>

     <?= $form->field($model, 'origen')->textarea(['maxlength' => 255]) ?>
 
     <?php /*echo $form->field($model, 'fecha_origen')->widget(\yii\jui\DatePicker::classname(), [
        'language' => 'es',
        'dateFormat' => 'dd-MM-yyyy',
    ]) */?> 
     <?= $form->field($model, 'fecha_origen')->widget(DateTimePicker::classname(), [
/*        'language' => 'es',
        'dateFormat' => 'dd-MM-yyyy',*/
                'options' => ['placeholder' => 'Seleccionar fecha origen'],
                'convertFormat' => true,
                'pluginOptions' => [
                    'format' => 'd-M-yyyy',
                    'startDate' => date('d-m-Y'),//'01-Mar-2014 12:00 AM',
                    'todayHighlight' => true
                ]
    ]) ?>


    <?= $form->field($model, 'detalle')->textarea(['maxlength' => 255]) ?>

    <?= $form->field($model, 'propio')->checkbox() ?>

    <?= $form->field($model, 'depreciable')->checkbox() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Crear' : 'Actualizar', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>
</div>