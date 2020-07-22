<?php
/**
 * Created by PhpStorm.
 * User: LHP
 * Date: 2020/6/17
 * Time: 10:42
 */

namespace qingrui\models;
use yii;
use yii\behaviors\TimestampBehavior;
use yii\data\ActiveDataProvider;
class ResumeWork extends \yii\db\ActiveRecord
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
//            [['work_name','job_name'], 'required'],
                [['resume_id','start_time','end_time','work_content','work_name','job_name'], 'default']
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
            'work_name' => '企业名称',
            'job_name'=>'职位名称',
            'start_time' => '开始时间',
            'end_time' => '结束时间',
            'work_content' => '工作内容',
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
        ];
    }
    /**
     * 简历工作经历
     * @param  array $params
     * @return \yii\data\ActiveDataProvider
     */
    public function Resumework($where=[])
    {
        $work=$this->findAll(['resume_id'=>$where['id']]);
        return ['query' =>$work];
    }
}