<?php
/**
 * Created by PhpStorm.
 * User: LHP
 * Date: 2020/6/11
 * Time: 09:45
 */
namespace qingrui\models;
use yii;
use yii\behaviors\TimestampBehavior;
class StaffLog extends \yii\db\ActiveRecord
{
    public $username;
    public $name;
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
//            [['customer_id'], 'required'],
            [['customer_id','status','remark','created_at','updated_at'], 'default'],
            [['admin_id','username','name'],'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'admin_id' => '操作者id',
            'customer_id' => '客户id',
            'username' => '操作者姓名',
            'name' => '客户姓名',
            'status' => '状态',
            'remark' => '工作内容',
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
     * Get Customer name
     * @return \yii\db\ActiveQuery
     */
    public function getCustomer()
    {
        return $this->hasOne(Customer::className(), ['id' => 'customer_id']);
    }
}