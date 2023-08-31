<?php
//on va faire un crud https://laravel.com/docs/10.x/controllers#actions-handled-by-resource-controller
namespace Controller;

use Core\Database;
use Core\Response;
use Core\Validator;
use Intervention\Image\ImageManagerStatic as Image;

class NotesController
{
	use HandleFileUpload;

	//la prochaine fois faire la Sessions dés le début
	public \stdClass $user;

	public function __construct()
	{
		$this->user = $_SESSION['user'];
	}

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

	//
	private function savesImage($path)
	{
		$tmp_path = $_FILES['thumbnail']['tmp_name'];
		$image = Image::make($tmp_path);
		$width = $image->width();
		$height = $image->height();
		$ratio = $width/$height;
		foreach (NOTES_THUMBS_WIDTHS AS $thumb_width){
			if(!file_exists(storage_path('public/img/' . $thumb_width))){
				mkdir(storage_path('public/img/' . $thumb_width));
			}

			$image->resize($thumb_width, $thumb_width/$ratio)
				->save(storage_path('public/img/' . $thumb_width . '/').$path);
		}
		return true;
	}

	public function store(): void
	{
		$description = $this->checkDescriptionNote();
		$image_url = $this->handleImageUpload();

		if ($image_url){
			$this->savesImage($image_url);
		}

		if (empty($_SESSION['errors'])) {
			$database = new Database(ENV_FILE);
			$database->query(
				'INSERT INTO `notes` (`user_id`, `description`, `image_url`)
    VALUES
        (:user_id,:description, :image_url)',
				[
					'user_id' => 1,
					'description' => $description,
					'image_url' => $image_url,
				]
			);
			header('location: /notes');
		} else {
			$location = '/note/create';
			header("location: $location");
			exit;
		}
	}


	public function edit()
	{
		if (!isset($_GET['id'])) {
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


	public function update()
	{
		if (!isset($_POST['id'])) {
			Response::abort(Response::METHOD_NOT_ALLOW);
		}

		$id = (int)$_POST['id'];
		$description = $this->checkDescriptionNote();

		//on enregistre le nom de l'image
		$image_url = $this->handleImageUpload();

		if ($image_url) {
			$this->savesImage();
		}

		if (empty($_SESSION['errors'])) {
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

	public function destroy()
	{
		if (!isset($_POST['id'])) {
			Response::abort();
		}

		$id = (int)$_POST['id'];

		$database = new Database(ENV_FILE);
		$database->query(
			'DELETE FROM `notes` WHERE id = :id',
			[
				'id' => $id,
			]
		);
		header('location: /notes');
	}
}