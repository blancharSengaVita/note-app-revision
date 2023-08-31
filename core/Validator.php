<?php

namespace Core;

class Validator
{
	public static function between(string $description, int $min = 2, $max = INF): bool
	{
		return strlen($description) > $min && strlen($description) < $max;
	}

	public static function password($password, $length = 8) :bool
	{
		$has_a_number = preg_match('/\d/', $password);
		$has_an_uppercase = preg_match('/[A-Z]/', $password);
		$has_a_symbol = preg_match('/[^a-zA-Z0-9\s]/', $password);

		return strlen($password) > $length
			|| $has_a_symbol
			|| $has_an_uppercase
			|| $has_a_number;
	}

	public static function email($email)
	{
		return filter_var($email, FILTER_VALIDATE_EMAIL);
	}

	//on peut mettre des placeholders que pour des values c'est pour ça qu'on utilise que des interpolations ici
	public static function exists($field, $table, $value){
		$database = new Database(ENV_FILE);
		return $database->query(
			"SELECT {$field} FROM {$table} WHERE {$field} = :value",
			[
				'value' => $value
			]
		)->find();
	}

	public static function image(mixed $tmp_path)
	{
		$valid_types = [
			'image/jpg',
			'image/jpeg',
			'image/png',
			'image/gif',
		];
		//on crée une instance finfo qui va retrouner le type mime qu'on met dans la variable $finfo
		//allez voir finfo file dans la doc
		$finfo = finfo_open(FILEINFO_MIME_TYPE);
		$type = finfo_file($finfo,$tmp_path);
		finfo_close($finfo);

		return in_array($type, $valid_types);
	}
}