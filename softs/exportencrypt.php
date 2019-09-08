<?php

$sourceDir = str_replace('\\', '/', $argv[1]);
$targetDir = str_replace('\\', '/', $argv[2]);

$rootDir = str_replace('\\', '/', __DIR__);

$files = list_all_file($sourceDir);

echo('Scan ' . $sourceDir . PHP_EOL);
foreach ($files as $file) {
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
    // Xóa file ở đích đến
    if (file_exists($targetDir . '/' . $file)) {
        unlink($targetDir . '/' . $file);
    }
    // Xóa file ghi tạm để mã hóa
    if (file_exists($rootDir . '/decode.lua')) {
        unlink($rootDir . '/decode.lua');
    }
    // Chép về file tạm để mã hóa
    copy($sourceDir . '/' . $file, $rootDir . '/decode.lua');
    
    // Mã hóa
    $check = shell_exec('"C:\Program Files (x86)\Lua\5.1\luac.exe" -o "encode.lua" "decode.lua"');
    
    if (!empty($check) or !file_exists($rootDir . '/encode.lua') or filesize($rootDir . '/encode.lua') <= 0) {
        die ("Error encrypt " . $file . "\n");
    }
    
    // Copy file tạm sang đích đến
    copy($rootDir . '/encode.lua', $targetDir . '/' . $file);
    // Xóa file tạm
    unlink($rootDir . '/encode.lua');
    unlink($rootDir . '/decode.lua');
    echo($file . PHP_EOL);
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
