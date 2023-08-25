<?php

use Core\Router;

define('BASE_PATH', __DIR__ . '/../');
require BASE_PATH . 'core/functions.php';

session_start();
require base_path('vendor/autoload.php');
define('ENV_FILE', base_path('env.local.ini'));


$router = new Router;
require base_path('routes.php');
//dd($router->routes);
$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$method = $_POST['_method'] ?? $_SERVER['REQUEST_METHOD'];

$router->routeToController($uri, $method);



//Dans le dd qu'on a fait ici il n y q qu'une seule route car nous en avons fait qu'une mais vous verrez qu'il y en aura plusieur en fur et mesures qu'on crée des vues

