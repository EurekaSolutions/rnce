<?php

namespace common\models\c;

use kartik\builder\Form;
use kartik\money\MaskMoney;
use kartik\widgets\DatePicker;
use kartik\widgets\Select2;
use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "cuentas.e_tipos_movimientos".
 *
 * @property integer $id
 * @property integer $e_inversion_id
 * @property integer $movimiento_id
 * @property integer $motivo_retiro_id
 * @property string $fecha
 * @property string $monto_nominal
 * @property string $monto_nominal_ajustado
 * @property string $precio_adquisicion
 * @property string $gan_per
 * @property string $gan_per_ajustada
 * @property integer $creado_por
 * @property integer $actualizado_por
 * @property boolean $sys_status
 * @property string $sys_creado_el
 * @property string $sys_actualizado_el
 * @property string $sys_finalizado_el
 *
 * @property CuentasEInversiones $eInversion
 * @property CuentasSysConceptos $movimiento
 * @property CuentasSysConceptos $motivoRetiro
 */
class CuentasETiposMovimientos extends \common\components\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cuentas.e_tipos_movimientos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['e_inversion_id', 'movimiento_id', 'fecha', 'monto_nominal', 'monto_nominal_ajustado'], 'required', 'when'=> function ($model) {
                if($this->movimiento_id==60 and $model->einversion->retiro)
                    return true;
                if($this->movimiento_id==59 and $model->einversion->adicion)
                    return true;
                if($this->movimiento_id==58 and $model->einversion->adquisicion)
                    return true;
                return false;
            }, 'whenClient' => "function (attribute, value) {
                if($('#cuentasetiposmovimientos-movimiento_id').val() == 58 && $('#cuentaseinversiones-adquisicion').is(':checked'))
                    return true;
                if($('#cuentasetiposmovimientos-movimiento_id').val() == 59 && $('#cuentaseinversiones-adicion').is(':checked'))
                    return true;
                if($('#cuentasetiposmovimientos-movimiento_id').val() == 60 && $('#cuentaseinversiones-retiro').is(':checked'))
                    return true;
                return false;
            }"],
            [['e_inversion_id', 'movimiento_id', 'motivo_retiro_id', 'creado_por', 'actualizado_por'], 'integer'],
            [['fecha', 'sys_creado_el', 'sys_actualizado_el', 'sys_finalizado_el'], 'safe'],
            [['monto_nominal', 'monto_nominal_ajustado', 'precio_adquisicion', 'gan_per', 'gan_per_ajustada'], 'number'],
            [['sys_status'], 'boolean'],
            [['e_inversion_id', 'movimiento_id'], 'unique', 'targetAttribute' => ['e_inversion_id', 'movimiento_id'], 'message' => 'The combination of E Inversion ID and Movimiento ID has already been taken.']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'e_inversion_id' => Yii::t('app', 'E Inversion'),
            'movimiento_id' => Yii::t('app', 'Movimiento'),
            'motivo_retiro_id' => Yii::t('app', 'Motivo Retiro'),
            'fecha' => Yii::t('app', 'Fecha'),
            'monto_nominal' => Yii::t('app', 'Monto Nominal'),
            'monto_nominal_ajustado' => Yii::t('app', 'Monto Nominal Ajustado'),
            'precio_adquisicion' => Yii::t('app', 'Precio Adquisicion'),
            'gan_per' => Yii::t('app', 'Gan Per'),
            'gan_per_ajustada' => Yii::t('app', 'Gan Per Ajustada'),
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
    public function getEInversion()
    {
        return $this->hasOne(CuentasEInversiones::className(), ['id' => 'e_inversion_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMovimiento()
    {
        return $this->hasOne(CuentasSysConceptos::className(), ['id' => 'movimiento_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMotivoRetiro()
    {
        return $this->hasOne(CuentasSysConceptos::className(), ['id' => 'motivo_retiro_id']);
    }

    public function getFormAttribs() {
        return [
            // primary key column
            'id'=>[ // primary key attribute
                'type'=>Form::INPUT_HIDDEN,
                'columnOptions'=>['hidden'=>true]
            ],
            'movimiento_id'=>[ // primary key attribute
                'type'=>Form::INPUT_HIDDEN,
                'columnOptions'=>['hidden'=>true,'disabled'=>true]
            ],

            //'e_inversion_id' => ['type'=>Form::INPUT_WIDGET,'widgetClass'=>Select2::classname(),'options'=>['data'=>ArrayHelper::map(CuentasEInversiones::find()->all(),'id',function($model){ return $model->etiqueta();}),'options'=>['onchange'=>'']]],
            //'movimiento_id' => ['type'=>Form::INPUT_WIDGET,'widgetClass'=>Select2::classname(),'options'=>['data'=>ArrayHelper::map(CuentasSysConceptos::concepto('e.3'),'id','nombre'),'options'=>['onchange'=>'']]],
            'motivo_retiro_id' => ['type'=>Form::INPUT_WIDGET,'widgetClass'=>Select2::classname(),'columnOptions'=>['hidden'=>($this->movimiento_id==60)?false:true],'options'=>['data'=>ArrayHelper::map(CuentasSysConceptos::concepto('e.2'),'id','nombre'),'options'=>['id'=> uniqid(),'onchange'=>'']]],
            'fecha' => ['type'=>Form::INPUT_WIDGET,'widgetClass'=>DatePicker::className(), 'options'=>['options' => ['placeholder' => 'Seleccione fecha ...'],
            'convertFormat' => true,
            'pluginOptions' => [
                'format' => 'd-M-yyyy ',
                //'startDate' => date('d-m-Y h:i A'),//'01-Mar-2014 12:00 AM',
                'todayHighlight' => true
            ]]],
            'monto_nominal' => ['type'=>Form::INPUT_WIDGET,'widgetClass'=>MaskMoney::className(),'options'=>['options'=>['id'=>'monto_nominal_'.uniqid(),'hidden'=>true]]],
            //'monto_nominal_ajustado' => ['type'=>Form::INPUT_WIDGET,'widgetClass'=>MaskMoney::className(),],

            //Solo para retiroS
            'precio_adquisicion'=>['type'=>Form::INPUT_WIDGET,'widgetClass'=>MaskMoney::className(),'columnOptions'=>['hidden'=>($this->movimiento_id==60)?false:true],'options'=>[ 'options'=>['id'=>'precio_adquisicion'.uniqid(),],/* 'pluginOptions'=>['prefix'=>'','precision'=>'0'],*/]]


        ];
    }
}
