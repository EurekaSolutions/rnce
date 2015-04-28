<?php

namespace common\models\p;

use Yii;

/**
 * This is the model class for table "public.suplementarios".
 *
 * @property integer $id
 * @property integer $numero
 * @property string $valor
 * @property boolean $sys_status
 * @property string $sys_creado_el
 * @property string $sys_actualizado_el
 * @property string $sys_finalizado_el
 * @property boolean $suscrito
 * @property integer $acta_constitutiva_id
 * @property string $tipo_suplementario
 *
 * @property ActasConstitutivas $actaConstitutiva
 */
class Suplementarios extends \common\components\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'public.suplementarios';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['numero', 'acta_constitutiva_id'], 'integer'],
            [['valor'], 'number'],
            [['sys_status', 'suscrito'], 'boolean'],
            [['sys_creado_el', 'sys_actualizado_el', 'sys_finalizado_el'], 'safe'],
            [['suscrito', 'acta_constitutiva_id'], 'required'],
            [['tipo_suplementario'], 'string']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'numero' => Yii::t('app', 'Numero'),
            'valor' => Yii::t('app', 'Valor'),
            'sys_status' => Yii::t('app', 'Sys Status'),
            'sys_creado_el' => Yii::t('app', 'Sys Creado El'),
            'sys_actualizado_el' => Yii::t('app', 'Sys Actualizado El'),
            'sys_finalizado_el' => Yii::t('app', 'Sys Finalizado El'),
            'suscrito' => Yii::t('app', 'Suscrito'),
            'acta_constitutiva_id' => Yii::t('app', 'Acta Constitutiva ID'),
            'tipo_suplementario' => Yii::t('app', 'Tipo Suplementario'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getActaConstitutiva()
    {
        return $this->hasOne(ActasConstitutivas::className(), ['id' => 'acta_constitutiva_id']);
    }
}
