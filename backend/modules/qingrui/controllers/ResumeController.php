<?php
/**
 * Created by PhpStorm.
 * User: LHP
 * Date: 2020/6/4
 * Time: 10:59
 */
namespace qingrui\controllers;
use rbac\components\Helper;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii;
use yii\web\NotFoundHttpException;
use qingrui\models\Resume;
use qingrui\models\searchs\Resume as ResumeSearch;
class ResumeController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /*
     * 客户列表页
     * @author：lhp
     * @time：2020/6/3
     * */
    public function actionIndex()
    {
        $searchModel = new ResumeSearch;
        $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());

        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'searchModel' => $searchModel,
        ]);
    }

    /*
     * 客户视图
     * @author：lhp
     * @time：2020/6/3
     * */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }
    /*
     * 客户新增
     * @author：lhp
     * @time：2020/6/3
     * */
    public function actionCreate()
    {
        $model = new Resume;
        if(Yii::$app->request->post()){
            $post=Yii::$app->request->post();
            if ($model->load($post) && $model->save()) {
                Helper::invalidate();
                return $this->redirect(['view', 'id' => $model->id]);
            }
        }else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /*
      * 客户更新
      * @author：lhp
      * @time：2020/6/3
      * */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Helper::invalidate();
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /*
     * 客户删除一条
     * @author：lhp
     * @time：2020/6/3
     * */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        if($model->delete()){
            Helper::invalidate();
            return json_encode(['code'=>200,"msg"=>"删除成功"]);
        }else{
            $errors = $model->firstErrors;
            return json_encode(['code'=>400,"msg"=>reset($errors)]);
        }
    }
    /*
     * 导航批量删除
     * @author：lhp
     * @time：2020/3/23
     * */
    public function actionDeleteAll(){
        $data = Yii::$app->request->post();
        if($data){
            $model = new Resume;
            $count = $model->deleteAll(["in","id",$data['keys']]);
            if($count>0){
                Helper::invalidate();
                return json_encode(['code'=>200,"msg"=>"删除成功"]);
            }else{
                $errors = $model->firstErrors;
                return json_encode(['code'=>400,"msg"=>reset($errors)]);
            }
        }else{
            return json_encode(['code'=>400,"msg"=>"请选择数据"]);
        }
    }
    /*
     * 客户查询
     * @author：lhp
     * @time：2020/6/3
     * */
    protected function findModel($id)
    {
        if (($model = Resume::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('请求的页面不存在!');
        }
    }

    /*
     * 客户状态
     * @author：lhp
     * @time：2020/6/3
     * */
    public function actionStatus($id)
    {
        $model = $this->findModel($id);
        if($post= Yii::$app->request->post()){
            $model->status=$post['status'];
            if($model->save()){
                $arr=[
                    'code'=>200,
                    'msg'=>'操作成功'
                ];
                return json_encode($arr);
            }else{
                $arr=[
                    'code'=>-1,
                    'msg'=>'操作失败'
                ];
                return json_encode($arr);
            }
        } else {
            $arr=[
                'code'=>-1,
                'msg'=>'操作失败'
            ];
            return json_encode($arr);
        }
    }

    public function actionUpload(){
        $url = "http://api.xiaoxizn.com/v1/parser/parse_base";
        $file_path= 'E:/20200309_1583742767050.doc'; //替换为您的简历
        $file = base64_encode(file_get_contents($file_path));
        $post_data = array(
            "resume_base" => $file,
            "file_name" => $file_path
        );
        $post_data_string = json_encode($post_data);print_r(file_get_contents($file_path));die;
        $header_data = array(
            'Content-Type: application/json',
            'id: your_client_id', //替换为您的ID
            'secret: your_client_secret' //替换为您的密匙
        );
        $ch = curl_init();
        curl_setopt($ch , CURLOPT_URL , $url);
        curl_setopt($ch , CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch , CURLOPT_POST, 1);
        curl_setopt($ch , CURLOPT_POSTFIELDS, $post_data_string);
        curl_setopt($ch , CURLOPT_HTTPHEADER, $header_data);
        $output = curl_exec($ch);
        curl_close($ch);
        print_r($output);
    }
}