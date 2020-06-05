<?php
/**
 * Created by PhpStorm.
 * User: LHP
 * Date: 2020/6/4
 * Time: 11:42
 */

namespace qingrui\models;
use yii;
use yii\behaviors\TimestampBehavior;
class Resume extends \yii\db\ActiveRecord
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
            [['sex','age','native','politic','ethnic','major','school','education','idcard','birthday','marriage','post','telphone','email','address','resume_photo','expected_pay','worktime','major_backg','job_intention','work_experience','evaluation','other','created_at','updated_at','remark'], 'default'],
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
            'name' => '姓名',
            'sex' => '性别',
            'age'=>'年龄',
            'native' => '籍贯',
            'politic' => '政治面貌',
            'ethnic' => '民族',
            'major' => '专业',
            'school' => '学校',
            'education' => '学历',
            'idcard' => '身份证号',
            'birthday' => '出生日期',
            'marriage' => '婚姻状况',
            'post' => '职位',
            'telphone' => '联系电话',
            'email' => '邮箱',
            'address' => '地址',
            'resume_photo' => '简历图片',
            'expected_pay' => '期望薪资',
            'worktime' => '工作时间',
            'major_backg' => '专业背景',
            'job_intention' => '求职意向',
            'work_experience' => '工作经历',
            'evaluation' => '自我评价',
            'other' => '其他说明',
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
            'remark' => '备注',
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