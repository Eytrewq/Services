<?php

$cfg['blowfish_secret'] = 'SecretSecreSecrSecSeSSecretSecreSecrSecSeS';

$i = 1;

$cfg['Servers'][$i]['auth_type'] = 'cookie';

$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;

$cfg['Servers'][$i]['host'] = "mysql-service";
$cfg['Servers'][$i]['port'] = "3306";
$cfg['Servers'][$i]['user'] = "user";
$cfg['Servers'][$i]['password'] = "password";

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
