<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "sys_estados".
 *
 * @property integer $id
 * @property integer $sys_pais_id
 * @property string $nombre
 * @property boolean $sys_status
 * @property string $sys_creado_el
 * @property string $sys_actualizado_el
 * @property string $sys_finalizado_el
 *
 * @property Direcciones[] $direcciones
 * @property SysPaises $sysPais
 * @property SysCiudades[] $sysCiudades
 * @property SysMunicipios[] $sysMunicipios
 */
class SysEstados extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'sys_estados';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sys_pais_id', 'nombre'], 'required'],
            [['sys_pais_id'], 'integer'],
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
            'id' => 'ID',
            'sys_pais_id' => 'Sys Pais ID',
            'nombre' => 'Nombre',
            'sys_status' => 'Sys Status',
            'sys_creado_el' => 'Sys Creado El',
            'sys_actualizado_el' => 'Sys Actualizado El',
            'sys_finalizado_el' => 'Sys Finalizado El',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDirecciones()
    {
        return $this->hasMany(Direcciones::className(), ['sys_estado_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysPais()
    {
        return $this->hasOne(SysPaises::className(), ['id' => 'sys_pais_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysCiudades()
    {
        return $this->hasMany(SysCiudades::className(), ['sys_estado_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysMunicipios()
    {
        return $this->hasMany(SysMunicipios::className(), ['sys_estado_id' => 'id']);
    }
}
