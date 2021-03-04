<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use backend\assets\LayuiAsset;
use yii\helpers\Url;
LayuiAsset::register($this);
$this->registerJs($this->render('js/index.js'));
?>
<style>
    /*.grid-view td {*/
    /*     white-space: normal;*/
    /*}*/
</style>
<blockquote class="layui-elem-quote" style="font-size: 14px;">
    <?php  echo $this->render('_search', ['model' => $searchModel]); ?>
</blockquote>
<div class="layui-form staff-log-index">
    <?=
    GridView::widget([
        'dataProvider' => $dataProvider,
        'options' => ['class' => 'grid-view','style'=>'overflow:auto', 'id' => 'grid'],
        'tableOptions'=> ['class'=>'layui-table'],
        'pager' => [
            'options'=>['class'=>'layuipage pull-right'],
            'prevPageLabel' => '上一页',
            'nextPageLabel' => '下一页',
            'firstPageLabel'=>'首页',
            'lastPageLabel'=>'尾页',
            'maxButtonCount'=>5,
        ],
        'columns' => [
            [
                'class' => 'backend\widgets\CheckboxColumn',
                'checkboxOptions' => ['lay-skin'=>'primary','lay-filter'=>'choose'],
                'headerOptions' => ['width'=>'50','style'=> 'text-align: center;'],
                'contentOptions' => ['style'=> 'text-align: center;']
            ],
            'admin.username:text:操作用户',
            'total',
            'pass',
            'no_pass',
            [
                'format' => 'html',
                'value'=>function($model){
                    $pass= (round($model->pass/$model->total,2)*100).'%';
                    return "<font style='color:green'>$pass</font>";
                },
                'label'=>'通过率'
            ], [
                'format' => 'html',
                'value'=>function($model){
                    $no_pass= (round($model->no_pass/$model->total,2)*100).'%';
                    return "<font style='color:red'>$no_pass</font>";
                },
                'label'=>'未通过率'
            ],
            // 'customer.company_name:text:企业名称',
            // 'customer.name:text:联系人',
            // 'customer.contact:text:联系方式',

            // [
            //     'attribute' => 'status',
            //     'format' => 'html',
            //     'value' => function($model) {
            //         if($model->status==1){
            //             return '<font color="green">有意向</font>';
            //         }elseif($model->status==2){
            //             return '<font color="gray">无意向</font>';
            //         }elseif($model->status==3){
            //             return '<font color="red">考虑中</font>';
            //         }else{
            //             return '-';
            //         }
            //     },
            //     'contentOptions' => ['style'=> 'text-align: center;','id'=>'status_1'],
            //     'headerOptions' => [
            //         'width' => '10%',
            //         'style'=> 'text-align: center;'
            //     ],
            // ],
            [
                'attribute' => 'content',
                'label'=>'沟通详情',
                'contentOptions' => [
                    'width' => '40%',
                    'style'=>'white-space:normal'
                ],
            ],
            [
                'attribute' => 'remark',
//                'class'=>'kartik\grid\EditableColumn',
//                'editableOptions'=>[
//                    'asPopover' => true,
//                ],
                'contentOptions' => [
                    'width' => '10%',
                    'style'=>'white-space:normal'
                ],
            ],
            [
                'attribute'=>'created_at',
                'value'=>function ($model){
                    return date('Y-m-d H:i:s',$model->created_at);
                }
            ],
            [
                'attribute'=>'updated_at',
                'value'=>function ($model){
                    return date('Y-m-d H:i:s',$model->updated_at);
                }
            ],

            [
                'header' => '操作',
                'class' => 'yii\grid\ActionColumn',
                'contentOptions' => ['class'=>'text-center'],
                'headerOptions' => [
                    'width' => '10%',
                    'style'=> 'text-align: center;'
                ],
                'template' =>'{view} {update}{status} {delete}',
                'buttons' => [
                    'view' => function ($url, $model, $key){
                        return Html::a('查看', Url::to(['view','id'=>$model->id]), ['class' => "layui-btn layui-btn-xs layui-default-view"]);
                    },
                    'update' => function ($url, $model, $key) {
                        return Html::a('修改', Url::to(['update','id'=>$model->id]), ['class' => "layui-btn layui-btn-normal layui-btn-xs layui-default-update"]);
                    },
                    // 'status' => function ($url, $model, $key) {
                    //     return Html::a('操作', Url::to(['status','id'=>$model->id]), ['class' => "layui-btn layui-btn-warm layui-btn-xs layui-default-status"]);
                    // },
                    'delete' => function ($url, $model, $key) {
                        return Html::a('删除', Url::to(['delete','id'=>$model->id]), ['class' => "layui-btn layui-btn-danger layui-btn-xs layui-default-delete"]);
                    }
                ]
            ],
        ],
    ]);
    ?>

</div>
