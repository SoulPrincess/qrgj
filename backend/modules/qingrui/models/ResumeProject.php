<?php
/**
 * Created by PhpStorm.
 * User: LHP
 * Date: 2020/6/17
 * Time: 14:42
 */

namespace qingrui\models;
use yii;
use yii\behaviors\TimestampBehavior;
class ResumeProject extends \yii\db\ActiveRecord
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
                [['resume_id','project_name','start_time','end_time','post_name','project_describe'], 'default']
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
            'project_name' => '项目名称',
            'start_time'=>'开始时间',
            'end_time' => '结束时间',
            'post_name' => '职位名称',
            'project_describe' => '项目描述',
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
        ];
    }

    /**
     * 简历项目经历
     * @param  array $params
     * @return \yii\data\ActiveDataProvider
     */
    public function Resumeproject($where=[])
    {
        $project=ResumeProject::findAll(['resume_id'=>$where['id']]);
//        $dataProvider = new yii\data\ActiveDataProvider([
//            'query' => $project,
//        ]);
        return ['query' => $project];
    }
}