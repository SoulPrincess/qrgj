<?php
use yii\widgets\DetailView;
use backend\assets\LayuiAsset;

LayuiAsset::register($this);
?>
<div class="resume-view">
    <?=DetailView::widget([
        'model' => $model,
        'attributes' => [
            'name',
            [
                'attribute' => 'sex',
                'format' => 'html',
                'value' => function($model) {
                    return $model->sex==2?'<font color="red">女</font>':($model->sex==3?'<font color="gray">未知</font>':'<font color="green">男</font>');
                },
                'contentOptions' => ['style'=> 'text-align: center;','id'=>'status_1'],
                'headerOptions' => [
                    'style'=> 'text-align: center;'
                ],
                'label' => '性别',
            ],
            'telphone',
            'wechat_id',
            'email',
            'current_city',
            'current_company',
            'current_branch',
            'current_post',
            'exchange',
            'admin.username:text:操作用户',
            ['label'=>'创建时间','value'=>date('Y-m-d H:i:s',$model->created_at)],
            ['label'=>'修改时间','value'=>date('Y-m-d H:i:s',$model->updated_at)],
        ],
        'template' => '<tr><th width="15%">{label}</th><td>{value}</td></tr>',
        'options' => ['class' => 'table table-striped table-bordered detail-view'],
    ])
    ?>
</div>
