<?php

namespace common\models\p;

use Yii;

/**
 * This is the model class for table "public.sys_parroquias".
 *
 * @property integer $id
 * @property integer $sys_municipio_id
 * @property string $nombre
 * @property boolean $sys_status
 * @property string $sys_creado_el
 * @property string $sys_actualizado_el
 * @property string $sys_finalizado_el
 *
 * @property Direcciones[] $direcciones
 * @property SysMunicipios $sysMunicipio
 */
class SysParroquias extends \common\components\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'public.sys_parroquias';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['sys_municipio_id', 'nombre'], 'required'],
            [['sys_municipio_id'], 'integer'],
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
            'sys_municipio_id' => Yii::t('app', 'Sys Municipio ID'),
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
    public function getDirecciones()
    {
        return $this->hasMany(Direcciones::className(), ['sys_parroquia_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSysMunicipio()
    {
        return $this->hasOne(SysMunicipios::className(), ['id' => 'sys_municipio_id']);
    }
}
