<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use qingrui\models\Area;

$this->registerJs($this->render('js/upload.js'));
?>
<style>
    .form-group{
        margin-top: 10px
    }
</style>
<div class="customer-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => ['class' => 'form-inline layui-form'],
		'fieldConfig' => [
		   'template' => '<div class="layui-inline">{label}：<div class="layui-input-inline">{input}</div></div><span class="help-block" style="display: inline-block;">{hint}</span>',
	   ],
    ]); ?>
    <?= $form->field($model, 'company_name')->textInput(['class'=>'layui-input search_input'])->label('企业名称') ?>

    <?= $form->field($model, 'province_id')->DropDownList(Area::getCityList(0),
        ['prompt'=>'选择省份','onchange'=>'$.post("'.yii::$app->urlManager->createUrl('qingrui/customer/city').'",{pid:$(this).val()},function(data){var str="";$.each(data,function(k,v){str+="<option value="+k+">"+v+"</option>";});$("select#customer-city_id").html(str);})','style'=>'display:none'])->label('地址'); ?>

    <?= $form->field($model, 'city_id')->dropDownList(Area::getCityList($model->province_id),['prompt'=>'选择市区','style'=>'display:none'])->label('') ?>

    <?= $form->field($model, 'name')->textInput(['class'=>'layui-input search_input'])->label('联系人') ?>
    <?= $form->field($model, 'post')->textInput(['class'=>'layui-input search_input'])->label('职位名称') ?>
    <?= $form->field($model, 'username')->textInput(['class'=>'layui-input search_input'])->label('操作用户') ?>

<!--    --><?//= $form->field($model, 'status')->dropDownList(['1'=>'已审核','2'=>'待审核'],['prompt'=>'请选择类别','style'=>'display:none;'])->label('状态') ?>

    <?= $form->field($model, 'sex')->dropDownList(['1'=>'男','2'=>'女','3'=>'未知'],['prompt'=>'请选择性别','style'=>'display:none'])->label('性别') ?>

    <div class="form-group" style="display:block;">
        <?= Html::submitButton('查找', ['class' => 'layui-btn layui-btn-normal']) ?>
        <?= Html::button('添加', ['class' => 'layui-btn layui-default-add']) ?>
		<?= Html::button('批量删除', ['class' => 'layui-btn layui-btn-danger layui-default-delete-all']) ?>
<!--        --><?//= Html::button("<i class='layui-icon'>&#xe67c;</i>批量导入", ['class' => 'layui-btn layui-btn-normal layui-default-import','id'=>'goods_import']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
