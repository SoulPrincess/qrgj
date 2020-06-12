<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

$this->registerJs($this->render('js/upload.js'));
?>
<style>
    .form-group{
        margin-top:10px;
    }
</style>
<div class="staff-log-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => ['class' => 'form-inline layui-form'],
		'fieldConfig' => [
		   'template' => '<div class="layui-inline">{label}：<div class="layui-input-inline">{input}</div></div><span class="help-block" style="display: inline-block;">{hint}</span>',
	   ],
    ]); ?>

    <?= $form->field($model, 'keyword')->textInput(['class'=>'layui-input search_input','placeholder' =>'公司名称/联系人' ])->label('搜索关键字') ?>
    <?= $form->field($model, 'username')->textInput(['class'=>'layui-input search_input'])->label('操作用户') ?>
    <?= $form->field($model, 'created_at')->widget(\kartik\date\DatePicker::classname(), [
//    'options' => ['value' => date('Y-m-d',time())],
        'options' => ['placeholder' => date('Y-m-d',time())],
//注意，该方法更新的时候你需要指定value值
//    'value' => $model->created_at,
        'removeButton' => false,
        'pluginOptions' => [
            'autoclose'=>true,
            'todayHighlight' => true,
            'format' => 'yyyy-mm-dd',
        ]]);?>
<!--    --><?//= $form->field($model, 'status')->dropDownList(['1'=>'是','2'=>'否'],['prompt'=>'请选择类别','style'=>'display:none;'])->label('状态') ?>

    <div class="form-group" style="display:block;">
        <?= Html::submitButton('查找', ['class' => 'layui-btn layui-btn-normal']) ?>
        <?= Html::button('添加', ['class' => 'layui-btn layui-default-add']) ?>
		<?= Html::button('批量删除', ['class' => 'layui-btn layui-btn-danger layui-default-delete-all']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
