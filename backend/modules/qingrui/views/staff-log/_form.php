<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use qingrui\models\Customer;
$this->registerJs($this->render('js/upload.js'));
?>

<div class="staff-log-form create_box">
    <?php $form = ActiveForm::begin(); ?>

<!--	--><?//= $form->field($model, 'customer_id')->dropDownList(Customer::dropDown(),['prompt'=>'请选择客户'])->label('选择客户') ?>
<!---->
<!--    --><?//= $form->field($model, 'status')->dropDownList(['1'=>'有意向','2'=>'无意向','3'=>'考虑中'],['prompt'=>'跟进状态'])->label('进度状态') ?>

<!--    --><?//= $form->field($model, 'remark')->textInput(['maxlength' => true,'class'=>'layui-input']) ?>

        <?= $form->field($model, 'total')->textInput(['maxlength' => true,'class'=>'layui-input']) ?>

    <?= $form->field($model, 'pass')->textInput(['maxlength' => true,'class'=>'layui-input']) ?>

    <?= $form->field($model, 'no_pass')->textInput(['maxlength' => true,'class'=>'layui-input']) ?>

    <?= $form->field($model, 'content')->textarea(['rows'=>5,'placeholder' => '请填写沟通详情及下一步跟进计划！'
]); ?>
    <?= $form->field($model, 'remark')->textarea(['rows'=>5]); ?>


    <div align='right' style="margin-top:10px;">
        <?=
        Html::submitButton($model->isNewRecord ? '新增' : '更新', ['class' => $model->isNewRecord? 'layui-btn' : 'layui-btn layui-btn-normal'])
        ?>
    </div>
    <?php ActiveForm::end(); ?>
</div>
