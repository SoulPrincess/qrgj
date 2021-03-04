<?php
use yii\widgets\DetailView;
use backend\assets\LayuiAsset;

LayuiAsset::register($this);
?>
<div class="staff-log-view">
    <?=DetailView::widget([
        'model' => $model,
		'options' => ['class' => 'layui-table'],
        'attributes' => [
            'admin.username:text:操作用户',
            'total',
            'pass',
            'no_pass',
            [
                'format' => 'html',
                'value'=>function($model){
                   $pass= ($model->pass/$model->total*100).'%';
                    return "<font style='color:green'>$pass</font>";
                },
                'label'=>'通过率'
            ], [
                'format' => 'html',
                'value'=>function($model){
                    $no_pass= ($model->no_pass/$model->total*100).'%';
                    return "<font style='color:red'>$no_pass</font>";
                },
                'label'=>'未通过率'
            ],
//            'customer.company_name:text:企业名称',
//            'customer.name:text:联系人',
//            'customer.contact:text:联系方式',
//            [
//                'attribute' => 'status',
//                'format' => 'html',
//                'value' => function($model) {
//                    if($model->status==1){
//                        return '<font color="green">有意向</font>';
//                    }elseif($model->status==2){
//                        return '<font color="gray">无意向</font>';
//                    }elseif($model->status==3){
//                        return '<font color="red">考虑中</font>';
//                    }else{
//                        return '-';
//                    }
//                },
//                'contentOptions' => ['style'=> 'text-align: center;','id'=>'status_1'],
//                'headerOptions' => [
//                    'width' => '10%',
//                    'style'=> 'text-align: center;'
//                ],
//            ],
            ['attribute' => 'content'],
            ['attribute' => 'remark'],
            ['label'=>'创建时间','value'=>date('Y-m-d H:i:s',$model->created_at)],
            ['label'=>'修改时间','value'=>date('Y-m-d H:i:s',$model->updated_at)],
        ],
		'template' => '<tr><th width="100px">{label}</th><td>{value}</td></tr>', 
    ])
    ?>
</div>
