<?php
/**
 * Created by PhpStorm.
 * User: LHP
 * Date: 2020/6/4
 * Time: 10:59
 */
namespace qingrui\controllers;
use rbac\components\Helper;
use vendor\tools\OfficeTools;
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
     * 简历列表页
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
     * 简历视图
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
     * 简历新增
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
      * 简历更新
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
     * 简历删除一条
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
     * 简历查询
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
     * 简历状态
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
      * 简历excel导入
      * @author:LHP
      * @time:2020-6-8
      * */
    public function actionImport(){
        if (Yii::$app->request->isPost) {
            $file=$_FILES;
            $file_name = $file['file']['name'];
            $file_tmp_path =$file['file']['tmp_name'];
            $type = substr(strrchr($file_name, '.'), 1);
            $session = Yii::$app->session;
            require '../../vendor/phpoffice/phpexcel/Classes/PHPExcel.php';
            require '../../vendor/phpoffice/phpexcel/Classes/PHPExcel/IOFactory.php';
            ini_set('memory_limit', '2048M');
            set_time_limit(0);
            $error_row = [];//错误行
            $error_data = [];//错误数据
            $repeat_row = [];//重复行
            if (empty($file_name)) {
                $arr=[
                    'code'=>20003,
                    'msg'=>'请先上传文件',
                ];
                return json_encode($arr);
            }
            $objReader = new \PHPExcel_Reader_Excel5();
            $path_api="../../api/web/uploads/jianli/";

            if (!is_dir($path_api)){
                mkdir($path_api,0777,true);
            }
            $file_save_name = date("YmdHis",time()) . mt_rand(1000, 9999) . '.' . $type;
            move_uploaded_file($file_tmp_path, $path_api.'/'.$file_save_name);
            $url=$path_api.'/'.$file_save_name;

            $objPHPExcel = $objReader->load($url);
            $objWorksheet = $objPHPExcel->getSheet(0);
            //最大行数，为数字
            $highestRow = $objWorksheet->getHighestRow();
            //最大列数 为字母
            $highestColumn = $objWorksheet->getHighestColumn();
            //将字母变为数字
            $highestColumnIndex = \PHPExcel_Cell::columnIndexFromString($highestColumn);

            $tableData = [];
            for($row = 1;$row<=$highestRow;$row++){
                for($col=0;$col< $highestColumnIndex;$col++){
                    $tableData[$row][$col] = $objWorksheet->getCellByColumnAndRow($col,$row)->getValue();
                }
            }
            //将表头去除
            unset($tableData[1]);
            //释放内存
            $PHPExcel = NULL;
            $resume = new Resume();
            $repeat_data=$resume->resumeRepeat();
            foreach ($tableData as $k => &$v) {
                array_values($v);
                array_map('trim', $v);
                $error_flag = false;
                $repeat_flag = false;
                if (!empty($v[0])) {//姓名
                   if (in_array($v[0], $repeat_data['name'])) {
                        $repeat_flag = true;
                    }
                } else {
                    $arr=[
                        'code'=>20001,
                        'msg'=>'第' . ($k) . '行姓名为空',
                    ];
                    return json_encode($arr);
                }
                if (empty($v[1])) {
                    $arr=[
                        'code'=>20001,
                        'msg'=>'第' . ($k) . '行性别为空',
                    ];
                    return json_encode($arr);
                }else{
                    if($v[1]=='M'||$v[1]=='m'){
                        $v[1]=1;
                    }elseif ($v[1]=='F'||$v[1]=='f'){
                        $v[1]=2;
                    }else{
                        $v[1]=3;
                    }
                }
                if (empty($v[2])) {
                    $arr=[
                        'code'=>20001,
                        'msg'=>'第' . ($k) . '行手机号为空',
                    ];
                    return json_encode($arr);
                }elseif(!preg_match("/^1[3456789]{1}\d{9}$/", $v[2])){
                    $arr=[
                        'code'=>50023,
                        'msg'=>'第' . ($k) . '行手机号格式有误',
                    ];
                    return json_encode($arr);
                }
                if (empty($v[4])) {
                    $arr=[
                        'code'=>20001,
                        'msg'=>'第' . ($k) . '行邮箱为空',
                    ];
                    return json_encode($arr);
                }elseif(!preg_match("/^[a-zA-Z0-9]+([-_.][a-zA-Z0-9]+)*@([a-zA-Z0-9]+[-.])+([a-z]{2,5})$/ims", $v[4])){
                    $arr=[
                        'code'=>50023,
                        'msg'=>'第' . ($k) . '行邮箱格式有误',
                    ];
                    return json_encode($arr);
                }
                if ($error_flag) {//将错误行记录
                    unset($tableData[$k]);
                    if (!in_array(($k + 1), $error_row)) {
                        $error_row[] = $k + 1;
                    }
                    $error_data[] = $v;
                }
                if ($repeat_flag) {//将重复行记录
                    unset($tableData[$k]);
                    $repeat_data[] = $v;
                    if (!in_array(($k + 1), $repeat_row)) {
                        $repeat_row[] = $k + 1;
                    }
                }
                //进度条
                $session->set('rate', round(($k + 1) / ($highestRow - 1), 2));
                session_write_close();//释放锁
            }
            $tableData=array_values($tableData);

            //进度条置空
            $session->remove('rate');
            $error_count = count($error_row);
            $repeat_count = count($repeat_row);
            $success_count = count($tableData);
            //记录错误信息
            if (!empty($tableData)) {
                foreach ($tableData as $key => $value) {
                    $resume->resumeImport($value);
                }
            }
            $msg = '导入成功' . $success_count . '条<br/>';
            if ($error_count) {
                $msg .= '失败' . $error_count . '条<br/>';
            }
            if ($repeat_count) {
                $msg .= '重复' . $repeat_count . '条<br/>';
            }
            $arr=[
                'error_cnt'=>$error_count + $repeat_count,
                'code'=>200,
                'msg'=>$msg
            ];
            return json_encode($arr);
        }else{
            //下载表格
            $headerArr = ['姓名', '性别', '联系方式', '微信号', '邮箱', '目前所在城市', '目前所在公司', '目前所在部门', '职位名称', '沟通要点（经验、英文、薪酬地址）'];
            $fileName = 'excel导入模板';
//            OfficeTools::excel_export($headerArr, $fileName, []);
        }
    }

    /*
    * 查看简历视图
    * @author：lhp
    * @time：2020/6/9
    * */
    public function actionResumeView($id)
    {
        return $this->render('resume-view', [
            'model' => $this->findModel($id),
        ]);
    }
}