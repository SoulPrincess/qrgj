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
class ResumeSchool extends \yii\db\ActiveRecord
{
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
//            [['name'], 'required'],
                [['resume_id','school_name','start_time','end_time','education','major'], 'default']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'resume_id' => '简历id',
            'school_name' => '学校名称',
            'start_time'=>'开始时间',
            'end_time' => '结束时间',
            'education' => '学历',
            'major' => '专业',
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
        ];
    }
}