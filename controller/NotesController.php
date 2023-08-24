<?php

namespace Controller;

class NotesController
{
	public function index(){
		$heading = 'Notes';
		views_path('notes/index.view.php', compact('heading'));
	}
}