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
use qingrui\models\Customer as CustomerModel;
class Customer extends CustomerModel
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name','post','sex','status','username'], 'safe'],
        ];
    }
    /**
     * Searching Customer
     * @param  array $params
     * @return \yii\data\ActiveDataProvider
     */
    public function search($params)
    {
        $query = CustomerModel::find()
            //->select(['u.username','c.*'])
            ->from(CustomerModel::tableName() . ' c')
            ->leftJoin(['u'=>'t_admin'],'u.id=c.uid');

        $dataProvider = new ActiveDataProvider([
            'query' => $query
        ]);

        $sort = $dataProvider->getSort();
        $sort->attributes['c.status'] = [
            'asc' => ['c.status' => SORT_ASC],
            'desc' => ['c.status' => SORT_DESC],
            'label' => 'status',
        ];
        $sort->attributes['c.sex'] = [
            'asc' => ['c.sex' => SORT_ASC],
            'desc' => ['c.sex' => SORT_DESC],
            'label' => 'sex',
        ];
        $sort->attributes['c.updated_at'] = [
            'asc' => ['c.updated_at' => SORT_ASC],
            'desc' => ['c.updated_at' => SORT_DESC],
            'label' => 'c.updated_at',
        ];
        $sort->defaultOrder = ['c.updated_at' => SORT_DESC];
        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }
        $query->andFilterWhere(['c.id' => $this->id]);
        $query->andFilterWhere(['c.status' => $this->status]);
        $query->andFilterWhere(['c.sex' => $this->sex]);
        $query->andFilterWhere(['like', 'c.name', $this->name]);
        $query->andFilterWhere(['like', 'c.post', $this->post]);
        $query->andFilterWhere(['like', 'u.username', $this->username]);

        return $dataProvider;
    }

}