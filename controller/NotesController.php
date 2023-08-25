<?php
//on va faire un crud https://laravel.com/docs/10.x/controllers#actions-handled-by-resource-controller
namespace Controller;

use Core\Database;

class NotesController
{
	public function index(): void
	{
		$database = new Database(ENV_FILE);
		$notes  = $database->query('SELECT * FROM `notes`')->all();

		views_path('notes/index.view.php', compact('notes'));
	}
}