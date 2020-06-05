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
            [['name'], 'required'],
            [['post'], 'default'],
            [['status','sex','created_at','updated_at','contact'], 'integer'],
            ['contact','match','pattern'=>'/^[1][34578][0-9]{9}$/'],
            ['email','match','pattern'=>'/^[A-Za-z0-9]+([_\.][A-Za-z0-9]+)*@([A-Za-z0-9\-]+\.)+[A-Za-z]{2,6}$/'],
            [['uid','username'],'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => '客户姓名',
            'contact' => '联系方式',
            'sex'=>'性别',
            'email' => '邮箱',
            'post' => '职位',
            'status' => '状态',
            'uid' => '用户id',
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
                $this->uid=Yii::$app->user->identity->id;
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
        return $this->hasOne($model::className(), ['id' => 'uid']);
    }
}