<?php

define('BASE_PATH', __DIR__ . '/../');
require BASE_PATH . 'core/functions.php';

require base_path('vendor/autolaod.php');
define('ENV_FILE', require base_path('env.local.ini'));

$router = new Router;

//pour la relier au controller frontale on va faire une class Router qui va s'occuper des routes

