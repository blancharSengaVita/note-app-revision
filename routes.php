<?php

use Controller\HomeController;

$router->get('/', [HomeController::class,'index']);

//Voici notre liste de route possible
//ici la seule route que nous avonse et '/'
//et on va la lié une methode index de la HomeController.
//ça sera une classe qui gere toutes les routes et methodes lié avec la homeController.