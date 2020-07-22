<?php
/**
 * Created by PhpStorm.
 * User: LHP
 * Date: 2020/6/3
 * Time: 10:59
 */
namespace qingrui\controllers;
use qingrui\models\Area;
use rbac\components\Helper;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii;
use yii\web\NotFoundHttpException;
use qingrui\models\Customer;
use qingrui\models\searchs\Customer as CustomerSearch;
class CustomerController extends Controller
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
        $searchModel = new CustomerSearch;
        if(Yii::$app->user->identity->id==Yii::$app->params['SUPER_ADMIN']){
            $where=[];
        }else{
            $where=['admin_id'=>Yii::$app->user->identity->id];
        }
        $dataProvider = $searchModel->search(Yii::$app->request->getQueryParams(),$where);

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
        $model = new Customer;
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
            $model = new Customer;
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
        if (($model = Customer::findOne($id)) !== null) {
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

    /*
     * 二级联动城市
     * @author：lhp
     * @time：2020/6/11
     * */
    public function actionCity()
    {
        $pid = (int)Yii::$app->request->post('pid');
        $model  = new Area();
        Yii::$app->response->format = yii\web\Response::FORMAT_JSON;
        $list= $model->getCityList($pid);
        return $list;
    }


}