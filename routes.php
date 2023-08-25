<?php

use Controller\HomeController;
use Controller\NotesController;

$router->get('/', [HomeController::class,'index']);


$router->get('/notes', [NotesController::class,'index']);
$router->get('/note', [NotesController::class,'show']);
$router->get('/note/create', [NotesController::class,'create']);
$router->post('/note', [NotesController::class,'store']);
$router->get('/note/edit', [NotesController::class,'edit']);


//Voici notre liste de route possible
//ici la seule route que nous avonse et '/'
//et on va la lié une methode index de la HomeController.
//ça sera une classe qui gere toutes les routes et methodes lié avec la homeController.