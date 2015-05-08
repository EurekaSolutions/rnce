<?php

namespace common\models\p;

use Yii;

/**
 * This is the model class for table "public.accionistas_otros".
 *
 * @property integer $id
 * @property integer $contratista_id
 * @property integer $natural_juridica_id
 * @property string $porcentaje_accionario
 * @property string $valor_compra
 * @property string $fecha
 * @property boolean $accionista
 * @property boolean $junta_directiva
 * @property boolean $rep_legal
 * @property string $cargo
 * @property integer $documento_registrado_id
 * @property boolean $sys_status
 * @property string $sys_creado_el
 * @property string $sys_actualizado_el
 * @property string $sys_finalizado_el
 * @property string $repr_legal_vigencia
 * @property integer $empresa_fusionada_id
 * @property string $tipo_obligacion
 *
 * @property Contratistas $contratista
 * @property SysNaturalesJuridicas $naturalJuridica
 * @property DocumentosRegistrados $documentoRegistrado
 * @property EmpresasFusionadas $empresaFusionada
 * @property ActasConstitutivas[] $actasConstitutivas
 * @property PagosAccionistasDecretos[] $pagosAccionistasDecretos
 */
class AccionistasOtros extends \common\components\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'public.accionistas_otros';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['contratista_id', 'natural_juridica_id', 'accionista', 'junta_directiva', 'rep_legal', 'tipo_obligacion'], 'required'],
            [['contratista_id', 'natural_juridica_id', 'documento_registrado_id', 'empresa_fusionada_id'], 'integer'],
            [['porcentaje_accionario', 'valor_compra'], 'number'],
            [['fecha', 'sys_creado_el', 'sys_actualizado_el', 'sys_finalizado_el', 'repr_legal_vigencia'], 'safe'],
            [['accionista', 'junta_directiva', 'rep_legal', 'sys_status'], 'boolean'],
            [['tipo_obligacion'], 'string'],
            [['cargo'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'contratista_id' => Yii::t('app', 'Contratista ID'),
            'natural_juridica_id' => Yii::t('app', 'Numero de identificacion'),
            'porcentaje_accionario' => Yii::t('app', 'Porcentaje Accionario'),
            'valor_compra' => Yii::t('app', 'Valor Compra'),
            'fecha' => Yii::t('app', 'Fecha'),
            'accionista' => Yii::t('app', 'Accionista'),
            'junta_directiva' => Yii::t('app', 'Junta Directiva'),
            'rep_legal' => Yii::t('app', 'Rep Legal'),
            'cargo' => Yii::t('app', 'Cargo'),
            'documento_registrado_id' => Yii::t('app', 'Documento Registrado ID'),
            'sys_status' => Yii::t('app', 'Sys Status'),
            'sys_creado_el' => Yii::t('app', 'Sys Creado El'),
            'sys_actualizado_el' => Yii::t('app', 'Sys Actualizado El'),
            'sys_finalizado_el' => Yii::t('app', 'Sys Finalizado El'),
            'repr_legal_vigencia' => Yii::t('app', 'Fecha Vigencia del representante legal'),
            'empresa_fusionada_id' => Yii::t('app', 'Empresa Fusionada ID'),
            'tipo_obligacion' => Yii::t('app', 'Tipo Obligacion'),
        ];
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
    public function getNaturalJuridica()
    {
        return $this->hasOne(SysNaturalesJuridicas::className(), ['id' => 'natural_juridica_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocumentoRegistrado()
    {
        return $this->hasOne(DocumentosRegistrados::className(), ['id' => 'documento_registrado_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEmpresaFusionada()
    {
        return $this->hasOne(EmpresasFusionadas::className(), ['id' => 'empresa_fusionada_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getActasConstitutivas()
    {
        return $this->hasMany(ActasConstitutivas::className(), ['accionista_otro' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPagosAccionistasDecretos()
    {
        return $this->hasMany(PagosAccionistasDecretos::className(), ['accionista_id' => 'id']);
    }
}
