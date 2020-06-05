<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

$this->registerJs($this->render('js/upload.js'));
?>

<div class="customer-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => ['class' => 'form-inline layui-form'],
		'fieldConfig' => [
		   'template' => '<div class="layui-inline">{label}：<div class="layui-input-inline">{input}</div></div><span class="help-block" style="display: inline-block;">{hint}</span>',
	   ],
    ]); ?>

    <?= $form->field($model, 'name')->textInput(['class'=>'layui-input search_input'])->label('客户名称') ?>
    <?= $form->field($model, 'post')->textInput(['class'=>'layui-input search_input'])->label('职位') ?>
    <?= $form->field($model, 'username')->textInput(['class'=>'layui-input search_input'])->label('操作用户') ?>

    <?= $form->field($model, 'status')->dropDownList(['1'=>'是','2'=>'否'],['prompt'=>'请选择类别','style'=>'display:none;'])->label('是否显示') ?>

    <?= $form->field($model, 'sex')->dropDownList(['1'=>'男','2'=>'女','3'=>'未知'],['prompt'=>'请选择性别','style'=>'display:none'])->label('性别') ?>

    <div class="form-group" style="margin-top: 10px">
        <?= Html::submitButton('查找', ['class' => 'layui-btn layui-btn-normal']) ?>
        <?= Html::button('添加', ['class' => 'layui-btn layui-default-add']) ?>
		<?= Html::button('批量删除', ['class' => 'layui-btn layui-btn-danger layui-default-delete-all']) ?>
        <?= Html::button("<i class='layui-icon'>&#xe67c;</i>批量导入", ['class' => 'layui-btn layui-btn-normal layui-default-import','id'=>'goods_import']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
