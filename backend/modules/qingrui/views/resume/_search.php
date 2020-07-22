<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

$this->registerJs($this->render('js/upload.js'));
?>
<style>
    .form-group{
        margin-top:10px;
    }
    .layui-input{
        autocomplete:off
    }
</style>
<div class="resume-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => ['class' => 'form-inline layui-form'],
		'fieldConfig' => [
		   'template' => '<div class="layui-inline">{label}：<div class="layui-input-inline">{input}</div></div><span class="help-block" style="display: inline-block;">{hint}</span>',
	   ],
    ]); ?>

    <?= $form->field($model, 'name')->textInput(['class'=>'layui-input search_input','autocomplete'=>'off'])->label('姓名') ?>
    <?= $form->field($model, 'telphone')->textInput(['class'=>'layui-input search_input','autocomplete'=>'off'])->label('联系方式') ?>
    <?= $form->field($model, 'sex')->dropDownList(['1'=>'男','2'=>'女','3'=>'未知'],['prompt'=>'请选择性别','style'=>'display:none'])->label('性别') ?>
    <?= $form->field($model, 'current_city')->textInput(['class'=>'layui-input search_input','autocomplete'=>'off'])->label('目前所在城市') ?>
    <?= $form->field($model, 'current_company')->textInput(['class'=>'layui-input search_input','autocomplete'=>'off'])->label('目前所在公司') ?>
    <?= $form->field($model, 'current_branch')->textInput(['class'=>'layui-input search_input','autocomplete'=>'off'])->label('目前所在部门') ?>
    <?= $form->field($model, 'current_post')->textInput(['class'=>'layui-input search_input','autocomplete'=>'off'])->label('职位名称') ?>
    <?= $form->field($model, 'username')->textInput(['class'=>'layui-input search_input','autocomplete'=>'off'])->label('操作用户') ?>
    <div class="form-group" style="display:block;">
        <?= Html::submitButton('查找', ['class' => 'layui-btn layui-btn-normal']) ?>
        <?= Html::button('添加', ['class' => 'layui-btn layui-default-add']) ?>
		<?= Html::button('批量删除', ['class' => 'layui-btn layui-btn-danger layui-default-delete-all']) ?>
        <?= Html::button("<i class='layui-icon'>&#xe67c;</i>批量导入", ['class' => 'layui-btn layui-btn-normal layui-default-import','id'=>'goods_import']) ?>
        <?=
        Html::a('下载导入模板','http://www.qrgj.com/uploads/default_template.xls', ['class' => "layui-btn layui-btn-normal layui-btn-xs"]);
        ?>

    </div>

    <?php ActiveForm::end(); ?>

</div>
