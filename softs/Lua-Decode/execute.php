<?php

set_time_limit(0);

/**
 * list_all_file()
 * 
 * @param string $dir
 * @param string $base_dir
 * @return
 */
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

$project_dir = str_replace('\\', '/', realpath(__DIR__ . '/../../'));

// Thư mục chứa lua mã hóa
$encode_dir = $project_dir . "/softs/Un-Package";

// Thư mục chưa lua giải nén
$decode_dir = $project_dir . "/softs/Lua-Decode";

if (!is_dir($decode_dir . '/lua')) {
    $check = mkdir($decode_dir . '/lua');
    echo ("Tao: /lua");
    echo ($check ? " => OK" : " => ERROR");
    echo ("\n");
    
    if (!$check) {
        die();
    }
}

$files = list_all_file($encode_dir);

// Tạo hết thư mục
foreach ($files as $file) {
    $dirname = dirname($file);
    $dircheck = '/lua';
    
    if ($dirname != '.') {
        $dirname = explode('/', $dirname);
        
        foreach ($dirname as $dir) {
            $dircheck .= '/' . $dir;
            if (!is_dir($decode_dir . $dircheck)) {
                if (mkdir($decode_dir . $dircheck)) {
                    echo ("Tao: " . $dircheck . "\n");
                } else {
                    die ("Error Creat Dir: " . str . "\n");
                }
            }
        }
    }
}

foreach ($files as $file) {
    $encode_file = $encode_dir . '/' . $file;
    $decode_file = $decode_dir . '/lua/' . $file;
    
    if (is_file($decode_file)) {
        unlink($decode_file);
    }
    
    if (preg_match("/\.lua$/i", $file)) {
        if (is_file($decode_dir . '/encode.lua')) {
            unlink($decode_dir . '/encode.lua');
        }
        
        if (is_file($decode_dir . '/decode.lua')) {
            unlink($decode_dir . '/decode.lua');
        }
        
        $check = file_put_contents($decode_dir . '/encode.lua', file_get_contents($encode_file), LOCK_EX);
        
        if ($check === false) {
            die("Khong the ghi file encode.lua\n");
        }
        
        $check = shell_exec('java -jar unluac.jar encode.lua > decode.lua');
        
        if (!empty($check)) {
            die ("Khong the chuyen doi file " . $file . "\n");
        }
        
        $check = rename($decode_dir . '/decode.lua', $decode_file);
        
        if (!$check) {
            die ("Khong the chuyen doi file " . $file . "\n");
        } else {
            echo ("Chuyen: " . $file . "\n");
        }
    } else {
        file_put_contents($decode_file, file_get_contents($encode_file), LOCK_EX);
    }
}

echo ("Xong\n");