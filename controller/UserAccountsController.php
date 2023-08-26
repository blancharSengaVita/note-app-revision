<?php

namespace Controller;

use Core\Database;
use Core\Response;
use Core\Validator;

class UserAccountsController
{
	public function create()
	{
		views_path('userAccounts/create.view.php');
	}

	public function store()
	{
		if (!isset($_POST['username']) ||
			!isset($_POST['email']) ||
			!isset($_POST['password'])) {
			Response::abort(Response::METHOD_NOT_ALLOW);
		}

		if (!Validator::password($_POST['password'])){
			$_SESSION['errors']['password'] = 'Votre mot de passe doit avoir au moins 8 character, 1 chiffre, une majuscules, et un carateres speciales';
		}

		if (!Validator::email($_POST['email'])){
			$_SESSION['errors']['email'] = 'l\'email n\'a pas un format valide';
		}

		if (Validator::exists( 'email', 'users',$_POST['email'] )){
			$_SESSION['errors']['email'] = 'l\'email existe déjà';
		}

		if (!Validator::between($_POST['username'])){
			$_SESSION['errors']['username'] = 'le username n\'est pas assez long';
		}

		$username = $_POST['username'];
		$email = $_POST['email'];
		$password = $_POST['password'];

		$password = password_hash($password, PASSWORD_BCRYPT);

		if (empty($_SESSION['errors'])){
			$database = new Database(ENV_FILE);
			$database->query('INSERT INTO users(`name`, `email`, `password`) VALUES (:name, :email, :password)',
				[
					'name' => $username,
					'email' => $email,
					'password' => $password,
				]);

			$location = '/';
		} else {
			$_SESSION['old']['email'] = $_POST['email'];
			$_SESSION['old']['username'] = $_POST['username'];
			$location = '/register';
		}
		header("location: $location");
	}
}