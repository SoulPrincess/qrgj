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
use yii\db\Query;
use qingrui\models\Customer as CustomerModel;
class Customer extends CustomerModel
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type','name','post','sex','status','username','province_id','city_id','company_name'], 'safe'],
        ];
    }
    /**
     * Searching Customer
     * @param  array $params
     * @return \yii\data\ActiveDataProvider
     */
    public function search($params,$where=[])
    {
        $query = CustomerModel::find()
            //->select(['u.username','c.*'])
            ->from(CustomerModel::tableName() . ' c')
            ->leftJoin(['u'=>'t_admin'],'u.id=c.admin_id');

        $dataProvider = new ActiveDataProvider([
            'query' => $query
        ]);
        if($where){
            $query->andFilterWhere($where);
        }
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
        if(Yii::$app->user->identity->id!=Yii::$app->params['SUPER_ADMIN']){
            $query->andFilterWhere(['s.admin_id'=>Yii::$app->user->identity->id]);
        }
        $query->andFilterWhere(['c.id' => $this->id]);
        $query->andFilterWhere(['c.status' => $this->status]);
        $query->andFilterWhere(['c.sex' => $this->sex]);
        $query->andFilterWhere(['c.type' => $this->type]);
        $query->andFilterWhere(['c.province_id' => $this->province_id]);
        $query->andFilterWhere(['c.city_id' => $this->city_id]);
        $query->andFilterWhere(['like', 'c.company_name', $this->company_name]);
        $query->andFilterWhere(['like', 'c.name', $this->name]);
        $query->andFilterWhere(['like', 'c.post', $this->post]);
        $query->andFilterWhere(['like', 'u.username', $this->username]);

        return $dataProvider;
    }
    /*
       * 导出查询数据
       * @time:2020-10-12
       * @author:lhp
       * */
    public function exportsearch($params)
    {

        $query=new Query();
            $query->select(['a.cityname province_name','a1.cityname city_name','c.*','u.username'])
            ->from(CustomerModel::tableName() . ' c')
            ->leftJoin(['u'=>'t_admin'],'u.id=c.admin_id')
            ->leftJoin(['a'=>'t_area'],'a.id=c.province_id')
            ->leftJoin(['a1'=>'t_area'],'a1.id=c.city_id');
        if(Yii::$app->user->identity->id!=Yii::$app->params['SUPER_ADMIN']){
            $query->andFilterWhere(['s.admin_id'=>Yii::$app->user->identity->id]);
        }
        if($params['type']==2){
            if (!empty($params['company_sex'])) {
                $query->andFilterWhere(['c.sex' => $params['company_sex']]);
            }if (!empty($params['position'])) {
                $query->andFilterWhere(['c.post' => $params['position']]);
            }if (!empty($params['city_id'])) {
                $query->andFilterWhere(['c.city_id' => $params['city_id']]);
            }if (!empty($params['province_id'])) {
                $query->andFilterWhere(['c.province_id' => $params['province_id']]);
            }if (!empty($params['contacts'])) {
                $query->andFilterWhere(['c.contacts' => $params['contacts']]);
            }if (!empty($params['company_name'])) {
                $query->andFilterWhere(['like', 'c.name', $params['company_name']]);
            }if (!empty($params['username'])) {
                $query->andFilterWhere(['like', 'u.username', $params['username']]);
            }
        }
        $result = $query
            ->orderBy('c.created_at desc')
            ->all();
        return $result;
    }
}