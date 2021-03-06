<?php

use yii\helpers\Html;
use yii\grid\GridView;
use backend\assets\LayuiAsset;
use yii\helpers\Url;
LayuiAsset::register($this);
$this->registerJs($this->render('js/index.js'));
?>
<blockquote class="layui-elem-quote" style="font-size: 14px;">
	<?php  echo $this->render('_search', ['model' => $searchModel]); ?>
</blockquote>
<div class="layui-form customer-index">
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
            [
                'attribute' => 'type',
                'format' => 'html',
                'value' => function($model) {
                    return $model->type==1?'<font color="green">企业客户</font>':($model->type==2?'<font color="gray">个人客户</font>':'<font color="#c55">(未设置)</font>');
                },
                'contentOptions' => ['style'=> 'text-align: center;','id'=>'status_1'],
                'headerOptions' => [
                    'width' => '10%',
                    'style'=> 'text-align: center;'
                ],
            ],
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
            'name',
            'contact',
            'telephone',
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
            'remark',
//            'contract_end',
//            'contract_deadline',
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
            [
                'attribute'=>'created_at',
                'label'=>'添加时间',
                'value'=>function ($model){
                    return date('Y-m-d H:i:s',$model->created_at);
                }
            ],
            [
                'attribute'=>'updated_at',
                'label'=>'修改时间',
                'value'=>function ($model){
                    return date('Y-m-d H:i:s',$model->updated_at);
                }
            ],
            'admin.username:text:操作用户',
            [
				'header' => '操作',
				'class' => 'yii\grid\ActionColumn',
				'contentOptions' => ['class'=>'text-center'],
				'headerOptions' => [
					'width' => '10%',
					'style'=> 'text-align: center;'
				],
				'template' =>'{view} {update}{delete}',
				'buttons' => [
                    'view' => function ($url, $model, $key){
						return Html::a('查看', Url::to(['view','id'=>$model->id]), ['class' => "layui-btn layui-btn-xs layui-default-view"]);
                    },
                    'update' => function ($url, $model, $key) {
						return Html::a('修改', Url::to(['update','id'=>$model->id]), ['class' => "layui-btn layui-btn-normal layui-btn-xs layui-default-update"]);
                    },
//                    'status' => function ($url, $model, $key) {
//                        return Html::a('操作', Url::to(['status','id'=>$model->id]), ['class' => "layui-btn layui-btn-warm layui-btn-xs layui-default-status"]);
//                    },
					'delete' => function ($url, $model, $key) {
						return Html::a('删除', Url::to(['delete','id'=>$model->id]), ['class' => "layui-btn layui-btn-danger layui-btn-xs layui-default-delete"]);
					}
				]
			],
        ],
    ]);
    ?>

</div>
