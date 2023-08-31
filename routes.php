<?php

use Controller\CarbonTrainingController;
use Controller\CookiePlayground;
use Controller\HomeController;
use Controller\NotesController;
use Controller\NsfwController;
use Controller\UserAccountsController;
use Controller\UserSessionsController;

$router->get('/', [HomeController::class,'index']);

//on va ajouter un middleware pour separer
//les pages qui devrait être accessible que par des gens connecter (authentifier)
//de juste des visiteurs guest
//on va donc faire une methode qui va prendre en compte
$router->get('/notes', [NotesController::class,'index'])->only('authenticated');
$router->get('/note', [NotesController::class,'show'])->only('authenticated');
$router->get('/note/create', [NotesController::class,'create'])->only('authenticated');

//on ajoute une methode le csrf token pour la partie ou on veut l'installer
$router->post('/note', [NotesController::class,'store'])->only('authenticated')->csrf();
$router->get('/note/edit', [NotesController::class,'edit'])->only('authenticated');
$router->patch('/note', [NotesController::class,'update'])->only('authenticated');
$router->delete('/note', [NotesController::class,'destroy'])->only('authenticated');


$router->get('/register',[UserAccountsController::class, 'create'])->only('guest');
$router->post('/register',[UserAccountsController::class, 'store'])->only('guest');

$router->get('/login', [UserSessionsController::class, 'create'])->only('guest');
$router->post('/login', [UserSessionsController::class, 'store'])->only('guest');
$router->delete('/logout', [UserSessionsController::class, 'destroy'])->only('guest');

$router->get('/carbon', [CarbonTrainingController::class, 'index']);

$router->get('/cookie', [CookiePlayground::class, 'index']);
$router->delete('/deconnexion', [CookiePlayground::class, 'destroy']);
$router->get('/nsfw', [NsfwController::class, 'index']);


//Voici notre liste de route possible
//ici la seule route que nous avonse et '/'
//et on va la lié une methode index de la HomeController.
//ça sera une classe qui gere toutes les routes et methodes lié avec la homeController.