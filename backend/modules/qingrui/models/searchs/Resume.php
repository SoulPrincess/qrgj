<?php
/**
 * Created by PhpStorm.
 * User: LHP
 * Date: 2020/6/3
 * Time: 11:57
 */
namespace qingrui\models\searchs;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use qingrui\models\Resume as ResumeModel;
class Resume extends ResumeModel
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name','post','sex','username'], 'safe'],
        ];
    }
    /**
     * Searching Resume
     * @param  array $params
     * @return \yii\data\ActiveDataProvider
     */
    public function search($params)
    {
        $query = ResumeModel::find()
            ->from(ResumeModel::tableName() . ' r')
            ->leftJoin(['u'=>'t_admin'],'u.id=r.uid');

        $dataProvider = new ActiveDataProvider([
            'query' => $query
        ]);

        $sort = $dataProvider->getSort();
        $sort->attributes['r.sex'] = [
            'asc' => ['r.sex' => SORT_ASC],
            'desc' => ['r.sex' => SORT_DESC],
            'label' => 'sex',
        ];
        $sort->attributes['r.updated_at'] = [
            'asc' => ['r.updated_at' => SORT_ASC],
            'desc' => ['r.updated_at' => SORT_DESC],
            'label' => 'updated_at',
        ];
        $sort->defaultOrder = ['r.updated_at' => SORT_DESC];
        $query->andFilterWhere(['like', 'u.username', $this->username]);
        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }
        return $dataProvider;
    }

}