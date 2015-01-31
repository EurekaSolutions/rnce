<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Inversiones;

/**
 * InversionesSearch represents the model behind the search form about `app\models\Inversiones`.
 */
class InversionesSearch extends Inversiones
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'banco_id', 'contratista_id', 'plazo', 'tipo_inversion'], 'integer'],
            [['costo_adquisicion', 'valor_desvalorizacion', 'tasa_interes'], 'number'],
            [['ano'], 'safe'],
            [['activo'], 'boolean'],
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
        $query = Inversiones::find();

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
            'banco_id' => $this->banco_id,
            'costo_adquisicion' => $this->costo_adquisicion,
            'valor_desvalorizacion' => $this->valor_desvalorizacion,
            'contratista_id' => $this->contratista_id,
            'ano' => $this->ano,
            'activo' => $this->activo,
            'plazo' => $this->plazo,
            'tasa_interes' => $this->tasa_interes,
            'tipo_inversion' => $this->tipo_inversion,
        ]);

        return $dataProvider;
    }
}
