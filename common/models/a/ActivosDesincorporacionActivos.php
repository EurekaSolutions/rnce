<?php

namespace common\models\a;

use kartik\builder\Form;
use kartik\money\MaskMoney;
use kartik\widgets\DatePicker;
use kartik\widgets\Select2;
use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "activos.desincorporacion_activos".
 *
 * @property integer $id
 * @property integer $sys_motivo_id
 * @property string $fecha
 * @property string $precio_venta
 * @property string $valor_neto_libro
 * @property integer $creado_por
 * @property integer $actualizado_por
 * @property boolean $sys_status
 * @property string $sys_creado_el
 * @property string $sys_actualizado_el
 * @property string $sys_finalizado_el
 *
 * @property ActivosSysMotivos $sysMotivo
 */
class ActivosDesincorporacionActivos extends \common\components\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'activos.desincorporacion_activos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sys_motivo_id', 'fecha', 'valor_neto_libro', 'precio_venta', 'valor_neto_libro'], 'required'],
            [['sys_motivo_id', 'creado_por', 'actualizado_por'], 'integer'],
            [['fecha', 'sys_creado_el', 'sys_actualizado_el', 'sys_finalizado_el'], 'safe'],
            [['precio_venta', 'valor_neto_libro'], 'number'],
            [['sys_status'], 'boolean']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'sys_motivo_id' => Yii::t('app', 'Motivo'),
            'fecha' => Yii::t('app', 'Fecha'),
            'precio_venta' => Yii::t('app', 'Precio Venta'),
            'valor_neto_libro' => Yii::t('app', 'Valor Neto Libro'),
            'creado_por' => Yii::t('app', 'Creado Por'),
            'actualizado_por' => Yii::t('app', 'Actualizado Por'),
            'sys_status' => Yii::t('app', 'Sys Status'),
            'sys_creado_el' => Yii::t('app', 'Sys Creado El'),
            'sys_actualizado_el' => Yii::t('app', 'Sys Actualizado El'),
            'sys_finalizado_el' => Yii::t('app', 'Sys Finalizado El'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysMotivo()
    {
        return $this->hasOne(ActivosSysMotivos::className(), ['id' => 'sys_motivo_id']);
    }

    public function getFormAttribs() {
        return [
            // primary key column
            'id'=>[ // primary key attribute
                'type'=>Form::INPUT_HIDDEN,
                'columnOptions'=>['hidden'=>true]
            ],

            'sys_motivo_id'=>['type'=>Form::INPUT_WIDGET,'widgetClass'=>Select2::classname(),'options'=>['data'=>ArrayHelper::map(ActivosSysMotivos::find()->all(),'id','nombre'),
                'options'=>['id'=>'motivo-desincorporacion','placeholder'=>'Seleccionar motivo', 'onchange'=>'js:'],'pluginOptions' => [
                    'allowClear' => false,
                ],]],

            'fecha'=>['type'=>Form::INPUT_WIDGET,'widgetClass'=>DatePicker::className(),'options'=>['options' => ['placeholder' => 'Seleccione fecha ...'],
                'convertFormat' => true,
                'pluginOptions' => [
                    'format' => 'd-M-yyyy ',
                    //'startDate' => date('d-m-Y h:i A'),//'01-Mar-2014 12:00 AM',
                    'todayHighlight' => true
                ]]],
            'precio_venta'=>['type'=>Form::INPUT_WIDGET,'widgetClass'=>MaskMoney::className(),],
            'valor_neto_libro'=>['type'=>Form::INPUT_WIDGET,'widgetClass'=>MaskMoney::className(),],

        ];
    }
}
