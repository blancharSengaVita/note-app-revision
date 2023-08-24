<?php

namespace Core;

use Exception;
use PDO;
use PDOStatement;

class Database
{
	public PDO $connection;
	public PDOStatement $st;

	public function __construct($file)
	{
		if (!$settings = @parse_ini_file($file, TRUE)) throw new Exception('Unable to open ' . $file . '.');

		$dsn = $settings['database']['driver'] .
			':host=' . $settings['database']['host'] .
			((!empty($settings['database']['port'])) ? (';port=' . $settings['database']['port']) : '') .
			';dbname=' . $settings['database']['schema'];

		$this->connection = new PDO($dsn, $settings['database']['username'], $settings['database']['password']);
	}

	public function query($sql):void {
		$this->st = $this->connection->prepare($sql);
		$this->st->execute();
	}
}

//Etape de creation d'un namespace et d'une classe
//Création de la classe avec un namespace
//Ajout du namespace dans le fichier "composer.json"
//Exécution de composer dump-autoload

//on setup le constructeur
//reference : https://www.php.net/manual/en/class.pdo