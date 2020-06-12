<?php
/**
 * Created by PhpStorm.
 * User: LHP
 * Date: 2020/6/11
 * Time: 09:45
 */
namespace qingrui\controllers;
use rbac\components\Helper;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii;
use yii\web\NotFoundHttpException;
use qingrui\models\StaffLog;
use qingrui\models\searchs\StaffLog as StaffLogSearch;
use yii\helpers\Json;
class StaffLogController extends Controller
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
     * 员工日志列表页
     * @author：lhp
     * @time：2020/6/3
     * */
    public function actionIndex()
    {
        $searchModel = new StaffLogSearch;
        $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams());
        if (Yii::$app->request->post('hasEditable')) {
            $id = Yii::$app->request->post('editableKey');
            $model = StaffLog::findOne(['id' => $id]);
            $out = Json::encode(['output'=>'', 'message'=>'']);
            $posted = current($_POST['StaffLog']);
            $post = ['StaffLog' => $posted];
            if ($model->load($post)) {
                $model->save();
                $output = '';
                isset($posted['remark']) && $output = $model->remark;
            }
            $out = Json::encode(['output'=>$output, 'message'=>'']);
            echo $out;
            return;
        }
        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'searchModel' => $searchModel,
        ]);
    }

    /*
     * 员工日志视图
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
     * 员工日志新增
     * @author：lhp
     * @time：2020/6/3
     * */
    public function actionCreate()
    {
        $model = new StaffLog;
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
      * 员工日志更新
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
     * 员工日志删除一条
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
            $model = new StaffLog;
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
     * 员工日志查询
     * @author：lhp
     * @time：2020/6/3
     * */
    protected function findModel($id)
    {
        if (($model = StaffLog::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('请求的页面不存在!');
        }
    }

    /*
     * 员工日志状态
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


}