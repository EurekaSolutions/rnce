<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\builder\Form;
/* @var $this yii\web\View */
/* @var $model common\models\p\Certificados */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="certificados-form">

<?php $form = ActiveForm::begin(); ?>
    <?php if($model->scenario=='PRINCIPAL'){
        echo Html::tag('h3','Certificados Suscritas y Pagadas');
    } ?>
    <hr />
    <?php echo Form::widget([
    'model'=>$model,
    'form'=>$form,
    'columns'=>3,
    'attributes'=>$model->getFormAttribs()
      ]); ?>
      <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
    <?php ActiveForm::end(); ?>

</div>
