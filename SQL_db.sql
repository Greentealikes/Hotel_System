
CREATE DATABASE redhotel;
ALTER DATABASE redhotel
use redhotel;

/*會員預約編號*/
CREATE TABLE Userdb (
    usid mediumint(8) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '顧客編號',
    cu_sn mediumint(8) NOT NULL COMMENT '管理對應編號',
    usname varchar(20) NOT NULL COMMENT '顧客姓名',
    usphone varchar(11) NOT NULL COMMENT '聯繫電話',
    usemail varchar(50) NOT NULL COMMENT '聯繫信箱',
    usarea varchar(50) NOT NULL COMMENT '聯繫地址',
    datein date NOT NULL COMMENT '入房時間',
    dateout date NOT NULL COMMENT '退房時間',
    usnum VARCHAR(11) NOT NULL COMMENT '顧客人數',
    title VARCHAR(20) NOT NULL COMMENT '訂房類型',
    category VARCHAR(20) NOT NULL COMMENT '訂房種類',
    user_extra  VARCHAR(2) NOT NULL COMMENT '加床',
    user_name VARCHAR(30) NOT NULL COMMENT '使用帳號',
    usadd VARCHAR(255) NOT NULL COMMENT '備註欄',
    ustype VARCHAR(128) COMMENT '查詢欄'
)ENGINE = MYISAM DEFAULT CHARSET = utf8 COMMENT = "顧客資料庫";

SELECT * FROM Userdb;
INSERT INTO Userdb (usname,cu_sn,usphone,usemail,usarea,datein,dateout,usnum,title,category,usadd)
VALUES ('Lars','34','0978466897','okpt@gmail.com','台南永康','2020-07-18','2020-08-18','12','單人套房','古典類型','這是測試');

/*會員、管理員資料*/
CREATE TABLE Users (
    uid mediumint(8) unsigned NOT NULL AUTO_INCREMENT ,
    uname  varchar(25) NOT NULL COMMENT '帳號',
    name varchar(30) NOT NULL COMMENT '會員姓名',
    pass varchar(255) NOT NULL COMMENT '會員密碼',   
    tel  varchar(11) NOT NULL COMMENT '會員電話',
    email varchar(50) NOT NULL COMMENT '會員信箱',
    kind enum('0','1') NOT NULL DEFAULT '0' COMMENT '會員權限',
    token varchar(25) NOT NULL,
    PRIMARY KEY (uid)
)ENGINE = MYISAM DEFAULT CHARSET = utf8 COMMENT = "會員資料庫";

/*---加密密碼---*/
SELECT * FROM Users;
INSERT INTO Users(uname,pass,name,tel,email,kind,token) 
VALUES ('admin','$2y$10$bCYRliastVDxZqL20a9Q5OHg43sH0PUsTe/rOq/KqCqwQMUS.8Bmm','root','0933333333','admin@gmail.com','1','xxxxxx');


/*---網址管理資料表---*/
CREATE TABLE `kinds` (
    `sn` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'kinds_sn',
    `ofsn` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT '父類別',
    `kind` varchar(50) NOT NULL DEFAULT '' COMMENT '分類',
    `title` varchar(50) NOT NULL DEFAULT '' COMMENT '標題',
    `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
    `enable` enum('1','0') NOT NULL DEFAULT '1' COMMENT '狀態',
    `url` varchar(255) NOT NULL DEFAULT '' COMMENT '網址',
    `target` enum('1','0') NOT NULL DEFAULT '0' COMMENT '外連',
    `col_sn` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'col_sn',
    `content` text NULL COMMENT '內容',
    PRIMARY KEY (`sn`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='選單類別資料表';

CREATE TABLE `prods` ( 
    `sn` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '產品編號',
    `present_sn` int(10) unsigned COMMENT '詳細編號',
    `col_sn` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '欄位編號',
    `title` varchar(50) NOT NULL default '' COMMENT '名稱',
    `title_en` varchar(50) NOT NULL default '' COMMENT '英文名稱',
    `kind` enum('1','0') COMMENT '種類',
    `category` varchar(10) NOT NULL default '' COMMENT '類別',
    `price` int(10) unsigned NOT NULL default 0 COMMENT '定價', 
    `content` text NULL COMMENT '產品內容',     
    `enable` enum('1','0') NOT NULL default '1' COMMENT '狀態', 
    `date` int(10) unsigned NOT NULL default 0 COMMENT '建立日期', 
    `date_update` int(10) unsigned NOT NULL default 0 COMMENT '更新日期', 
    `count` int(10) unsigned NOT NULL default 0 COMMENT '計數', 
    PRIMARY KEY (`sn`) 
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='產品種類資料表'

/*ALTER TABLE `prods` CHANGE col_sn category varchar(10);*/

CREATE TABLE `prods_full` (
      `sn` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '房型編號', /*對應present_sn*/
      `area` int(10) NOT NULL default 0 COMMENT '房間面積',  
      `size` int(10) NOT NULL default 0 COMMENT '床型尺寸',
      `room_num` int(10) NOT NULL default 0 COMMENT '床位數量',
      `people_num` varchar(10) NOT NULL default '0' COMMENT '人數',
      `room_extra` enum('1','0') NOT NULL default '0' COMMENT '加床', 
      `enable` enum('1','0') NOT NULL default '1' COMMENT '狀態', 
      `date` int(10) unsigned NOT NULL default 0 COMMENT '建立日期', 
      `date_update` int(10) unsigned NOT NULL default 0 COMMENT '更新日期', 
      `count` int(10) unsigned NOT NULL default 0 COMMENT '計數', 
      PRIMARY KEY (`sn`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='產品詳細資料表'

CREATE TABLE `files` (
    `sn` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'files_sn',
    `kind` varchar(255) NOT NULL DEFAULT '' COMMENT '分類',
    `col_sn` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '欄位編號',
    `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
    `file_kind` enum('img','file') NOT NULL DEFAULT 'img' COMMENT '上傳檔案種類',
    `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '上傳檔案名稱',
    `file_type` varchar(255) NOT NULL DEFAULT '' COMMENT '上傳檔案類型',
    `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上傳檔案大小',
    `description` text  NULL COMMENT '檔案說明',
    `counter` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '下載人次',
    `name` varchar(255) NOT NULL DEFAULT '' COMMENT '檔案名稱',
    `download_name` varchar(255) NOT NULL DEFAULT '' COMMENT '下載檔案名稱',
    `sub_dir` varchar(255) NOT NULL DEFAULT '' COMMENT '檔案子路徑',
    PRIMARY KEY (`sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='上傳檔案資料表';


CREATE TABLE `orders_main` (
  `sn` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sn',
  `no` varchar(255) NOT NULL DEFAULT '' COMMENT '訂單編號',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `tel` varchar(255) NOT NULL DEFAULT '' COMMENT '電話',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '電子信箱',
  `ps` text DEFAULT NULL COMMENT '備註',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '會員編號',
  `date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '訂單日期',
  `total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '總計',
  `kind_sn` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT '桌號',
  PRIMARY KEY (`sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='訂單主檔';


CREATE TABLE `orders` (
  `sn` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sn',
  `orders_main_sn` int(10) unsigned NOT NULL COMMENT 'orders_main_sn',
  `prod_sn` int(10) unsigned NOT NULL COMMENT 'prod_standard_sn',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '名稱',
  `amount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '數量',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '售價',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='訂單明細檔';









