<?php
use yii\widgets\DetailView;
use backend\assets\LayuiAsset;

LayuiAsset::register($this);
?>
<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
$this->registerJs($this->render('js/upload.js'));
?>
<style>
    .layui-input{
        width:50%;
        display: inline-block
    }
    .control-label{
        width:100px;
        text-align:center
    }
    #resume-sex{
        width:50%;
        display: inline-block
    }
    #resume-current_city{
        width:50%;
        display: inline-block
    }
    #resume-birthday-kvdate{
        float:left;
        width:50%;
        margin-bottom: 15px;
        margin-top: -10px;
    }
    .field-resume-birthday .control-label{
        display:block;
        float:left;
    }
</style>
<div class="resume-form create_box">
    <?php $form = ActiveForm::begin(); ?>
    <blockquote class="layui-elem-quote"><i class="layui-icon layui-icon-user"></i>  个人信息</blockquote>
    <div class="layui-row">
        <div class="layui-col-xs6">
            <?= $form->field($model, 'name')->textInput(['maxlength' => true,'class'=>'layui-input']) ?>
        </div>
        <div class="layui-col-xs6">
            <?= $form->field($model, 'telphone')->textInput(['class'=>'layui-input search_input'])->label('联系方式') ?>
        </div>
        <div class="layui-col-xs6">
            <?= $form->field($model, 'sex')->dropDownList(['1'=>'男','2'=>'女','3'=>'未知'],['prompt'=>'请选择性别'])->label('性别') ?>
        </div>
        <div class="layui-col-xs6">
            <?= $form->field($model, 'birthday')->widget(\kartik\date\DatePicker::classname(), ['removeButton' => false,'pluginOptions' => [
                'autoclose'=>true,
                'todayHighlight' => true,
                'format' => 'yyyy-mm-dd',

            ]]);?>
        </div>
        <div class="layui-col-xs6">
            <?= $form->field($model, 'wechat_id')->textInput(['class'=>'layui-input search_input'])?>
        </div>
        <div class="layui-col-xs6">
            <?= $form->field($model, 'email')->textInput(['class'=>'layui-input search_input'])?>
        </div>
        <div class="layui-col-xs6">
            <?= $form->field($model, 'education')->textInput(['class'=>'layui-input search_input'])?>
        </div>
        <div class="layui-col-xs6">
            <?= $form->field($model, 'school')->textInput(['class'=>'layui-input search_input'])->label('毕业院校')?>
        </div>
        <div class="layui-col-xs6">
            <?= $form->field($model, 'current_city')->dropDownList(\qingrui\models\Area::getCityList(0),['prompt'=>'请选择省'])->label('所在城市'); ?>

        </div>
        <div class="layui-col-xs6">
            <?= $form->field($model, 'current_company')->textInput(['class'=>'layui-input search_input'])->label('所在公司')?>
        </div>
        <div class="layui-col-xs6">
            <?= $form->field($model, 'current_branch')->textInput(['class'=>'layui-input search_input'])?>
        </div>
        <div class="layui-col-xs6">
            <?= $form->field($model, 'current_post')->textInput(['class'=>'layui-input search_input'])->label('当前职位')?>
        </div>

    </div>
    <blockquote class="layui-elem-quote"><i class="layui-icon layui-icon-user"></i>   求职意向</blockquote>
    <div class="layui-row">
        <div class="layui-col-xs6">

        </div>
    </div>
    <blockquote class="layui-elem-quote"><i class="layui-icon layui-icon-user"></i>   教育经历</blockquote>
    <div class="layui-row">
        <div class="layui-col-xs6">

        </div>
    </div>
    <blockquote class="layui-elem-quote"><i class="layui-icon layui-icon-user"></i>   工作经历</blockquote>
    <div class="layui-row">
        <div class="layui-col-xs6">

        </div>
    </div>
    <blockquote class="layui-elem-quote"><i class="layui-icon layui-icon-user"></i>   项目经历</blockquote>
    <div class="layui-row">
        <div class="layui-col-xs6">

        </div>
    </div>
    <blockquote class="layui-elem-quote"><i class="layui-icon layui-icon-user"></i> 语言/技能/证书</blockquote>
    <div class="layui-row">
        <div class="layui-col-xs6">

        </div>
    </div>
    <blockquote class="layui-elem-quote"><i class="layui-icon layui-icon-user"></i>   附加信息</blockquote>
    <div class="layui-row">
        <div class="layui-col-xs6">

        </div>
    </div>
    <div align='right' style="margin-top:10px;">
        <?=
        Html::submitButton($model->isNewRecord ? '新增' : '更新', ['class' => $model->isNewRecord? 'layui-btn' : 'layui-btn layui-btn-normal'])
        ?>
    </div>
    <?php ActiveForm::end(); ?>
</div>
</div>
