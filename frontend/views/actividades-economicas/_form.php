<?php
use kartik\widgets\ActiveForm;
use yii\helpers\Html;
use kartik\builder\Form;
/* @var $this yii\web\View */
/* @var $model common\models\p\ActividadesEconomicas */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="actividades-economicas-form">

    
    <?php $form = ActiveForm::begin([
        'type'=>ActiveForm::TYPE_VERTICAL
  ]); ?>
    

     <?php echo Form::widget([
    'model'=>$model,
    'form'=>$form,
    'columns'=>4,
    'attributes'=>$model->formAttribs
      ]); ?>
    <?= $form->field($model, 'documento_registrado_id')->hiddenInput()->label(false) ?>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
