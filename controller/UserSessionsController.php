<?php

namespace Controller;

use Core\Database;
use Core\Response;
use Core\Validator;

class UserSessionsController
{
	public function create()
	{
		views_path('userSessions/create.view.php');
	}

	public function store()
	{
		if (!isset($_POST['email']) ||
			!isset($_POST['password'])
		) {
			Response::abort(Response::BAD_REQUEST);
		}

		if (!Validator::exists( 'email', 'users',$_POST['email'] )){
			$_SESSION['errors']['email'] = 'l\'email n\'existe pas dans notre base de données';
		}

		$password = trim($_POST['password']);
		$email = trim($_POST['email']);

		$database = new Database(ENV_FILE);
		$user = $database->query(
			'SELECT * FROM `users` WHERE email = :email ',
			[
				'email' => $_POST['email'],
			]
		)->find();

		if($user->password !== $password){
			$_SESSION['errors']['password'] = 'mot de passe incorrecte';
		}

		if (empty($_SESSION['errors'])){
			$_SESSION['user'] = $user;
			header('location: /notes');
		} else {
			$_SESSION['old']['email'] = $email;
			header('location: /login');
		}
		exit;
	}

	public function destroy()
	{
		$_SESSION = [];

		if (ini_get('session.use_cookies')) {
			$params = session_get_cookie_params();
			setcookie(
				session_name(),
				'',
				time() - 42000,
				$params['path'],
				$params['domain'],
				$params['secure'],
				$params['httponly']
			);
		}

		session_destroy();
		header('location: /');
	}
}