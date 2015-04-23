<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\p\BancosContratistas */

$this->title = Yii::t('app', 'Create Bancos Contratistas');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Bancos Contratistas'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="bancos-contratistas-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
