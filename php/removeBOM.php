<?php
 
//remove the utf-8 boms
//by magicbug at gmail dot com
 
if (isset($_GET['dir'])){ //config the basedir
    $basedir=$_GET['dir'];
}else{
    $basedir = '.';
}
 
$auto = 1;
 
checkdir($basedir);
 
/**
 * [checkdir 檢查目錄]
 * @param  [type]                   $basedir [description]
 * @return [type]
 * @date   2017-10-29T19:01:11+0800
 */
function checkdir($basedir)
{
    if ($dh = opendir($basedir)) {
        while (($file = readdir($dh)) !== false) {
            if ($file != '.' && $file != '..'){
                if (!is_dir($basedir."/".$file)) {
                    echo "filename $basedir/$file ".checkBOM("$basedir/$file")." <br>";
                }else{
                    $dirname = $basedir."/".$file;
                    checkdir($dirname);
                }
            }
        }
        closedir($dh);
    }
}
 
/**
 * [checkBOM 檢查檔案BOM]
 * @param  [type]                   $filename [description]
 * @return [type]
 * @date   2017-10-29T19:01:19+0800
 */
function checkBOM ($filename)
{
    global $auto;
    $contents = file_get_contents($filename);
    $charset[1] = substr($contents, 0, 1);
    $charset[2] = substr($contents, 1, 1);
    $charset[3] = substr($contents, 2, 1);
    if (ord($charset[1]) == 239 && ord($charset[2]) == 187 && ord($charset[3]) == 191) {
        if ($auto == 1) {
            $rest = substr($contents, 3);
            rewrite ($filename, $rest);
            return ("<font color=red>BOM found, automatically removed.</font>");
        } else {
            return ("<font color=red>BOM found.</font>");
        }
    }
    else return ("BOM Not Found.");
}
 
/**
 * [rewrite 移除檔頭BOM]
 * @param  [type]                   $filename [description]
 * @param  [type]                   $data     [description]
 * @return [type]
 * @date   2017-10-29T19:01:40+0800
 */
function rewrite ($filename, $data)
{
    $filenum = fopen($filename, "w");
    flock($filenum, LOCK_EX);
    fwrite($filenum, $data);
    fclose($filenum);
}
