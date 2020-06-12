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
            [['sex','age','native','politic','ethnic','major','school','education','idcard','birthday','marriage','post','telphone','email','address','resume_photo','expected_pay','worktime','major_backg','job_intention','work_experience','evaluation','other','created_at','updated_at','remark','current_city','current_company','current_branch','current_post','exchange','wechat_id'], 'default'],
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
            'telphone' => '联系方式',
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
            'current_city' => '目前所在城市',
            'current_company' => '目前所在公司',
            'current_branch' => '目前所在部门',
            'current_post' => '职位名称',
            'exchange' => '沟通结果',
            'wechat_id' => '微信号',
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

    /*简历导入查重
     *@author:LHP
    * @time:2020-6-8
    * */
    public function resumeRepeat()
    {
        $query = new yii\db\Query();
        $result = $query->select(['name','sex','address','telphone','school','education','post','email'])
            ->from(['t'=>'t_resume'])
            ->all();
        foreach ($result as $v) {//简历名称
            $result['name'][] = $v['name'];

            if ($v['id']) {
                $result[$v['name']] = $v['id'];
            }
        }
        return $result;
    }

    public function resumeImport($param = [])
    {
        $data=[
            'name'=>$param[0],
            'sex'=>$param[1],
            'telphone' => $param[2],
            'wechat_id' => $param[3],
            'email' => $param[4],
            'current_city' => $param[5],
            'current_company' => $param[6],
            'current_branch' => $param[7],
            'current_post' => $param[8],
            'exchange' => $param[9],
            'created_at' =>time(),
            'updated_at' =>time(),
            'uid'=>Yii::$app->user->identity->id
        ];
        $result=self::addResume($data);
        return $result;
    }

    /*简历导入数据库
   *$param array
   *@time:2020-6-8
   *@author:Lhp
   */
    public function addResume($param=[]){
        $connection=Yii::$app->db;
        $transaction=$connection->beginTransaction();
        try{
            $connection->createCommand()->insert('t_resume',$param)->execute();
            $transaction->commit();
            return true;
        }catch (\Exception $e){
            $transaction->rollBack();
            return false;
        }
    }

}