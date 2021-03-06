<?php

namespace common\models\c;

use Yii;
use kartik\builder\TabularForm;
use kartik\grid\GridView;
use yii\helpers\ArrayHelper;
use kartik\builder\Form;
use kartik\builder\ActiveFormEvent;
use yii\helpers\Html;
use common\models\p\BancosContratistas;
use common\models\p\SysDivisas;
use kartik\widgets\DatePicker;

/**
 * This is the model class for table "cuentas.a_inversiones_negociar".
 *
 * @property integer $id
 * @property integer $banco_id
 * @property string $fecha_inversion
 * @property string $fecha_finalizacion
 * @property string $tasa
 * @property integer $plazo
 * @property string $costo_adquisicion
 * @property string $valorizacion
 * @property string $saldo_al_cierre
 * @property string $intereses_act_eco
 * @property integer $tipo_moneda_id
 * @property string $monto_moneda_extra
 * @property string $tipo_cambio_cierre
 * @property boolean $sys_status
 * @property string $sys_creado_el
 * @property string $sys_actualizado_el
 * @property string $sys_finalizado_el
 * @property integer $contratista_id
 * @property string $anho
 * @property integer $creado_por
 * @property integer $total_id
 *
 * @property BancosContratistas $banco
 * @property SysDivisas $tipoMoneda
 * @property Contratistas $contratista
 * @property User $creadoPor
 * @property SysTotales $total
 */
