<?php

define('BASE_PATH', __DIR__ . '/../');
require BASE_PATH . 'core/functions.php';

require base_path('vendor/autolaod.php');
define('ENV_FILE', require base_path('env.local.ini'));

//La variable globale __DIR__ contient le chemin absolu du répertoire du fichier dans lequel elle est utilisée. Cela signifie que si vous utilisez __DIR__ dans un script PHP, elle vous donnera le chemin complet du répertoire où se trouve ce script

// Inclure vendor/autoload.php au début de votre script permettra de charger automatiquement les classes de toutes les dépendances installées via Composer. Cela facilite grandement l'utilisation de ces classes dans l'ensemble de votre projet, car vous n'avez pas à vous soucier d'inclure manuellement chaque fichier de classe à chaque fois que vous en avez besoin.

//Demander aux profs un exemple de ce qui ce passe quand on charge pas le fichier autoload : reponse on devra les inclure manuellement c'est relou.

