<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\p\OrigenesCapitales;

/**
 * OrigenesCapitalesSearch represents the model behind the search form about `common\models\p\OrigenesCapitales`.
 */
class OrigenesCapitalesSearch extends OrigenesCapitales
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'bien_id', 'banco_contratista_id', 'numero_accion', 'contratista_id', 'documento_registrado_id', 'creado_por', 'actualizado_por', 'numero_transaccion'], 'integer'],
            [['monto', 'saldo_cierre_anterior', 'saldo_corte', 'monto_aumento', 'saldo_aumento', 'valor_acciones', 'saldo_cierre_ajustado'], 'number'],
            [['fecha', 'fecha_corte', 'fecha_aumento', 'sys_creado_el', 'sys_actualizado_el', 'sys_finalizado_el'], 'safe'],
            [['sys_status', 'efectivo', 'banco', 'bien', 'cuenta_pagar', 'decreto','principal'], 'boolean'],
            [['tipo_origen','tipo_cuenta'], 'string'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = OrigenesCapitales::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'bien_id' => $this->bien_id,
            'banco_contratista_id' => $this->banco_contratista_id,
            'monto' => $this->monto,
            'fecha' => $this->fecha,
            'saldo_cierre_anterior' => $this->saldo_cierre_anterior,
            'saldo_corte' => $this->saldo_corte,
            'fecha_corte' => $this->fecha_corte,
            'monto_aumento' => $this->monto_aumento,
            'saldo_aumento' => $this->saldo_aumento,
            'numero_accion' => $this->numero_accion,
            'valor_acciones' => $this->valor_acciones,
            'saldo_cierre_ajustado' => $this->saldo_cierre_ajustado,
            'fecha_aumento' => $this->fecha_aumento,
            'contratista_id' => Yii::$app->user->identity->contratista_id,
            'documento_registrado_id' => $this->documento_registrado_id,
            'creado_por' => $this->creado_por,
            'actualizado_por' => $this->actualizado_por,
            'sys_status' => $this->sys_status,
            'sys_creado_el' => $this->sys_creado_el,
            'sys_actualizado_el' => $this->sys_actualizado_el,
            'sys_finalizado_el' => $this->sys_finalizado_el,
            'numero_transaccion' => $this->numero_transaccion,
            'efectivo' => $this->efectivo,
            'banco' => $this->banco,
            'bien' => $this->bien,
            'cuenta_pagar' => $this->cuenta_pagar,
            'decreto' => $this->decreto,
            'tipo_origen' => $this->tipo_origen,
            'principal' => $this->principal,
            'tipo_cuenta' => $this->tipo_cuenta,
        ]);

        return $dataProvider;
    }
}