class AInversionesNegociar extends \common\components\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cuentas.a_inversiones_negociar';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['banco_id', 'fecha_inversion', 'fecha_finalizacion', 'tasa', 'plazo', 'costo_adquisicion', 'valorizacion', 'saldo_al_cierre', 'intereses_act_eco'], 'required', 'on' => 'nacional'],
            [['banco_id', 'fecha_inversion', 'fecha_finalizacion', 'tasa', 'plazo', 'costo_adquisicion', 'valorizacion', 'saldo_al_cierre', 'intereses_act_eco', 'tipo_moneda_id', 'monto_moneda_extra', 'tipo_cambio_cierre'], 'required', 'on' => 'extranjero'],
            [['banco_id', 'plazo', 'tipo_moneda_id', 'contratista_id', 'creado_por'], 'integer'],
            [['fecha_inversion', 'fecha_finalizacion', 'sys_creado_el', 'sys_actualizado_el', 'sys_finalizado_el'], 'safe'],
            [['tasa', 'costo_adquisicion', 'valorizacion', 'saldo_al_cierre', 'intereses_act_eco', 'monto_moneda_extra', 'tipo_cambio_cierre'], 'number'],
            [['sys_status'], 'boolean'],
            [['anho'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'banco_id' => Yii::t('app', 'Banco ID'),
            'fecha_inversion' => Yii::t('app', 'Fecha Inversion'),
            'fecha_finalizacion' => Yii::t('app', 'Fecha Finalizacion'),
            'tasa' => Yii::t('app', 'Tasa'),
            'plazo' => Yii::t('app', 'Plazo'),
            'costo_adquisicion' => Yii::t('app', 'Costo Adquisicion'),
            'valorizacion' => Yii::t('app', 'Valorizacion'),
            'saldo_al_cierre' => Yii::t('app', 'Saldo Al Cierre'),
            'intereses_act_eco' => Yii::t('app', 'Intereses Act Eco'),
            'tipo_moneda_id' => Yii::t('app', 'Tipo Moneda ID'),
            'monto_moneda_extra' => Yii::t('app', 'Monto Moneda Extra'),
            'tipo_cambio_cierre' => Yii::t('app', 'Tipo Cambio Cierre'),
            'sys_status' => Yii::t('app', 'Sys Status'),
            'sys_creado_el' => Yii::t('app', 'Sys Creado El'),
            'sys_actualizado_el' => Yii::t('app', 'Sys Actualizado El'),
            'sys_finalizado_el' => Yii::t('app', 'Sys Finalizado El'),
            'contratista_id' => Yii::t('app', 'Contratista ID'),
            'anho' => Yii::t('app', 'Anho'),
            'creado_por' => Yii::t('app', 'Creado Por'),
            'total_id' => Yii::t('app', 'Total ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBanco()
    {
        return $this->hasOne(BancosContratistas::className(), ['id' => 'banco_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTipoMoneda()
    {
        return $this->hasOne(SysDivisas::className(), ['id' => 'tipo_moneda_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getContratista()
    {
        return $this->hasOne(Contratistas::className(), ['id' => 'contratista_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCreadoPor()
    {
        return $this->hasOne(User::className(), ['id' => 'creado_por']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTotal()
    {
        return $this->hasOne(SysTotales::className(), ['id' => 'total_id']);
    }

    public function getFormAttribs($id) {
        
        if($id=='nacional')
        {
            //where(['nacional' => true])->
            $ban = BancosContratistas::find()->all();
            $array = array();
            foreach ($ban as $key => $value) {
                if($value->banco->nacional)
                $array[] = ['id' => $value->id, 'nombre' => $value->banco->nombre];
            }

            return [
                // primary key column
                'id'=>[ // primary key attribute
                    'type'=>TabularForm::INPUT_HIDDEN,
                    'columnOptions'=>['hidden'=>true]
                ],
                'banco_id'=>['type'=>Form::INPUT_DROPDOWN_LIST, 'items'=>ArrayHelper::map($array, 'id', 'nombre'), 'label'=>'Banco'],
                //'fecha_inversion'=>['type'=>Form::INPUT_TEXT,'label'=>'Fecha inversión'],

                'fecha_inversion'=>['type'=>Form::INPUT_WIDGET,'widgetClass'=>DatePicker::className(),'options'=>['options' => ['placeholder' => 'Seleccione fecha ...'],
                'convertFormat' => true,
                'pluginOptions' => [
                'format' => 'd-M-yyyy ',
                //'startDate' => date('d-m-Y h:i A'),//'01-Mar-2014 12:00 AM',
                'todayHighlight' => true
                ]]],
                //'fecha_finalizacion'=>['type'=>Form::INPUT_TEXT,'label'=>'Fecha finalización'],
                'fecha_finalizacion'=>['type'=>Form::INPUT_WIDGET,'widgetClass'=>DatePicker::className(),'options'=>['options' => ['placeholder' => 'Seleccione fecha ...'],
                'convertFormat' => true,
                'pluginOptions' => [
                'format' => 'd-M-yyyy ',
                //'startDate' => date('d-m-Y h:i A'),//'01-Mar-2014 12:00 AM',
                'todayHighlight' => true
                ]]],
                'tasa'=>['type'=>Form::INPUT_TEXT,'label'=>'Tasa'],
                'plazo'=>['type'=>Form::INPUT_TEXT,'label'=>'Plazo'],
                'costo_adquisicion'=>['type'=>Form::INPUT_TEXT,'label'=>'Costo adquisición'],
                'valorizacion'=>['type'=>Form::INPUT_TEXT,'label'=>'Valorización'],
                'saldo_al_cierre'=>['type'=>Form::INPUT_TEXT,'label'=>'Saldo al cierre'],
                'intereses_act_eco'=>['type'=>Form::INPUT_TEXT,'label'=>'Intereses durante actividad economica'],
                //'tipo_moneda_id'=>['type'=>Form::INPUT_DROPDOWN_LIST, 'items'=>ArrayHelper::map(SysDivisas::find()->orderBy('nombre')->asArray()->all(), 'id', 'nombre'), 'label'=>'Divisa'],
                //'monto_moneda_extra'=>['type'=>Form::INPUT_TEXT,'label'=>'Monto moneda extranjera'],
                //'tipo_cambio_cierre'=>['type'=>Form::INPUT_TEXT,'label'=>'Tipo de cambio al cierre'],

            ];

        }else
        {
            //where(['nacional' => true])->
            $ban = BancosContratistas::find()->all();
            $array = array();
            foreach ($ban as $key => $value) {
                if(!$value->banco->nacional)
                $array[] = ['id' => $value->id, 'nombre' => $value->banco->nombre];
            }

           return [
                // primary key column
                'id'=>[ // primary key attribute
                    'type'=>TabularForm::INPUT_HIDDEN,
                    'columnOptions'=>['hidden'=>true]
                ],
                'banco_id'=>['type'=>Form::INPUT_DROPDOWN_LIST, 'items'=>ArrayHelper::map($array, 'id', 'nombre'), 'label'=>'Banco'],
                'fecha_inversion'=>['type'=>Form::INPUT_WIDGET,'widgetClass'=>DatePicker::className(),'options'=>['options' => ['placeholder' => 'Seleccione fecha ...'],
                'convertFormat' => true,
                'pluginOptions' => [
                'format' => 'd-M-yyyy ',
                //'startDate' => date('d-m-Y h:i A'),//'01-Mar-2014 12:00 AM',
                'todayHighlight' => true
                ]]],
                //'fecha_finalizacion'=>['type'=>Form::INPUT_TEXT,'label'=>'Fecha finalización'],
                'fecha_finalizacion'=>['type'=>Form::INPUT_WIDGET,'widgetClass'=>DatePicker::className(),'options'=>['options' => ['placeholder' => 'Seleccione fecha ...'],
                'convertFormat' => true,
                'pluginOptions' => [
                'format' => 'd-M-yyyy ',
                //'startDate' => date('d-m-Y h:i A'),//'01-Mar-2014 12:00 AM',
                'todayHighlight' => true
                ]]],
                'tasa'=>['type'=>Form::INPUT_TEXT,'label'=>'Tasa'],
                'plazo'=>['type'=>Form::INPUT_TEXT,'label'=>'Plazo'],
                'costo_adquisicion'=>['type'=>Form::INPUT_TEXT,'label'=>'Costo adquisición'],
                'valorizacion'=>['type'=>Form::INPUT_TEXT,'label'=>'Valorización'],
                'saldo_al_cierre'=>['type'=>Form::INPUT_TEXT,'label'=>'Saldo al cierre'],
                'intereses_act_eco'=>['type'=>Form::INPUT_TEXT,'label'=>'Intereses durante actividad economica'],
                'tipo_moneda_id'=>['type'=>Form::INPUT_DROPDOWN_LIST, 'items'=>ArrayHelper::map(SysDivisas::find()->orderBy('nombre')->asArray()->all(), 'id', 'nombre'), 'label'=>'Divisa'],
                'monto_moneda_extra'=>['type'=>Form::INPUT_TEXT,'label'=>'Monto moneda extranjera'],
                'tipo_cambio_cierre'=>['type'=>Form::INPUT_TEXT,'label'=>'Tipo de cambio al cierre'],

            ];
        }
    }
}
