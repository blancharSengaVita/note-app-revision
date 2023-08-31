<?php

namespace Controller;

class PhpFuntionPlayground
{
	public function index(){
		$string = 'yo.yo.yo';
		$explodeString = explode('.', $string);

		$_REQUEST();
//		allez voir la doc de;
//		implode();
//		call_user_func();
//		array_key_exists();
//		array_key_last();
//		sha1_file();
//		array_keys();
//		array_filter();
//		array_values();
//
//		foreach (){}
////		if(){}

//		finfo_open(FILEINFO_MIME_TYPE);
		//retourne le type mime soit ça
			//"text/plain
			//text/html
			//image/jpeg
			//image/png
			//audio/mpeg"
		//Ou False

//		$type =  finfo_file($finfo, $path);
//		finfo_close($finfo);
//		return in_array($type, $valid_types);
		//ln -s /Users/blanchar/ecole/annee-4/dcs/note-app-revision/storage/public/img /Users/blanchar/ecole/annee-4/dcs/note-app-revision/public/img
	}
}