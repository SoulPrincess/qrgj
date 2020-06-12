<?php
use yii\widgets\DetailView;
use backend\assets\LayuiAsset;

LayuiAsset::register($this);
?>
<div class="customer-view">
    <?=DetailView::widget([
        'model' => $model,
		'options' => ['class' => 'layui-table'],
        'attributes' => [
            'admin.username:text:操作用户',
            'company_name',
            [
                'attribute'=>'province',
                'label' => '企业地址',
                'value'=>function($model){
                    if($model->province->cityname==$model->city->cityname){
                        $str=$model->province->cityname;
                    }else{
                        $str=$model->province->cityname.'-'.$model->city->cityname;
                    }
                    return $str;
                }
            ],
            'contract_end',
            'contract_deadline',
            'name',
            'contact',
            'email',
            'post',
            [
                'attribute' => 'sex',
                'format' => 'html',
                'value' => function($model) {
                    return $model->sex==2?'<font color="red">女</font>':($model->sex==3?'<font color="gray">未知</font>':'<font color="green">男</font>');
                },
                'contentOptions' => ['style'=> 'text-align: center;','id'=>'status_1'],
                'headerOptions' => [
                    'width' => '10%',
                    'style'=> 'text-align: center;'
                ],
                'label' => '性别',
            ],
//            [
//                'attribute' => 'status',
//                'format' => 'html',
//                'value' => function($model) {
//                    return $model->status==2?'<font color="red">待审核</font>':'<font color="green">已审核</font>';
//                },
//                'contentOptions' => ['style'=> 'text-align: center;','id'=>'status_1'],
//                'headerOptions' => [
//                    'width' => '10%',
//                    'style'=> 'text-align: center;'
//                ],
//                'label' => '状态',
//            ],
            ['label'=>'创建时间','value'=>date('Y-m-d H:i:s',$model->created_at)],
            ['label'=>'修改时间','value'=>date('Y-m-d H:i:s',$model->updated_at)],
        ],
		'template' => '<tr><th width="20%">{label}</th><td>{value}</td></tr>',
    ])
    ?>
</div>
