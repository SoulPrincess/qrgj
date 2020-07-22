<?php
return[
    'components'=>[
        //数据库配置
//        'db'=>[
//            'class'=>'yii\db\Connection',
//            'dsn' => 'mysql:host=47.100.189.84;dbname=qc_data',
//            'username'=>'qingcheng',
//            'password'=>'qingcheng_mysql',
//            'charset'=>'utf8',
//            'tablePrefix'=>'t_',
//
//        ],
        'db'=>[
            'class'=>'yii\db\Connection',
            'dsn' => 'mysql:host=127.0.0.1;dbname=qr_data',
            'username'=>'root',
            'password'=>'root',
            'charset'=>'utf8',
            'tablePrefix'=>'t_',

        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'useFileTransport' =>false,
            'transport' => [
                'class' => 'Swift_SmtpTransport',
                'host' => 'smtp.163.com',  //每种邮箱的host配置不一样
                'username' => 'lhp123456l@163.com', // 邮箱账号
                'password' => 'ZSJAOUKRQBERRRES', // 授权码
                'port' => '25',
                'encryption' => 'tls',

            ],
            'messageConfig'=>[
                'charset'=>'UTF-8',
                'from'=>['lhp123456l@163.com'=>'admin']
            ],
        ],
//        'mailer' => [
//            'class' => 'yii\swiftmailer\Mailer',
//            'viewPath' => '@common/mail',
//        ],
        //短信组件，采用短信
        'sms'=>[
            'class'=>'common\components\sms'
        ],
        //自定义生成中文昵称
        'nickname'=>[
            'class'=>'common\components\nickname'
        ],
        //自定义根据ip地址获取物理地址
        'ipaddress'=>[
            'class'=>'common\components\ipaddress'
        ],
    ],
];