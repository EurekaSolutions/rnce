<?php

namespace common\models\p;

use Yii;

/**
 * This is the model class for table "public.comisarios_auditores".
 *
 * @property integer $id
 * @property string $fecha_vencimiento
 * @property boolean $declaracion_jurada
 * @property string $tipo_profesion
 * @property string $fecha_carta
 * @property string $colegiatura
 * @property integer $documento_registrado_id
 * @property integer $contratista_id
 * @property boolean $comisario
 * @property boolean $sys_status
 * @property string $sys_creado_el
 * @property string $sys_actualizado_el
 * @property string $sys_finalizado_el
 * @property boolean $auditor
 * @property boolean $responsable_contabilidad
 * @property boolean $informe_conversion
 * @property integer $natural_juridica_id
 */
class ComisariosAuditores extends \common\components\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'public.comisarios_auditores';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['fecha_vencimiento', 'tipo_profesion', 'fecha_carta', 'documento_registrado_id', 'contratista_id', 'comisario', 'auditor', 'responsable_contabilidad', 'informe_conversion', 'natural_juridica_id'], 'required'],
            [['fecha_vencimiento', 'fecha_carta', 'sys_creado_el', 'sys_actualizado_el', 'sys_finalizado_el'], 'safe'],
            [['declaracion_jurada', 'comisario', 'sys_status', 'auditor', 'responsable_contabilidad', 'informe_conversion'], 'boolean'],
            [['tipo_profesion'], 'string'],
            [['documento_registrado_id', 'contratista_id', 'natural_juridica_id'], 'integer'],
            [['colegiatura'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'fecha_vencimiento' => Yii::t('app', 'Fecha Vencimiento'),
            'declaracion_jurada' => Yii::t('app', 'Declaracion Jurada'),
            'tipo_profesion' => Yii::t('app', 'Tipo Profesion'),
            'fecha_carta' => Yii::t('app', 'Fecha Carta'),
            'colegiatura' => Yii::t('app', 'Colegiatura'),
            'documento_registrado_id' => Yii::t('app', 'Documento Registrado ID'),
            'contratista_id' => Yii::t('app', 'Contratista ID'),
            'comisario' => Yii::t('app', 'Comisario'),
            'sys_status' => Yii::t('app', 'Sys Status'),
            'sys_creado_el' => Yii::t('app', 'Sys Creado El'),
            'sys_actualizado_el' => Yii::t('app', 'Sys Actualizado El'),
            'sys_finalizado_el' => Yii::t('app', 'Sys Finalizado El'),
            'auditor' => Yii::t('app', 'Auditor'),
            'responsable_contabilidad' => Yii::t('app', 'Responsable Contabilidad'),
            'informe_conversion' => Yii::t('app', 'Informe Conversion'),
            'natural_juridica_id' => Yii::t('app', 'Natural Juridica ID'),
        ];
    }
}
