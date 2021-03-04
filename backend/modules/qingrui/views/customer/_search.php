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
    .outform{
        margin-left:30px;
        margin-top:40px;
    }
    .layui-btn-normal{
        text-decoration:none;
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
    <?= $form->field($model, 'username')->textInput(['class'=>'layui-input search_input'])->label('操作用户') ?>
    <?= $form->field($model, 'type')->dropDownList(['1'=>'企业客户','2'=>'个人客户'],['prompt'=>'请选择类别','style'=>'display:none']) ?>

    <?= $form->field($model, 'company_name')->textInput(['class'=>'layui-input search_input'])->label('企业名称') ?>

    <?= $form->field($model, 'province_id')->DropDownList(Area::getCityList(0),
        ['prompt'=>'选择省份','onchange'=>'$.post("'.yii::$app->urlManager->createUrl('qingrui/customer/city').'",{pid:$(this).val()},function(data){var str="";$.each(data,function(k,v){str+="<option value="+k+">"+v+"</option>";});$("select#customer-city_id").html(str);})','style'=>'display:none'])->label('地址'); ?>

    <?= $form->field($model, 'city_id')->dropDownList(Area::getCityList($model->province_id),['prompt'=>'选择市区','style'=>'display:none'])->label('') ?>

    <?= $form->field($model, 'name')->textInput(['class'=>'layui-input search_input'])->label('联系人') ?>
    <?= $form->field($model, 'sex')->dropDownList(['1'=>'男','2'=>'女','3'=>'未知'],['prompt'=>'请选择性别','style'=>'display:none'])->label('性别') ?>
    <?= $form->field($model, 'post')->textInput(['class'=>'layui-input search_input'])->label('职位名称') ?>


<!--    --><?//= $form->field($model, 'status')->dropDownList(['1'=>'已审核','2'=>'待审核'],['prompt'=>'请选择类别','style'=>'display:none;'])->label('状态') ?>
    <div class="form-group" style="display:block;">
        <?= Html::submitButton('查找', ['class' => 'layui-btn layui-btn-normal']) ?>
        <?= Html::button('添加', ['class' => 'layui-btn layui-default-add']) ?>
		<?= Html::button('批量删除', ['class' => 'layui-btn layui-btn-danger layui-default-delete-all']) ?>
        <?= Html::button("<i class='layui-icon'>&#xe601;</i>批量导出", ['class' => 'layui-btn layui-btn-normal','onclick'=>"goods_export();"]) ?>
        <?= Html::button("<i class='layui-icon'>&#xe67c;</i>批量导入", ['class' => 'layui-btn layui-btn-normal layui-default-import','id'=>'goods_import']) ?>
        <?=Html::a('下载导入模板','http://www.qrgj.com/uploads/default_template.xls', ['class' => "layui-btn layui-btn-normal layui-btn-xs"]);
        ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<script>
    //客户信息导出
    function goods_export(){
        layer.open({
            type: 1,
            title: false, //不显示标题
            area: ['340px', '240px'], //宽高
            content: '<form role="form" style="margin:20px">\n' +
            '<label for="name">导出类别</label>\n' +
            '<div class="outform">\n' +
            '\t<label class="radio-inline" >\n' +
            '    <input type="radio" name="type" id="optionsRadios3" value="1" checked style="margin-top:5px"> 全部数据\n' +
            '</label>' +
            '<label class="radio-inline">\n' +
            '    <input type="radio" name="type" id="optionsRadios4"  value="2" style="margin-top:5px"> 当前查询\n' +
            '</label>\n' +
            '</div>' +
            '\t<div class="outform" style="margin-top:40px">\n' +
            '      <button type="button" class="btn btn-primary" onclick="outformdata()">确定导出</button><button type="button" class="btn btn-link" id="export_data" style=""></button>\n' +
            '  </div>\n' +
            '</form>'
        });
    }
    function outformdata(){
        var company_name='',contacts='',position='',username='',company_sex='',province_id='',city_id='';
        var type=$("input[name='type']:checked").val();//导出类别
        if(type==2){
            company_name= $("input[name='Customer[company_name]']").val();//企业名称
            contacts= $("input[name='Customer[name]']").val();//联系人
            position= $("input[name='Customer[post]']").val();//职位
            username= $("input[name='Customer[username]']").val();//操作人员
            company_sex= $("select[name='Customer[sex]']").val();//性别
            province_id= $("select[name='Customer[province_id]']").val();//性别
            city_id= $("select[name='Customer[city_id]']").val();//性别
        }
        //全局配置
        $.ajaxSetup({
            layerIndex:-1, //保存当前请求对应的提示框index,用于后面关闭使用
            beforeSend: function(jqXHR, settings) {
                this.layerIndex = layer.load(0,{
                    shade: [0.1,'#000'] //0.1透明度的白色背景
                });
            },
            //请求完毕后（不管成功还是失败），关闭提示框
            complete: function () {
                layer.close(this.layerIndex);
            },
            //请求失败时，弹出错误信息
            error: function (jqXHR, status, e) {
                layer.alert('数据请求失败，请后再试!');
            }
        });
        $.get("export",
            {
                type:type,
                username:username,
                company_name:company_name,
                contacts:contacts,
                position:position,
                company_sex:company_sex,
                province_id:province_id,
                city_id:city_id,
            },
            function (data) {
            console.log(data);
                if(data.code==1){
                    layer.msg(data.msg+'，导出数量：'+data.count+'条',{time:2000},function(){
                        $('#export_data').html('<a style="color:red" href="'+data.src+'">点击下载</a>');
                    })
                }else{
                    layer.msg(data.msg,{time:2000})
                }
            },'json');

    }
</script>
