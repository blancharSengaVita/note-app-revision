<?php

use core\Database;

define('BASE_PATH', __DIR__ . '/../');
require BASE_PATH . 'core/functions.php';
require BASE_PATH . 'vendor/autoload.php';

$file = base_path('env.local.ini');
//pq ici on fait pas un require comme dans le controller frontale

try {
	$database = new Database($file);
	deleteTables($database);
	createTables($database);
	seedTables($database);
} catch (Exception $e){
	echo ($e->getMessage());
}


function deleteTables(Database $database): void
{
	$sql = <<<'sql'
DROP TABLE IF EXISTS `notes`;
sql;
	$database->query($sql);
	$sql = <<<'sql'
DROP TABLE IF EXISTS `users`;
sql;
	$database->query($sql);
}

function createTables(Database $database): void
{
	$sql = <<<'sql'
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
sql;
	$database->query($sql);
	$sql = <<<'sql'
CREATE TABLE `notes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
sql;
	$database->query($sql);
}

function seedTables(Database $database): void
{
	$sql = <<<'sql'
    INSERT INTO `users` (`id`, `name`, `email`,`password`)
    VALUES
        (1,'Dominique','dominique.vilain@hepl.be','change_this'),
        (2,'Myriam','myriam.dupont@hepl.be', 'change_this'),
        (3,'Daniel','daniel.schreurs@hepl.be','change_this');

    INSERT INTO `notes` (`id`, `user_id`, `description`)
    VALUES
        (1,1,'Ma première note de Dominique'),
        (2,1,'Ma deuxième note de Dominique'),
        (3,2,'Ma première note de Myriam'),
        (4,2,'Ma deuxième note de Myriam'),
        (5,3,'Ma première note de Daniel'),
        (6,3,'Ma deuxième note de Daniel');
sql;
	$database->query($sql);
}