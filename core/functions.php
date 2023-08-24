<?php

function dd($value):void
{
	echo '</pre>';
	var_dump($value);
	echo '</pre>';
	die;
}

function base_path(string $path) : string{
	return BASE_PATH . $path;
}

function views_path (string $path, $params = []) {
	extract($params);
	require BASE_PATH . 'views/' . $path;
}