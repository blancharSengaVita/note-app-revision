<?php

namespace Core;

use Exception;
use http\Params;
use PDO;
use PDOStatement;
use stdClass;

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

		$this->connection = new PDO($dsn, $settings['database']['username'], $settings['database']['password'], [
			PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
			PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
		]);
	}

	public function query($sql, $params = []): Database
	{
		$this->st = $this->connection->prepare($sql);
		$this->st->execute($params);
		return $this;
	}

	public function all(): stdClass|array
	{
		return $this->st->fetchAll();
	}

	public function find(): stdClass | bool
	{
		return $this->st->fetch();
	}

	public function findOrFail(): stdClass
	{
		$row = $this->st->fetch();

		if(!$row){
			Response::abort(Response::METHOD_NOT_ALLOW);
		}

		return $row;
	}


}
