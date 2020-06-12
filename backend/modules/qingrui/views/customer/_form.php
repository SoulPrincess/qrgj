<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use official\models\GuanType;
use kucha\ueditor\UEditor;
use qingrui\models\Area;
$this->registerJs($this->render('js/upload.js'));
?>

<div class="customer-form create_box">
    <?php $form = ActiveForm::begin(); ?>
    <?= $form->field($model, 'company_name')->textInput(['maxlength' => true,'class'=>'layui-input']) ?>

    <?= $form->field($model, 'province_id')->DropDownList(Area::getCityList(0),
        ['prompt'=>'--请选择省--','onchange'=>'$.post("'.yii::$app->urlManager->createUrl('qingrui/customer/city').'",{pid:$(this).val()},function(data){var str="";$.each(data,function(k,v){str+="<option value="+k+">"+v+"</option>";});$("select#customer-city_id").html(str);})']); ?>

    <?= $form->field($model, 'city_id')->dropDownList(Area::getCityList($model->province_id),['prompt'=>'--请选择市--'])->label('市区') ?>

    <?= $form->field($model, 'contract_end')->widget(\kartik\date\DatePicker::classname(), [
        'options' => ['placeholder' => ''],
        'removeButton' => false,
        'pluginOptions' => [
            'autoclose'=>true,
            'todayHighlight' => true,
            'format' => 'yyyy-mm-dd',
        ]]);?>

    <?= $form->field($model, 'contract_deadline')->textInput(['maxlength' => true,'class'=>'layui-input']) ?>
	<?= $form->field($model, 'name')->textInput(['maxlength' => true,'class'=>'layui-input']) ?>
    <?= $form->field($model, 'sex')->dropDownList(['1'=>'男','2'=>'女','3'=>'未知'],['prompt'=>'请选择性别'])->label('性别') ?>
    <?= $form->field($model, 'contact')->textInput(['class'=>'layui-input']) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true,'class'=>'layui-input']) ?>

    <?= $form->field($model, 'post')->textInput(['maxlength' => true,'class'=>'layui-input']) ?>



<!--    --><?//= $form->field($model, 'status')->dropDownList(['1'=>'是','2'=>'否'],['prompt'=>'请选择类别'])->label('状态') ?>


    <div align='right' style="margin-top:10px;">
        <?=
        Html::submitButton($model->isNewRecord ? '新增' : '更新', ['class' => $model->isNewRecord? 'layui-btn' : 'layui-btn layui-btn-normal'])
        ?>
    </div>
    <?php ActiveForm::end(); ?>
</div>
