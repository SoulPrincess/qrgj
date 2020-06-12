<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use backend\assets\LayuiAsset;
use yii\helpers\Url;
LayuiAsset::register($this);
$this->registerJs($this->render('js/index.js'));
?>
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
            ['class' => 'yii\grid\SerialColumn'],//显示行号
            'admin.username:text:操作用户',
            'customer.company_name:text:企业名称',
            'customer.name:text:联系人',
            'customer.contact:text:联系方式',
            [
                'attribute' => 'remark',
                'class'=>'kartik\grid\EditableColumn',
                'editableOptions'=>[
                    'asPopover' => true,
                ],
            ],
//            [
//                'attribute' => 'status',
//                'format' => 'html',
//                'value' => function($model) {
//                    return $model->status==2?'<font color="red">否</font>':'<font color="green">是</font>';
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
                    'status' => function ($url, $model, $key) {
                        return Html::a('操作', Url::to(['status','id'=>$model->id]), ['class' => "layui-btn layui-btn-warm layui-btn-xs layui-default-status"]);
                    },
					'delete' => function ($url, $model, $key) {
						return Html::a('删除', Url::to(['delete','id'=>$model->id]), ['class' => "layui-btn layui-btn-danger layui-btn-xs layui-default-delete"]);
					}
				]
			],
        ],
    ]);
    ?>

</div>
