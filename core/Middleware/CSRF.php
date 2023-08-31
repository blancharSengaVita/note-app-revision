<?php

namespace Core\Middleware;

use Core\Response;

class CSRF
{
	//on dit que si le middleware
	public function handle(){

		if (!isset($_POST['csrf_token'])){
			Response::abort();
		}

		if($_SESSION['csrf_token'] !== $_POST['csrf_token'])
		{
			Response::abort(Response::METHOD_NOT_ALLOW);
			exit;
		}

		$_SESSION['csrf_token'] = '';
	}
}