<?php

namespace Controller;

class HomeController
{
	public function index()
	{
		//on va lui demander de nous remettre la vue
		//de la homepage
		$heading = "Page d\'acceuil";
		$tagline = "<p> Bienvenue sur mon site web je suis <a href=\"https://blanchar.be\" title=\"aller vers blanchar.be\" target=\"_blank\">Blanchar</a> <p>";
		views_path('home/create.view.php', compact('tagline', 'heading'));
	}
}