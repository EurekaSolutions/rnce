<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\a\ActivosDesincorporacionActivos;

/**
 * ActivosDesincorporacionActivosSearch represents the model behind the search form about `common\models\a\ActivosDesincorporacionActivos`.
 */
class ActivosDesincorporacionActivosSearch extends ActivosDesincorporacionActivos
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'sys_motivo_id', 'creado_por', 'actualizado_por'], 'integer'],
            [['fecha', 'sys_creado_el', 'sys_actualizado_el', 'sys_finalizado_el'], 'safe'],
            [['precio_venta', 'valor_neto_libro'], 'number'],
            [['sys_status'], 'boolean'],
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
        $query = ActivosDesincorporacionActivos::find();

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
            'sys_motivo_id' => $this->sys_motivo_id,
            'fecha' => $this->fecha,
            'precio_venta' => $this->precio_venta,
            'valor_neto_libro' => $this->valor_neto_libro,
            'creado_por' => $this->creado_por,
            'actualizado_por' => $this->actualizado_por,
            'sys_status' => $this->sys_status,
            'sys_creado_el' => $this->sys_creado_el,
            'sys_actualizado_el' => $this->sys_actualizado_el,
            'sys_finalizado_el' => $this->sys_finalizado_el,
        ]);

        return $dataProvider;
    }
}
