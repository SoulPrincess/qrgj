<?php
/**
 * 城市
 * User: LHP
 * Date: 2020/6/11
 * Time: 13:45
 */
namespace qingrui\models;
use yii;
use yii\behaviors\TimestampBehavior;
class Area extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cityname'], 'required'],
            [['parentid'], 'default'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'cityname' => '城市名称',
            'parentid' => '父级id',
        ];
    }
    public static function getCityList($pid)
    {
        $model = Area::find()->where('parentid =:pid',[':pid'=>$pid])->all();
        $all=yii\helpers\ArrayHelper::map($model,'id','cityname');
        return $all;
    }
}