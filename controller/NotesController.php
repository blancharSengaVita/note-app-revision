<?php

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