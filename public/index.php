<?php

define('BASE_PATH', __DIR__ . '/../');
require BASE_PATH . 'core/functions.php';

require base_path('vendor/autolaod.php');
define('ENV_FILE', require base_path('env.local.ini'));

$router = new Router;
require base_path('routes.php');

//On va faire un tableau qui va prendre en lui toutes les routes possibles en fonction de l'uri qu'on va recevoir et de la methode qui a lancé la requete.

//On va aussi associé un controller à cette uri, qui elle va appeler une méthode qui va nous afficher la vue

