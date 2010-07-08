<?php
/**
 * dirlist.php
 * 
 * List files in a directory, and make a nice slideshow type thing
 * 
 * @author mike@pixor.net
 */

/**
 * Configuration
 * 
 * These values should be overridden in your 'index.php' file prior to
 * including dirlist.php.
 */
$defaults = array(
	'title'						=>	'Directory List',
	'show_extensions'			=>	array('jpg', 'jpeg', 'gif', 'png'),
	'show_patterns'				=>	array(),
	'hide_extensions'			=>	array('php', 'tpl', 'default'),
	'hide_patterns'				=>	array('/^\..*/', '/.*~$/'),
	'target_dir'				=>	dirname(__FILE__),
	'template_file'				=>	'dirlist.tpl',
	);

foreach ($defaults as $k => $v) {
	if (!isset($config[$k])) {
		$config[$k] = $v;
	}
}

$config['target_dir'] = rtrim($config['target_dir'], '/');

switch (isset($_GET['a']) ? $_GET['a'] : '') {
	case 'view':
		dirlist_view($config);
		break;
	case 'list':
	default:
		dirlist_list($config);
		break;
}

function dirlist_view($config) {
	$files = get_file_list($config);
	$file = false;
	if (isset($_GET['f']) && in_array($_GET['f'], $files)) {
		$file = $_GET['f'];
	}
	$header_sent = false;
	if (function_exists('getimagesize')) {
		$info = getimagesize($config['target_dir'] . '/' . $file);
		if (!empty($info[2])) {
			$header_sent = true;
			header("Content-type: " . $info[2]);
		}
	}
	if (!$header_sent) {
		$pathinfo = pathinfo($config['target_dir'] . '/' . $file);
		switch (strtolower($pathinfo['extension'])) {
			default:
				header("Content-type: image/jpeg");
				break;
			case 'png':
				header("Content-type: image/png");
				break;
			case 'gif':
				header("Content-type: image/gif");
				break;
		}
	}
	if (!is_readable($config['target_dir'] . '/' . $file)) {
		throw new Exception("Can't read file: $file");
	}
	readfile($config['target_dir'] . '/' .$file);
}

function dirlist_list($config) {
	$files = get_file_list($config);
	$file = false;
	if (isset($_GET['f']) && in_array($_GET['f'], $files)) {
		$file = $_GET['f'];
	}
	include($config['template_file']);
}

function get_file_list($config) {
	$dp = opendir($config['target_dir']);
	if (!$dp) {
		throw new Exception("Unable to open directory for reading");
	}
	while (($file = readdir($dp)) !== false) {
		if (!is_file($config['target_dir'] . '/' . $file)) continue;
		$pathinfo = pathinfo($file);
		
		// Step 1: Check for "show"
		$show = false;
		if (in_array($pathinfo['extension'], $config['show_extensions'])) {
			$show = true;
		} else {
			foreach ($config['show_patterns'] as $pat) {
				if (preg_match($pat, $file)) {
					$show = true;
					break;
				}
			}
		}
		if (!$show) continue;
		
		// Step 2: Check for "hide"
		if (in_array($pathinfo['extension'], $config['hidden_extensions'])) {
			$show = false;
		} else {
			foreach ($config['hide_patterns'] as $pat) {
				if (preg_match($pat, $file)) {
					$show = false;
					break;
				}
			}
		}
		if (!$show) continue;
		
		$files[] = $file;
	}
	
	closedir($dp);
	
	sort($files);
	return $files;
}
