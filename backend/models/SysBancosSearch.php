<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\p\SysBancos;

/**
 * SysBancosSearch represents the model behind the search form about `common\models\p\SysBancos`.
 */
class SysBancosSearch extends SysBancos
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'sys_pais_id', 'creado_por', 'actualizado_por'], 'integer'],
            [['nombre', 'rif', 'codigo_sudeban', 'codigo_swift', 'sys_creado_el', 'sys_actualizado_el', 'sys_finalizado_el'], 'safe'],
            [['nacional', 'sys_status'], 'boolean'],
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
        $query = SysBancos::find();

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
            'sys_pais_id' => $this->sys_pais_id,
            'nacional' => $this->nacional,
            'creado_por' => $this->creado_por,
            'actualizado_por' => $this->actualizado_por,
            'sys_status' => $this->sys_status,
            'sys_creado_el' => $this->sys_creado_el,
            'sys_actualizado_el' => $this->sys_actualizado_el,
            'sys_finalizado_el' => $this->sys_finalizado_el,
        ]);

        $query->andFilterWhere(['like', 'nombre', $this->nombre])
            ->andFilterWhere(['like', 'rif', $this->rif])
            ->andFilterWhere(['like', 'codigo_sudeban', $this->codigo_sudeban])
            ->andFilterWhere(['like', 'codigo_swift', $this->codigo_swift]);

        return $dataProvider;
    }
}
