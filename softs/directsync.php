<?php

$sourceDir = str_replace('\\', '/', $argv[1]);
$targetDir = str_replace('\\', '/', $argv[2]);
$copyDir = str_replace('\\', '/', $argv[3]);
$IncludeAutoDir = isset($argv[4]) ? true : false;

$files = list_all_file($sourceDir);

echo('Scan ' . $sourceDir . PHP_EOL);
foreach ($files as $file) {
    if (file_exists($copyDir . '/' . $file) and (!preg_match("/^auto\_tools\//", $file) or $IncludeAutoDir)) {
        $dirs = dirname($file);
        if (!empty($dirs)) {
            $dirs = explode('/', $dirs);
            $basedir = $targetDir;
            foreach ($dirs as $dir) {
                if (!file_exists($basedir . '/' . $dir)) {
                    mkdir($basedir . '/' . $dir);
                }
                $basedir = $basedir . '/' . $dir;
            }
        }
        if (file_exists($targetDir . '/' . $file)) {
            unlink($targetDir . '/' . $file);
        }
        echo($file . PHP_EOL);
        copy($copyDir . '/' . $file, $targetDir . '/' . $file);
    }
}

function list_all_file($dir = '', $base_dir = '')
{
    $file_list = array();

    if (is_dir($dir)) {
        $array_filedir = scandir($dir);

        foreach ($array_filedir as $v) {
            if ($v == '.' or $v == '..')
                continue;

            if (is_dir($dir . '/' . $v)) {
                foreach (list_all_file($dir . '/' . $v, $base_dir . '/' . $v) as $file) {
                    $file_list[] = $file;
                }
            } else {
                // if( $base_dir == '' and ( $v == 'index.html' or $v == 'index.htm' ) ) continue; // Khong di chuyen index.html
                $file_list[] = preg_replace('/^\//', '', $base_dir . '/' . $v);
            }
        }
    }

    return $file_list;
}
