<?php

namespace Controller;

class HomeController
{
	public function index()
	{
		//on va lui demander de nous remettre la vue
		//de la homepage
		views_path('home/index.view.php');
	}
}