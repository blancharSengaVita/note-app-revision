<?php
//on va faire un crud https://laravel.com/docs/10.x/controllers#actions-handled-by-resource-controller
namespace Controller;

use Core\Database;
use Core\Response;
use Core\Validator;

class NotesController
{
	public function index(): void
	{
		$database = new Database(ENV_FILE);
		$notes = $database->query('SELECT * FROM `notes`')->all();

		views_path('notes/index.view.php', compact('notes'));
	}

	public function show(): void
	{
		if (!isset($_GET['id'])) {
			Response::abort(Response::METHOD_NOT_ALLOW);
		}

		$id = (int)$_GET['id'];


		$database = new Database(ENV_FILE);
		$notes = $database->query(
			'SELECT * FROM `notes` WHERE `id` = :id',
			[
				'id' => $id,
			]
		)->findOrFail();

		views_path('notes/show.view.php', compact('notes'));
	}

	public function create(): void
	{
		views_path('notes/create.view.php');
	}


	private function checkDescriptionNote()
	{
		if (!isset($_POST['description'])) {
			Response::abort(Response::METHOD_NOT_ALLOW);
		}

		$description = trim($_POST['description']);



		if (!Validator::between($description)) {
			$_SESSION['errors']['description'] = 'texte pas assez long mon gars';
			$_SESSION['old']['description'] = $description;
		}

		return trim($description);
	}

	public function store(): void
	{
		$description = $this->checkDescriptionNote();


		if (empty($_SESSION['errors'])){
			$database = new Database(ENV_FILE);
			$database->query(
				'INSERT INTO `notes` (`user_id`, `description`)
    VALUES
        (:user_id,:description)',
				[
					'user_id' => 1,
					'description' => $description,
				]
			);
			header('location: notes');
		} else {
			$location = 'http://' . $_SERVER['HTTP_HOST'] . '/notes/create';
			header("location: $location");
			exit;
		}
	}

	public function edit()
	{
		if(!isset($_GET['id'])){
			Response::abort(Response::NOT_FOUND);
		}

		$id = (int)$_GET['id'];
		$database = new Database(ENV_FILE);
		$notes = $database->query(
			'SELECT * FROM `notes` WHERE  `id` = :id',
			[
				'id' => $id,
			]
		)->findOrFail();
		views_path('notes/edit.view.php', compact('notes'));
	}

	public function update(){
		if (!isset($_POST['id'])){
			Response::abort(Response::METHOD_NOT_ALLOW);
		}

		$id = (int)$_POST['id'];
		$description = $this->checkDescriptionNote();

		if(empty($_SESSION['errors'])){
			$database = new Database(ENV_FILE);
			$database->query(
				'UPDATE `notes` SET `description` = :description  WHERE `id` = :id',
				[
					'id' => $id,
					'description' => $description,
				]
			);
			$location = '/note?id=' . $id;
		} else {
			$location = 'note/edit?id=' . $id;
		}
		header("location: $location");
	}
}