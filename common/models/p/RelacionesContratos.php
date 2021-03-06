<?php

namespace common\models\p;
use kartik\builder\Form;
use yii\helpers\Url;
use common\models\p\SysNaturalesJuridicas;
use kartik\widgets\Select2;
use yii\web\JsExpression;
use Yii;

/**
 * This is the model class for table "public.relaciones_contratos".
 *
 * @property integer $id
 * @property integer $contratista_id
 * @property string $tipo_sector
 * @property string $tipo_contrato
 * @property string $nombre_proyecto
 * @property string $fecha_inicio
 * @property string $fecha_fin
 * @property string $monto_contrato
 * @property string $anticipo_recibido
 * @property double $porcentaje_ejecucion
 * @property string $evaluacion_ente
 * @property boolean $sys_status
 * @property string $sys_creado_el
 * @property string $sys_actualizado_el
 * @property string $sys_finalizado_el
 * @property integer $natural_juridica_id
 *
 * @property ContratosFacturas[] $contratosFacturas
 * @property ContratosValuaciones[] $contratosValuaciones
 * @property Contratistas $contratista
 * @property SysNaturalesJuridicas $naturalJuridica
 */
class RelacionesContratos extends \common\components\BaseActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'public.relaciones_contratos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['contratista_id', 'tipo_sector', 'tipo_contrato', 'nombre_proyecto', 'fecha_inicio', 'fecha_fin', 'monto_contrato', 'natural_juridica_id'], 'required'],
            [['contratista_id', 'natural_juridica_id'], 'integer'],
            [['tipo_sector', 'tipo_contrato'], 'string'],
            [['fecha_inicio', 'fecha_fin', 'sys_creado_el', 'sys_actualizado_el', 'sys_finalizado_el'], 'safe'],
            [['monto_contrato', 'anticipo_recibido', 'porcentaje_ejecucion'], 'number'],
            [['sys_status', 'evaluacion_ente'], 'boolean'],
            [['nombre_proyecto'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'contratista_id' => Yii::t('app', 'Contratista'),
            'tipo_sector' => Yii::t('app', 'Tipo Sector'),
            'tipo_contrato' => Yii::t('app', 'Tipo Contrato'),
            'nombre_proyecto' => Yii::t('app', 'Nombre Proyecto'),
            'fecha_inicio' => Yii::t('app', 'Fecha Inicio'),
            'fecha_fin' => Yii::t('app', 'Fecha Fin'),
            'monto_contrato' => Yii::t('app', 'Monto Contrato'),
            'anticipo_recibido' => Yii::t('app', 'Anticipo Recibido'),
            'porcentaje_ejecucion' => Yii::t('app', 'Porcentaje Ejecucion'),
            'evaluacion_ente' => Yii::t('app', 'Evaluacion Ente'),
            'sys_status' => Yii::t('app', 'Sys Status'),
            'sys_creado_el' => Yii::t('app', 'Sys Creado El'),
            'sys_actualizado_el' => Yii::t('app', 'Sys Actualizado El'),
            'sys_finalizado_el' => Yii::t('app', 'Sys Finalizado El'),
            'natural_juridica_id' => Yii::t('app', 'Natural Juridica'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getContratosFacturas()
    {
        return $this->hasMany(ContratosFacturas::className(), ['relacion_contrato_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getContratosValuaciones()
    {
        return $this->hasMany(ContratosValuaciones::className(), ['relacion_contrato_id' => 'id']);
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
    
     public function getFormAttribs() {
    
        
      $sector= [ 'PUBLICO' => 'PUBLICO', 'PRIVADO' => 'PRIVADO', ];
     $contrato= [ 'OBRAS' => 'OBRAS', 'SERVICIOS' => 'SERVICIOS', 'BIENES' => 'BIENES', ];
     $persona = empty($this->natural_juridica_id) ? '' : SysNaturalesJuridicas::findOne($this->natural_juridica_id)->denominacion;
    return [
           'natural_juridica_id'=>['type'=>Form::INPUT_WIDGET,'widgetClass'=>Select2::classname(),'options'=>[
                'initValueText' => $persona,
                'options'=>['placeholder' => 'Buscar persona ...'],'pluginOptions' => [
                'allowClear' => true,
                'minimumInputLength' => 3,
                'ajax' => [
                    'url' => \yii\helpers\Url::to(['sys-naturales-juridicas/naturales-juridicas-lista']),
                    'dataType' => 'json',
                    'data' => new JsExpression('function(params) { return {q:params.term,juridica:true}; }')
                ],
                'escapeMarkup' => new JsExpression('function (markup) { return markup; }'),
                'templateResult' => new JsExpression('function(natural_juridica_id) { return natural_juridica_id.text; }'),
                'templateSelection' => new JsExpression('function (natural_juridica_id) { return natural_juridica_id.text; }'),
            ],]],
          'tipo_sector'=>['type'=>Form::INPUT_DROPDOWN_LIST,'items'=>$sector , 'options'=>['prompt'=>'Seleccione el sector']],
          'tipo_contrato'=>['type'=>Form::INPUT_DROPDOWN_LIST,'items'=>$contrato , 'options'=>['prompt'=>'Seleccione el tipo de contrato']],
          /*'tipo_contrato'=>['type'=>Form::INPUT_DROPDOWN_LIST,'items'=>$contrato , 'options'=>['prompt'=>'Seleccione el tipo de contrato', 'onchange'=>'
                       
            if($(this).val()!=""){
             $.get( "'.Url::toRoute('/relaciones-contratos/tiposector').'", { id: $(this).val() } )
                            .done(function( data ) {
                                $( "#output" ).html( data );
                            }
                        );
            }']],*/

        'nombre_proyecto'=>['type'=>Form::INPUT_TEXT,'options'=>['placeholder'=>'Nombre del proyecto']],
        'monto_contrato'=>['type'=>Form::INPUT_TEXT,'options'=>['placeholder'=>'Monto contrato']],
        'anticipo_recibido'=>['type'=>Form::INPUT_TEXT,'options'=>['placeholder'=>'Monto contrato']],
        'porcentaje_ejecucion'=>['type'=>Form::INPUT_TEXT,'options'=>['placeholder'=>'Porcentaje de ejecucion']],
        'fecha_inicio'=>[
            'type'=>Form::INPUT_WIDGET, 
            'widgetClass'=>'\kartik\widgets\DatePicker', 
            'options'=>['pluginOptions' => [
                    'autoclose'=>true,
                    'format' => 'yyyy-mm-dd'
                ]],
        ], 
        'fecha_fin'=>[
            'type'=>Form::INPUT_WIDGET, 
            'widgetClass'=>'\kartik\widgets\DatePicker', 
            'options'=>['pluginOptions' => [
                    'autoclose'=>true,
                    'format' => 'yyyy-mm-dd'
                ]],
        ],
        'evaluacion_ente'=>['type'=>Form::INPUT_CHECKBOX],
      
    ];
    
    
    }
}
