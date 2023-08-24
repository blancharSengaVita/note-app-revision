<?php

use Core\Database;

define('BASE_PATH', __DIR__ . '/../');
require BASE_PATH . 'core/functions.php';
require BASE_PATH . 'vendor/autoload.php';

$file = require base_path('env.local.ini');

try {
	$database = new Database($file);
	deleteTables($database);
} catch (Exception $e){
	echo ($e->getMessage());
}


function deleteTables(Database $database)
{
	$sql = <<<'sql'
DROP TABLE IF EXISTS `notes`;
sql;
	$database->query($sql);
}
