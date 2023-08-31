<?php

namespace Controller;

use Core\Response;
use Core\Validator;

trait HandleFileUpload
{
	public function handleImageUpload()
	{
		//On verifie si on veut upload une image
		//sinon on retourne rien
		//dans la publique fonction store on aura une variable qui
		//stokera la valeur de retour. On va fera test pour savoir si c'est un string vide ou non. Si elle vide on fera rien, si elle est rempli c'est qu'on a l'image et qu'on peut la traiter
		if (empty($_FILES)){
			return '';
		}

		if(!isset($_FILES['thumbnail'])){
			Response::abort(Response::BAD_REQUEST);
		}

		if ($_FILES['thumbnail']['error'] === 0){
			$tmp_path = $_FILES['thumbnail']['tmp_name']; //contient le path de la memoir tampon dans lequelle il est stocké
			$current_name = $_FILES['thumbnail']['name']; //contient le nom et l'ext du fichier
			if(!Validator::image($tmp_path)){
				$_SESSION['error']['thumbnail'] = 'le format n\'est pas une image';
				$_SESSION['old'] = $_REQUEST;
				return '';
			}

			//on veut fabriquer un nouveau nom avec l'extension de l'image. on va donc recuperer l'extension present dans current_name
			//et on va la contacter au sha1_file du path
			//on utilise sha 1 car ça permet de "Calculates the sha1 hash of the file specified by filename" donc si un document à le meme ça va juste écrase l'ancien au lieu d'en avoir plus fois la meme image télécharger
			$name_parts = explode('.', $current_name);
			$extension = $name_parts[array_key_last($name_parts)];
			$new_name = sha1_file($tmp_path). '.' .$extension;

			// on retourne ce nouveau nom
			return $new_name;
		}
		return '';
	}
}