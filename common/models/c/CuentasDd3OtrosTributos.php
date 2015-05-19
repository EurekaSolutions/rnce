<?php

namespace common\models\c;

use Yii;

/**
 * This is the model class for table "cuentas.dd3_otros_tributos".
 *
 * @property integer $id
 * @property string $tributo
 * @property string $saldo_p_anterior
 * @property string $importe_gasto_ejer_eco
 * @property string $importe_pago_ejer_eco
 * @property string $saldo_al_cierre
 * @property integer $contratista_id
 * @property string $anho
 * @property integer $creado_por
 * @property integer $actualizado_por
 * @property boolean $sys_status
 * @property string $sys_creado_el
 * @property string $sys_actualizado_el
 * @property string $sys_finalizado_el
 *
 * @property Contratistas $contratista
 */
class CuentasDd3OtrosTributos extends \common\components\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cuentas.dd3_otros_tributos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tributo', 'saldo_p_anterior', 'importe_gasto_ejer_eco', 'importe_pago_ejer_eco', 'saldo_al_cierre', 'contratista_id', 'anho'], 'required'],
            [['saldo_p_anterior', 'importe_gasto_ejer_eco', 'importe_pago_ejer_eco', 'saldo_al_cierre'], 'number'],
            [['contratista_id', 'creado_por', 'actualizado_por'], 'integer'],
            [['sys_status'], 'boolean'],
            [['sys_creado_el', 'sys_actualizado_el', 'sys_finalizado_el'], 'safe'],
            [['tributo'], 'string', 'max' => 255],
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
            'tributo' => Yii::t('app', 'Tributo'),
            'saldo_p_anterior' => Yii::t('app', 'Saldo P Anterior'),
            'importe_gasto_ejer_eco' => Yii::t('app', 'Importe Gasto Ejer Eco'),
            'importe_pago_ejer_eco' => Yii::t('app', 'Importe Pago Ejer Eco'),
            'saldo_al_cierre' => Yii::t('app', 'Saldo Al Cierre'),
            'contratista_id' => Yii::t('app', 'Contratista ID'),
            'anho' => Yii::t('app', 'Anho'),
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
    public function getContratista()
    {
        return $this->hasOne(Contratistas::className(), ['id' => 'contratista_id']);
    }
}