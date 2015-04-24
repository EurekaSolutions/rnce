<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\p\CierresEjercicios;

/**
 * CierresEjerciciosSearch represents the model behind the search form about `common\models\p\CierresEjercicios`.
 */
class CierresEjerciciosSearch extends CierresEjercicios
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'contratista_id', 'documento_registrado_id'], 'integer'],
            [['fecha_cierre', 'sys_creado_el', 'sys_actualizado_el', 'sys_finalizado_el'], 'safe'],
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
        $query = CierresEjercicios::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'contratista_id' => $this->contratista_id,
            'documento_registrado_id' => $this->documento_registrado_id,
            'fecha_cierre' => $this->fecha_cierre,
            'sys_status' => $this->sys_status,
            'sys_creado_el' => $this->sys_creado_el,
            'sys_actualizado_el' => $this->sys_actualizado_el,
            'sys_finalizado_el' => $this->sys_finalizado_el,
        ]);

        return $dataProvider;
    }
}
