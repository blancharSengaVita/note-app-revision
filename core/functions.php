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