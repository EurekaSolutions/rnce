<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use wbraganca\dynamicform\DynamicFormWidget;
/* @var $this yii\web\View */
/* @var $model common\models\p\PersonasNaturales */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="contratos-valuaciones-form">

    <?php $form = ActiveForm::begin([
        'id' => "c_valuaciones",
  

]); ?>
    <div id="output6"></div>
    


             <?php DynamicFormWidget::begin([
                'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
                'widgetBody' => '.container-items', // required: css class selector
                'widgetItem' => '.item', // required: css class
                'limit' => 10, // the maximum times, an element can be cloned (default 999)
                'min' => 1, // 0 or 1 (default 1)
                'insertButton' => '.add-item', // css class
                'deleteButton' => '.remove-item', // css class
                'model' => $contrato_valuacion[0],
                'formId' => 'c_valuaciones',
                'formFields' => [
                    'orden_valuacion',
                    'monto',
                    
                ],
            ]); ?>

            <div class="container-items"><!-- widgetContainer -->
            <?php foreach ($contrato_valuacion as $i => $carga_valuacion): ?>
                <div class="item panel panel-default"><!-- widgetBody -->
                    <div class="panel-heading">
                        <div class="pull-right">
                            <button type="button" class="add-item btn btn-success btn-xs"><i class="glyphicon glyphicon-plus"></i></button>
                            <button type="button" class="remove-item btn btn-danger btn-xs"><i class="glyphicon glyphicon-minus"></i></button>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
                     
                     
                            
                            <div class="col-sm-6">
                                <?= $form->field($carga_valuacion, "[{$i}]orden_valuacion")->textInput() ?>
                            </div>
                               
                            <div class="col-sm-6">
                                <?= $form->field($carga_valuacion, "[{$i}]monto")->textInput() ?>
                            </div>
                            
                     
                    </div>
                </div>
            <?php endforeach; ?>
            </div>
            <?php DynamicFormWidget::end(); ?>
    
    
   
    <?php ActiveForm::end(); ?>

</div>


