<?php
//on va faire un crud https://laravel.com/docs/10.x/controllers#actions-handled-by-resource-controller
namespace Controller;

use Core\Database;
use core\Response;

class NotesController
{
	public function index(): void
	{
		$database = new Database(ENV_FILE);
		$notes  = $database->query('SELECT * FROM `notes`')->all();

		views_path('notes/index.view.php', compact('notes'));
	}

	public function show(): void
	{
		if(!isset($_GET['id'])){
			Response::abort(Response::METHOD_NOT_ALLOW);
		}

		$id = (int)$_GET['id'];


		$database = new Database(ENV_FILE);
		$notes  = $database->query(
			'SELECT * FROM `notes` WHERE `id` = :id',
			[
				'id' => $id,
			]
		)->find();

		views_path('notes/show.view.php', compact('notes'));
	}
}