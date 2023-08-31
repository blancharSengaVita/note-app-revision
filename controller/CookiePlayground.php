<?php

namespace Controller;

use Carbon\Carbon;


class CookiePlayground
{
	public function index(): void
	{
		//doit etre appelé avant toutes requetes https
//set cookies créer un cookie
//1er parametre le nom du cookies
//2e parametre la valeur du cookie
//3e parametre le temps que le cookie va etre valide avant d'expiré
//4e parametre defini le chemin du cookie (on le met à "/" en general, le chemin de base)
//5e le nom du domain sur lequel il va etre appliqué ("")
//6e securité | true si le site c'est en https sinon false, c'est pour savoir si il est
//7e true pour dire que l'accès au cookie ce fait qu'en http et pas en js pour eviter les failles de sécurité

//pour modifier un cookie il faut just rappeler setcookie et changer la valeur
		setcookie('lang', 'fr', time() + 3600 * 24 * 365, '/', '', false, true);
		setcookie('utilisateur', 'john', time() + 60 * 60 * 24 * 30);
		$user2 = [
			'nom' => 'blanchar',
			'age' => 21,
			'profession' => 'étudiant',
		];

		if(isset($_GET['yo'])) {
			$yo = $_GET['yo'];
		}

		setcookie('utilisateur2', serialize($user2), time() + 3600);
		$blanchar = $_COOKIE['utilisateur2'];


		views_path('cookie/index.view.php', compact('user2','blanchar', 'yo'));
	}

	public function destroy()
	{

		unset($_COOKIE['utilisateur']);
		setcookie('utilisateur', '', 1);

		header('location: /cookie');
	}
}