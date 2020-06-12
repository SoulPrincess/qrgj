<?php
/**
 * Created by PhpStorm.
 * User: LHP
 * Date: 2020/6/11
 * Time: 09:45
 */
namespace qingrui\models\searchs;
use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use qingrui\models\StaffLog as StaffLogModel;
class StaffLog extends StaffLogModel
{
    public $keyword;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name','created_at','status','username','keyword'], 'safe'],
        ];
    }
    /**
     * Searching Customer
     * @param  array $params
     * @return \yii\data\ActiveDataProvider
     */
    public function search($params)
    {
        $query = StaffLogModel::find()
            ->from(StaffLogModel::tableName() . ' s')
            ->leftJoin(['u'=>'t_admin'],'u.id=s.admin_id')
            ->leftJoin(['c'=>'t_customer'],'c.id=s.customer_id');

        $dataProvider = new ActiveDataProvider([
            'query' => $query
        ]);

        $sort = $dataProvider->getSort();
        $sort->attributes['s.status'] = [
            'asc' => ['s.status' => SORT_ASC],
            'desc' => ['s.status' => SORT_DESC],
            'label' => 'status',
        ];
        $sort->attributes['s.created_at'] = [
            'asc' => ['s.created_at' => SORT_ASC],
            'desc' => ['s.created_at' => SORT_DESC],
            'label' => 'created_at',
        ];
        $sort->defaultOrder = ['s.created_at' => SORT_DESC];

        if(empty($params)){
            $params['StaffLog']['created_at']=date('Y-m-d',time());
        }
        if (!($this->load($params) && $this->validate())) {
            return $dataProvider;
        }
        $begin_time=strtotime($this->created_at);
        $end_time=strtotime($this->created_at)+ 24 * 60 * 60  - 1;
        $query->andFilterWhere(['s.id' => $this->id]);
        $query->andFilterWhere(['s.status' => $this->status]);
        $query->andFilterWhere(['or',
            ['like', 'c.name', $this->keyword],
            ['like', 'c.company_name', $this->keyword]]);
        $query->andFilterWhere(['between','s.created_at',$begin_time, $end_time]);
        $query->andFilterWhere(['like', 'u.username', $this->username]);

        return $dataProvider;
    }

}