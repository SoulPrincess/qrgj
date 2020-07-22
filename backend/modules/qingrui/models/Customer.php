<?php
/**
 * Created by PhpStorm.
 * User: LHP
 * Date: 2020/6/3
 * Time: 11:05
 */
namespace qingrui\models;
use yii;
use yii\behaviors\TimestampBehavior;
class Customer extends \yii\db\ActiveRecord
{
    public $username;
    public $userClassName;

    /**
     * @inheritdoc
     */
    public function init()
    {
        parent::init();
        if ($this->userClassName === null) {
            $this->userClassName = Yii::$app->getUser()->identityClass;
            $this->userClassName = $this->userClassName ? : 'common\models\User';
        }
    }
    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::className(),
                'createdAtAttribute' => 'created_at',
                'updatedAtAttribute' => 'updated_at',
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name','company_name'], 'required'],
            [['post','contract_end','contract_deadline','province_id','city_id'], 'default'],
            [['status','sex','created_at','updated_at','contact'], 'integer'],
            ['contact','match','pattern'=>'/^[1][34578][0-9]{9}$/'],
            ['email','match','pattern'=>'/^[A-Za-z0-9]+([_\.][A-Za-z0-9]+)*@([A-Za-z0-9\-]+\.)+[A-Za-z]{2,6}$/'],
            [['admin_id','username','contact'],'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'company_name' => '企业名称',
            'province_id' => '省份',
            'city_id' => '城市',
            'contract_end' => '合同截止日期',
            'contract_deadline' => '合同期限',
            'name' => '联系人',
            'contact' => '联系方式',
            'sex'=>'性别',
            'email' => '邮箱',
            'post' => '职位',
            'status' => '状态',
            'admin_id' => '用户id',
            'username' => '用户名称',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
        ];
    }

    public function beforeSave($insert)
    {
        if(parent::beforeSave($insert))
        {
            if($this->isNewRecord)
            {
                $this->admin_id=Yii::$app->user->identity->id;
            }
            return true;
        }
        else
            return false;
    }
    /**
     * Get admin name
     * @return \yii\db\ActiveQuery
     */
    public function getAdmin()
    {
        $model = new $this->userClassName;
        return $this->hasOne($model::className(), ['id' => 'admin_id']);
    }
    /**
     * Get admin name
     * @return \yii\db\ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Area::className(), ['id' => 'province_id']);
    }
    /**
     * Get admin name
     * @return \yii\db\ActiveQuery
     */
    public function getCity()
    {
        return $this->hasOne(Area::className(), ['id' => 'city_id']);
    }
    /**
     * 获取对应人的客户
     * @time:2020-6-11
     * @author:lhp
     */
    public static function dropDown()
    {
        $data = self::find()
            ->select(['id','company_name'])
            ->where(['admin_id'=>Yii::$app->user->identity->id])
            ->orderBy('updated_at desc')
            ->asArray()
            ->all();
        $data_list = yii\helpers\ArrayHelper::map($data, 'id', 'company_name');
        return $data_list;
    }
}