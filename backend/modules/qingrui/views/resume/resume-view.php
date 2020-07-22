<?php
use yii\widgets\DetailView;
use backend\assets\LayuiAsset;

LayuiAsset::register($this);
?>
<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\date\DatePicker;
$this->registerJs($this->render('js/index.js'));
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
    #resumeschool-education{
        width:50%;
        display: inline-block
    }
    .date{
        float:left;
        width:50%;
        margin-bottom: 15px;
        margin-top: -10px;
    }
    .control-label{
        float:left;
        text-align: center;
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
            <?= $form->field($model, 'current_city')->textInput(['class'=>'layui-input search_input'])->label('所在城市')?>
<!--            --><?//= $form->field($model, 'current_city')->dropDownList(\qingrui\models\Area::getCityList(0),['prompt'=>'请选择省'])->label('所在城市'); ?>

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
    <div align='center'>
        <?=
        Html::submitButton($model->isNewRecord ? '新增' : '保存', ['class' => $model->isNewRecord? 'layui-btn' : 'layui-btn layui-btn-normal'])
        ?>
    </div>
    <?php ActiveForm::end(); ?>
    <?php $form = ActiveForm::begin(); ?>
    <blockquote class="layui-elem-quote"><i class="layui-icon layui-icon-user"></i>   求职意向</blockquote>
    <div class="layui-row">
        <div class="layui-col-xs6">
            <?= $form->field($model, 'current_state')->textInput(['class'=>'layui-input search_input'])?>
        </div><div class="layui-col-xs6">
            <?= $form->field($model, 'expected_trade')->textInput(['class'=>'layui-input search_input'])?>
        </div><div class="layui-col-xs6">
            <?= $form->field($model, 'expected_post')->textInput(['class'=>'layui-input search_input'])?>
        </div><div class="layui-col-xs6">
            <?= $form->field($model, 'expected_city')->textInput(['class'=>'layui-input search_input'])?>
        </div><div class="layui-col-xs6">
            <?= $form->field($model, 'current_money')->textInput(['class'=>'layui-input search_input'])?>
        </div>
        <div class="layui-col-xs6">
            <?= $form->field($model, 'expected_pay')->textInput(['class'=>'layui-input search_input'])?>
        </div>
    </div>
    <div align='center'>
        <?=
        Html::submitButton($model->isNewRecord ? '新增' : '保存', ['class' => $model->isNewRecord? 'layui-btn' : 'layui-btn layui-btn-normal'])
        ?>
    </div>
    <?php ActiveForm::end(); ?>
</div>
    <blockquote class="layui-elem-quote"><i class="layui-icon layui-icon-user"></i>   教育经历
<!--        <a title="添加" id="shool_add" style="text-decoration:none;"><i class="layui-icon layui-icon-add-circle" style="font-size: 24px;color:gray;margin-left:10px;"></i></a>-->
    </blockquote>
            <?php
            foreach($schoolModel as $k=>$v){
                $v=(object)$v;
                foreach($v as $k1=>$v1){
                    $v1=(object)$v1;
                ?>
    <div class="resume-school-form create_box">
        <?php $form = ActiveForm::begin(['action' => ['resume-update?id='.$v1->id],'method'=>'post','enableAjaxValidation' => false]); ?>
        <div class="layui-row">
            <div class="layui-col-xs6">
                <?= $form->field($v1, 'start_time')->widget(DatePicker::classname(), ['removeButton' => false,'pluginOptions' => ['autoclose'=>true,'todayHighlight' => true,'format' => 'yyyy-mm-dd'],'options' => ['placeholder' => '请选择日期','id'=>'resumeschool-start_time-'.$v1->id]]);?>
            </div>
            <div class="layui-col-xs6">
                <?= $form->field($v1, 'end_time')->widget(DatePicker::classname(),['removeButton' => false,'pluginOptions' => ['autoclose'=>true,'todayHighlight' => true,'format' => 'yyyy-mm-dd'],'options' => ['placeholder' => '请选择日期','id'=>'resumeschool-end_time-'.$v1->id]]);?>
            </div>
            <div class="layui-col-xs6">
                <?= $form->field($v1, 'school_name')->textInput(['class'=>'layui-input search_input'])?></div>
            <div class="layui-col-xs6">
                <?= $form->field($v1, 'major')->textInput(['class'=>'layui-input search_input'])?>
            </div>
             <div class="layui-col-xs6">
                 <?= $form->field($v1, 'education')->dropDownList($model->xueli,['prompt'=>'请选择学历'])->label('学历'); ?>
               </div>
        </div>
        <div align='center'>
            <?=
            Html::submitButton($model->isNewRecord ? '新增' : '保存', ['class' => $model->isNewRecord? 'layui-btn' : 'layui-btn layui-btn-normal'])
            ?>
            <?=
            Html::a('删除', \yii\helpers\Url::to(['school-delete','id'=>$v1->id]), ['class' => "layui-btn resume_school"]);
            ?>
        </div>
        <?php ActiveForm::end(); ?>
    </div>
      <?php }}?>
    <blockquote class="layui-elem-quote"><i class="layui-icon layui-icon-user"></i>   工作经历</blockquote>
          <?php
             foreach($workModel as $k=>$v){
                $v=(array)$v;
                foreach($v as $k1=>$v1){
                    $v1=(object)$v1;
          ?>
          <div class="resume-work-form create_box">
              <?php $form = ActiveForm::begin(['action' => ['work-update?id='.$v1->id],'method'=>'post','enableAjaxValidation' => false]); ?>
              <div class="layui-row">
                  <div class="layui-col-xs6">
                      <?= $form->field($v1, 'start_time')->widget(DatePicker::classname(), ['removeButton' => false,'pluginOptions' => ['autoclose'=>true,'todayHighlight' => true,'format' => 'yyyy-mm-dd'],'options' => ['placeholder' => '请选择日期','id'=>'resumeswork-start_time-'.$v1->id]]);?></div> <div class="layui-col-xs6">
                      <?= $form->field($v1, 'end_time')->widget(DatePicker::classname(), ['removeButton' => false,'pluginOptions' => ['autoclose'=>true,'todayHighlight' => true,'format' => 'yyyy-mm-dd'],'options' => ['placeholder' => '请选择日期','id'=>'resumeswork-end_time-'.$v1->id]]);?></div><div class="layui-col-xs6">
                      <?= $form->field($v1, 'work_name')->textInput(['class'=>'layui-input search_input'])?></div><div class="layui-col-xs6">
                      <?= $form->field($v1, 'job_name')->textInput(['class'=>'layui-input search_input'])?></div><div class="layui-col-xs6">
                      <?= $form->field($v1, 'work_content')->textInput(['class'=>'layui-input search_input'])?></div>
                </div>
            </div>
            <div align='center'>
                <?=
                Html::submitButton($model->isNewRecord ? '新增' : '保存', ['class' => $model->isNewRecord? 'layui-btn' : 'layui-btn layui-btn-normal'])
                ?>
                <?=
                Html::a('删除', \yii\helpers\Url::to(['work-delete','id'=>$v1->id]), ['class' => "layui-btn work_delete"]);
                ?>
            </div>
                <?php ActiveForm::end(); ?>
            </div>
            <?php }}?>
<!--项目经历-->
    <blockquote class="layui-elem-quote"><i class="layui-icon layui-icon-user"></i>   项目经历</blockquote>
    <?php
    foreach($projectModel as $k=>$v){
        $v=(object)$v;
        foreach($v as $k1=>$v1){
            $v1=(object)$v1;
            ?>
        <div class="resume-school-form create_box">
            <?php $form = ActiveForm::begin(['action' => ['project-update?id='.$v1->id],'method'=>'post','enableAjaxValidation' => false]); ?>
            <div class="layui-row">
                <div class="layui-col-xs6">
                    <?= $form->field($v1, 'start_time')->widget(DatePicker::classname(), ['removeButton' => false,'pluginOptions' => ['autoclose'=>true,'todayHighlight' => true,'format' => 'yyyy-mm-dd'],'options' => ['placeholder' => '请选择日期','id'=>'resumesproject-start_time-'.$v1->id]]);?></div> <div class="layui-col-xs6">
                    <?= $form->field($v1, 'end_time')->widget(DatePicker::classname(), ['removeButton' => false,'pluginOptions' => ['autoclose'=>true,'todayHighlight' => true,'format' => 'yyyy-mm-dd'],'options' => ['placeholder' => '请选择日期','id'=>'resumesproject-end_time-'.$v1->id]]);?></div><div class="layui-col-xs6">
                    <?= $form->field($v1, 'project_name')->textInput(['class'=>'layui-input search_input'])?></div><div class="layui-col-xs6">
                    <?= $form->field($v1, 'post_name')->textInput(['class'=>'layui-input search_input'])?></div><div class="layui-col-xs10">
                    <?= $form->field($v1, 'project_describe')->textarea(['rows'=>5,'style'=>'margin-left:20px']);?></div>
            </div>
        </div>
        <div align='center'>
            <?=
            Html::submitButton($model->isNewRecord ? '新增' : '保存', ['class' => $model->isNewRecord? 'layui-btn' : 'layui-btn layui-btn-normal'])
            ?>
            <?=
            Html::a('删除', \yii\helpers\Url::to(['project-delete','id'=>$v1->id]), ['class' => "layui-btn project_delete"]);
            ?>
        </div>
        <?php ActiveForm::end(); ?>
        </div>
    <?php }}?>
    <blockquote class="layui-elem-quote"><i class="layui-icon layui-icon-user"></i> 语言/技能/证书</blockquote>
<?php $form = ActiveForm::begin(); ?>
    <div class="layui-row">
        <div class="layui-col-xs6">
            <?= $form->field($model, 'language')->textInput(['class'=>'layui-input search_input'])?>
        </div><div class="layui-col-xs6">
            <?= $form->field($model, 'skill')->textInput(['class'=>'layui-input search_input'])?>
        </div><div class="layui-col-xs6">
            <?= $form->field($model, 'certificate')->textInput(['class'=>'layui-input search_input'])?>
        </div>
    </div>
    <div align='center'>
        <?=
        Html::submitButton($model->isNewRecord ? '新增' : '保存', ['class' => $model->isNewRecord? 'layui-btn' : 'layui-btn layui-btn-normal'])
        ?>
    </div>
<?php ActiveForm::end(); ?>
    <blockquote class="layui-elem-quote"><i class="layui-icon layui-icon-user"></i>   附加信息</blockquote>
<?php $form = ActiveForm::begin(); ?>
    <div class="layui-row">
        <div class="layui-col-xs10">
            <?= $form->field($model, 'evaluation')->textarea(['rows'=>5,'style'=>'margin-left:20px']);?>
            <?= $form->field($model, 'other')->textarea(['rows'=>5,'style'=>'margin-left:20px']);?>
        </div>
    </div>
    <div align='center'>
        <?=
        Html::submitButton( '保存', ['class' =>'layui-btn layui-btn-normal'])
        ?>
    </div>
<?php ActiveForm::end(); ?>
</div>
