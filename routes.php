<?php

use Controller\HomeController;
use Controller\NotesController;
use Controller\UserAccountsController;
use Controller\UserSessionsController;

$router->get('/', [HomeController::class,'index']);


$router->get('/notes', [NotesController::class,'index']);
$router->get('/note', [NotesController::class,'show']);
$router->get('/note/create', [NotesController::class,'create']);
$router->post('/note', [NotesController::class,'store']);
$router->get('/note/edit', [NotesController::class,'edit']);
$router->patch('/note', [NotesController::class,'update']);
$router->delete('/note', [NotesController::class,'destroy']);


$router->get('/register',[UserAccountsController::class, 'create']);
$router->post('/register',[UserAccountsController::class, 'store']);

$router->get('/login', [UserSessionsController::class, 'create']);
$router->post('/login', [UserSessionsController::class, 'store']);


//Voici notre liste de route possible
//ici la seule route que nous avonse et '/'
//et on va la lié une methode index de la HomeController.
//ça sera une classe qui gere toutes les routes et methodes lié avec la homeController.