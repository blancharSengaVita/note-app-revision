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

function storage_path(string $path) : string{
	return BASE_PATH . 'storage/' . $path;
}

function views_path (string $path, $params = []) {
	extract($params);
	require BASE_PATH . 'views/' . $path;
	$_SESSION['old'] = [];
	$_SESSION['errors'] = [];
}

function csrf(){
	$csrf_token = bin2hex(64);
	$_SESSION['csrf_token'] = $csrf_token;
	return $csrf_token;
}