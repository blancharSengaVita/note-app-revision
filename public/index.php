<?php

use Core\Router;

define('BASE_PATH', __DIR__ . '/../');
require BASE_PATH . 'core/functions.php';

require base_path('vendor/autoload.php');
define('ENV_FILE', require base_path('env.local.ini'));

$router = new Router;
require base_path('routes.php');
//dd($router->routes);
$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$method = $_POST['_method'] ?? $_SERVER['REQUEST_METHOD'];
$router->routeToController($uri, $method);


//Mnt qu'on a notre uri, notre method et la method de notre class a appeler pour afficher la vue dans le tableau des routes (voir le dd*), on va essayer d'afficher la vue en fonction de la method et l'uri qu'on reçoit d'une requete
