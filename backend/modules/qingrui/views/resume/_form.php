<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use official\models\GuanType;
use kucha\ueditor\UEditor;
$this->registerJs($this->render('js/upload.js'));
?>

<div class="resume-form create_box">
    <?php $form = ActiveForm::begin(); ?>
	<?= $form->field($model, 'name')->textInput(['maxlength' => true,'class'=>'layui-input']) ?>
    <?= $form->field($model, 'sex')->dropDownList(['1'=>'男','2'=>'女','3'=>'未知'],['prompt'=>'请选择性别'])->label('性别') ?>
    <?= $form->field($model, 'telphone')->textInput(['class'=>'layui-input search_input'])->label('联系方式') ?>
    <?= $form->field($model, 'wechat_id')->textInput(['class'=>'layui-input search_input'])?>
    <?= $form->field($model, 'email')->textInput(['maxlength' => true,'class'=>'layui-input']) ?>
    <?= $form->field($model, 'current_city')->textInput(['class'=>'layui-input search_input'])->label('目前所在城市') ?>
    <?= $form->field($model, 'current_company')->textInput(['class'=>'layui-input search_input'])->label('目前所在公司') ?>
    <?= $form->field($model, 'current_branch')->textInput(['class'=>'layui-input search_input'])->label('目前所在部门') ?>
    <?= $form->field($model, 'current_post')->textInput(['class'=>'layui-input search_input'])->label('职位名称') ?>
    <?= $form->field($model, 'exchange')->textInput(['class'=>'layui-input search_input'])->label('沟通要点（经验、英文、薪酬地址）') ?>

    <div align='right' style="margin-top:10px;">
        <?=
        Html::submitButton($model->isNewRecord ? '新增' : '更新', ['class' => $model->isNewRecord? 'layui-btn' : 'layui-btn layui-btn-normal'])
        ?>
    </div>
    <?php ActiveForm::end(); ?>
</div>
