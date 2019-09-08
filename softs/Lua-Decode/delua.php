<?php

set_time_limit(0);

$encoded_dir = str_replace('\\', '/', __DIR__) . '/encoded_files';
$decoded_dir = str_replace('\\', '/', __DIR__) . '/decoded_files';
$my_dir = str_replace('\\', '/', __DIR__);

if (!is_dir($encoded_dir)) {
    die("Khong ton tai thu muc encoded_files\n");
}

if (!is_dir($decoded_dir)) {
    die("Khong ton tai thu muc decoded_files\n");
}

// Đọc các file sẽ mã hóa
$files = array();
$tmp = scandir($encoded_dir);

foreach ($tmp as $v) {
	if ($v == '.' or $v == '..')
		continue;
    
    if (is_file($encoded_dir . '/' . $v)) {
        $files[] = $v;
    }
}

// Xóa hết các file trong thư mục mã hóa
$tmp = scandir($decoded_dir);

foreach ($tmp as $v) {
	if ($v == '.' or $v == '..')
		continue;
    
    if (is_file($decoded_dir . '/' . $v)) {
        $check = unlink($decoded_dir . '/' . $v);
        
        if (!$check) {
            die('Khong thu xoa file encoded_files/' . $v . "\n");
        }
    }
}

// Không có file nào để mã hóa
if (empty($files)) {
    die("Khong co file nao de ma hoa\n");
}

// Bắt đầu mã hóa
foreach ($files as $file) {
    $decode_file = $decoded_dir . '/' . $file;
    $encode_file = $encoded_dir . '/' . $file;
    
    if (is_file($my_dir . '/encode.lua')) {
        unlink($my_dir . '/encode.lua');
    }
    
    if (is_file($my_dir . '/decode.lua')) {
        unlink($my_dir . '/decode.lua');
    }
    
    $check = file_put_contents($my_dir . '/encode.lua', file_get_contents($encode_file), LOCK_EX);
    
    if ($check === false) {
        die("Khong the ghi file encode.lua\n");
    }
    
    $check = shell_exec('java -jar unluac.jar encode.lua > decode.lua');
    
    if (!empty($check)) {
        die ("Khong the ma hoa file " . $file . "\n");
    }
    
    $check = rename($my_dir . '/decode.lua', $decode_file);
    
    if (!$check) {
        die ("Khong the giai ma " . $file . "\n");
    } else {
        echo ("Chuyen: " . $file . "\n");
    }
}

if (is_file($my_dir . '/encode.lua')) {
    unlink($my_dir . '/encode.lua');
}

if (is_file($my_dir . '/decode.lua')) {
    unlink($my_dir . '/decode.lua');
}

echo ("Xong\n");