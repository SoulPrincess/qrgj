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
    /*
     * 企业导出
     *@time:2020-9-10
     *@author:lhp
    */
    public function actionExport(){
        $type=2;
        $fileName='客户信息';
        $objectPHPExcel = new \PHPExcel();
        $objectPHPExcel->setActiveSheetIndex(0);
        $params=Yii::$app->getRequest()->getQueryParams();
        $page_size = 20;
        $model = new CustomerSearch();
        $customermodel=new Customer();
        $dataProvider = $model->exportsearch($params);
        $count=count($dataProvider);
        if($count==0){
            $data_export=[
                'code'=>2,
                'msg'=>'暂无数据！',
                'count'=>$count,
                'src'=>''
            ];
            return json_encode($data_export);
        }
        $page_count = (int)($count/$page_size) +1;
        $current_page = 0;
        $n = 0;
        $objectPHPExcel->getActiveSheet()->getStyle('G')->getNumberFormat()
            ->setFormatCode(\PHPExcel_Style_NumberFormat::FORMAT_TEXT);//设置某一列为文本
        foreach ( $dataProvider as $value )
        {
            if ( $n % $page_size === 0 )
            {
                $current_page = $current_page +1;
                //报表头的输出
                $objectPHPExcel->getActiveSheet()->mergeCells('B1:M1');
                $objectPHPExcel->getActiveSheet()->setCellValue('B1',$fileName);
                $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('B2',$fileName);
                $objectPHPExcel->setActiveSheetIndex(0)->getStyle('B1')->getFont()->setSize(24);
                $objectPHPExcel->setActiveSheetIndex(0)->getStyle('B1')
                    ->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

                $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('B2','日期：'.date("Y年m月j日"));
                $objectPHPExcel->setActiveSheetIndex(0)->getStyle('M2')
                    ->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);

                //表格头的输出
                $objectPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(5);
                $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('B3','编号');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(6.5);
                $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('C3','企业名称');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(25);
                $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('D3','企业地址');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(22);                                      $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('E3','联系人');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(10);
                $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('F3','联系方式');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(15);
                $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('G3','固定电话');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(15);
                $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('H3','邮箱');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(15);
                $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('I3','职位');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(7);                                        $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('J3','性别');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth(10);                                       $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('K3','合同截至日期');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(22);                                       $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('L3','合同期限');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('L')->setWidth(22);                                       $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('M3','创建时间');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('M')->setWidth(22);                                       $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('N3','修改时间');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('N')->setWidth(22);                                       $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('O3','备注');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('O')->setWidth(22);                                       $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('P3','类别');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('P')->setWidth(15);  $objectPHPExcel->setActiveSheetIndex(0)->setCellValue('Q3','操作用户');
                $objectPHPExcel->getActiveSheet()->getColumnDimension('Q')->setWidth(15);

                //设置居中
                $objectPHPExcel->getActiveSheet()->getStyle('B3:Q3')
                    ->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

                //设置边框
                $objectPHPExcel->getActiveSheet()->getStyle('B3:Q3' )
                    ->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                $objectPHPExcel->getActiveSheet()->getStyle('B3:Q3' )
                    ->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                $objectPHPExcel->getActiveSheet()->getStyle('B3:Q3' )
                    ->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                $objectPHPExcel->getActiveSheet()->getStyle('B3:Q3' )
                    ->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                $objectPHPExcel->getActiveSheet()->getStyle('B3:Q3' )
                    ->getBorders()->getVertical()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);

                //设置颜色
                $objectPHPExcel->getActiveSheet()->getStyle('B3:Q3')->getFill()
                    ->setFillType(\PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setARGB('FF66CCCC');
            }
            //明细的输出
            $objectPHPExcel->getActiveSheet()->setCellValue('B'.($n+4) ,$value['id']);
            $objectPHPExcel->getActiveSheet()->setCellValue('C'.($n+4) ,$value['company_name']);
            $objectPHPExcel->getActiveSheet()->setCellValue('D'.($n+4) ,$value['city_name']!=''?($value['province_name'].'-'.$value['city_name']):$value['province_name']);
            $objectPHPExcel->getActiveSheet()->setCellValue('E'.($n+4) ,$value['name']);
            $objectPHPExcel->getActiveSheet()->setCellValue('F'.($n+4) ,$value['contact']);
            $objectPHPExcel->getActiveSheet()->setCellValue('G'.($n+4) ,$value['telephone']);
            $objectPHPExcel->getActiveSheet()->setCellValue('H'.($n+4) ,$value['email']);
            $objectPHPExcel->getActiveSheet()->setCellValue('I'.($n+4) ,$value['post']);
            $objectPHPExcel->getActiveSheet()->setCellValue('J'.($n+4) ,$value['sex']==1?'男':($value['sex']==2?'女':'未知'));
            $objectPHPExcel->getActiveSheet()->setCellValue('K'.($n+4) ,$value['contract_end']);
            $objectPHPExcel->getActiveSheet()->setCellValue('L'.($n+4) ,$value['contract_deadline']);
            $objectPHPExcel->getActiveSheet()->setCellValue('M'.($n+4) ,$customermodel->Time($value['created_at']));
            $objectPHPExcel->getActiveSheet()->setCellValue('N'.($n+4) ,$customermodel->Time($value['created_at']));
            $objectPHPExcel->getActiveSheet()->setCellValue('O'.($n+4) ,$value['remark']);
            $objectPHPExcel->getActiveSheet()->setCellValue('P'.($n+4) ,$value['type']==1?'企业客户':'个人客户');
            $objectPHPExcel->getActiveSheet()->setCellValue('Q'.($n+4) ,$value['username']);

            //设置边框
            $currentRowNum = $n+4;
            $objectPHPExcel->getActiveSheet()->getStyle('B'.($n+4).':Q'.$currentRowNum )
                ->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $objectPHPExcel->getActiveSheet()->getStyle('B'.($n+4).':Q'.$currentRowNum )
                ->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $objectPHPExcel->getActiveSheet()->getStyle('B'.($n+4).':Q'.$currentRowNum )
                ->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $objectPHPExcel->getActiveSheet()->getStyle('B'.($n+4).':Q'.$currentRowNum )
                ->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $objectPHPExcel->getActiveSheet()->getStyle('B'.($n+4).':Q'.$currentRowNum )
                ->getBorders()->getVertical()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $n = $n +1;

        }

        //设置分页显示
        $objectPHPExcel->getActiveSheet()->getPageSetup()->setHorizontalCentered(true);
        $objectPHPExcel->getActiveSheet()->getPageSetup()->setVerticalCentered(false);
        $objWriter = \PHPExcel_IOFactory::createWriter($objectPHPExcel, 'Excel2007');
        ob_end_clean();
        ob_start();
        if ($type == 1) {//浏览器下载
            header('pragma:public');
            header('Content-type:application/vnd.ms-excel;charset=utf-8;name="' . $fileName . '.xls"');
            header("Content-Disposition:attachment;filename=$fileName.xls");//attachment新窗口打印inline本窗口打印
            $objWriter->save('php://output');
            exit;
        } else {
//            $fileName=iconv("UTF-8", "GBK", $fileName);
            $f2 =  Yii::getAlias('@export');
            $f3 = $f2 . "/" . date('Ymd');
            if (!file_exists($f2)) {
                mkdir($f2, 0777);
            }
            if (!file_exists($f3)) {
                mkdir($f3, 0777);
            }
            $arr = explode("$f2", $f3 . '/' . $fileName . date('YmdHis_') . time() . '.xls');
            $src = $arr[1];
            $objWriter->save($f3 . '/' . $fileName. date('YmdHis_') . time() . '.xls');
            $data_export=[
                'code'=>1,
                'msg'=>'导出成功',
                'count'=>$count,
                'src'=>Yii::$app->params['dns_url'].'export/'.$src
            ];
            return json_encode($data_export);
        }
    }
    /*
       * excel导入
       * @author:LHP
       * @time:2020-10-10
       * */
    public function actionImport(){
        if (Yii::$app->request->isPost) {
            $file=$_FILES;
            $file_name = $file['file']['name'];
            $file_tmp_path =$file['file']['tmp_name'];
            $type = substr(strrchr($file_name, '.'), 1);
            $session = Yii::$app->session;
            require '../../../../vendor/phpoffice/phpexcel/Classes/PHPExcel.php';
            require '../../../../vendor/phpoffice/phpexcel/Classes/PHPExcel/IOFactory.php';
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
            $path_api="../../api/web/uploads/excel/";

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
            $customer = new customer();
            $repeat_data=$customer->customerRepeat();
            foreach ($tableData as $k => &$v) {
                array_values($v);
                array_map('trim', $v);
                $error_flag = false;
                $repeat_flag = false;
                if (!empty($v[0])) {//企业名称
                    if (in_array($v[0], $repeat_data['company_name'])) {
                        $repeat_flag = true;
                    }
                }
                if (empty($v[1])) {
                    $arr=[
                        'code'=>20001,
                        'msg'=>'第' . ($k + 1) . '商品简介为空',
                    ];
                    return json_encode($arr);
                }
                if (empty($v[2])) {
                    $arr=[
                        'code'=>20001,
                        'msg'=>'第' . ($k + 1) . '费用为空',
                    ];
                    return json_encode($arr);
                }elseif (!preg_match("/^[+-]?\d+(\.\d+)?$|^$|^(\d+|\-){7,}$/", $v[2])) {
                    $arr=[
                        'code'=>20002,
                        'msg'=>'第' . ($k + 1) . '费用只能为浮点数或整数',
                    ];
                    return json_encode($arr);
                }
                if (empty($v[3])) {
                    $arr=[
                        'code'=>20001,
                        'msg'=>'第' . ($k + 1) . 'Logo为空',
                    ];
                    return json_encode($arr);
                }
                if (empty($v[5])) {
                    $arr=[
                        'code'=>20001,
                        'msg'=>'第' . ($k + 1) . '状态为空',
                    ];
                    return json_encode($arr);
                }elseif(!in_array($v[5], ['显示','隐藏'])){
                    $arr=[
                        'code'=>20002,
                        'msg'=>'第' . ($k + 1) . '行状态有误（只能为显示|隐藏)',
                    ];
                    return json_encode($arr);
                }else{
                    $v[5]=($v[5]=='显示')?1:2;
                }
                $v[6] = time();
                $v[7] = time();
                if ($error_flag) {//将错误行记录
                    unset($tableData[$k]);
                    if (!in_array(($k + 2), $error_row)) {
                        $error_row[] = $k + 2;
                    }
                    $error_data[] = $v;
                }
                if ($repeat_flag) {//将重复行记录
                    unset($tableData[$k]);
                    $repeat_data[] = $v;
                    if (!in_array(($k + 2), $repeat_row)) {
                        $repeat_row[] = $k + 2;
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
                    $guan->goodsImport($value);
                }
            }
            $msg = '导入成功' . $success_count . '条';
            if ($error_count) {
                $msg .= ',失败' . $error_count . '条';
            }
            if ($repeat_count) {
                $msg .= ',重复' . $repeat_count . '条';
            }
            $arr=[
                'error_cnt'=>$error_count + $repeat_count,
                'code'=>200,
                'msg'=>$msg
            ];
            return json_encode($arr);
        }
    }
}