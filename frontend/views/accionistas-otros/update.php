<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\p\AccionistasOtros */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Accionistas Otros',
]) . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Accionistas Otros'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="accionistas-otros-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'modelPersona'=>$modelPersona,
        'modelJuridica'=>$modelJuridica,
    ]) ?>

</div>
