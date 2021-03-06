<?php

namespace common\models\p;

use Yii;

/**
 * This is the model class for table "public.sys_denominaciones_comerciales".
 *
 * @property integer $id
 * @property string $nombre
 * @property boolean $sys_status
 * @property string $sys_creado_el
 * @property string $sys_actualizado_el
 * @property string $sys_finalizado_el
 *
 * @property DenominacionesComerciales[] $denominacionesComerciales
 * @property SysSubdenominacionesComerciales[] $sysSubdenominacionesComerciales
 */
class SysDenominacionesComerciales extends \common\components\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'public.sys_denominaciones_comerciales';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'required'],
            [['id'], 'integer'],
            [['sys_status'], 'boolean'],
            [['sys_creado_el', 'sys_actualizado_el', 'sys_finalizado_el'], 'safe'],
            [['nombre'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'nombre' => Yii::t('app', 'Nombre'),
            'sys_status' => Yii::t('app', 'Sys Status'),
            'sys_creado_el' => Yii::t('app', 'Sys Creado El'),
            'sys_actualizado_el' => Yii::t('app', 'Sys Actualizado El'),
            'sys_finalizado_el' => Yii::t('app', 'Sys Finalizado El'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDenominacionesComerciales()
    {
        return $this->hasMany(DenominacionesComerciales::className(), ['sys_denominacion_comercial_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysSubdenominacionesComerciales()
    {
        return $this->hasMany(SysSubdenominacionesComerciales::className(), ['sys_denominacion_comercial_id' => 'id']);
    }
}
