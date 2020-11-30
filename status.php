<?php
/*--++++++++++++++++++++++++++++++++++++++++++ 
Erstatus：預約系統狀況，應用於Onbooking.php
Page_attr：頁面屬性
++++++++++++++++++++++++++++++++++++++++++--*/ 

#class .. reservation_status->Erstatus：系統失敗狀況，應用於Onbooking.php
class Erstatus{
    
    //預約失敗狀況代碼
    public $fail1_samedata = 1;
    public $fail1_inmothout = 2;
    public $fail1_wrongformat = 3;
    public $fail1_otherr = 4;

    public function getreservation_statustext($err=null){
        if($err == $this->fail1_samedata)
            return "線上預訂失敗\\n(已存在相同資料)";
        else if($err == $this->fail1_inmothout)
            return "線上預訂失敗\\n(入住時間不得大於退房時間)";
        else if($err == $this->fail1_wrongformat)
            return "線上預訂失敗\\n(預定人數格式錯誤)";
        else if($err == $this->fail1_otherr)
            return "線上預訂失敗";
    }
}

#class .. Page_attr 預約系統_頁面
class Page_attr{
    //填寫時間頁面
    public $Page_date = "Page_date";
    //預約介紹頁面 
    public $Page_descrion = "Page_descrion";
    //填入聯絡資訊
    public $Page_connection = "Page_connection";
    //選擇付款方式
    public $Page_payment = "Page_payment";
    //完成表單頁面
    public $Page_success = "Page_success";
    //寄信表示完成
    public $Page_send = "Page_send";
    //查詢表單頁面
    public $Page_query = "Page_query";

    public function getPageNum($Page=null){
        if($Page == $this->Page_descrion)
            return 1;
        else if($Page == $this->Page_date)
            return 2;
        else if($Page == $this->Page_connection)
            return 3;
        else if($Page == $this->Page_payment)
            return 4;
        else if($Page == $this->Page_success)
            return 5;
        else if($Page == $this->Page_send)
            return 6;
    }
}

#class.. Snstatus 跳轉畫面詞語 
class Snstatus{
    public $sn_success = "登入成功";
    public $sn_error = "登入失敗";
    public $sn_logout = "登出成功";

    public function getsnstatus($status=null){
      if($status == $this->sn_error)
        return 0;
      return 1;
    }
  }

#class.. PCRE_check 正規表達驗證 適用於Onbooking.php?book=Page_connection
class PCRE_check{
    public $check_name = "";
    public $check_number = "^[0-9]*[1-9][0-9]*$";
    public $check_time = "";

    public function check_phone($phone) {
        $preg_phone = '^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$';
        if(preg_match($preg_phone,$phone))
            return true;
        return false;
    }

    public function check_email($email) {
        $preg_email= '^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
        if(preg_match($preg_email,$email))
            return true;
        return false;
    }

    public function checkId($id) {
        // 去空白&轉大寫
        $id = strtoupper(trim($id));

        // 英文字母與數值對照表
        $alphabetTable = [
            'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15, 'G' => 16,
            'H' => 17, 'I' => 34, 'J' => 18, 'K' => 19, 'L' => 20, 'M' => 21, 'N' => 22,
            'O' => 35, 'P' => 23, 'Q' => 24, 'R' => 25, 'S' => 26, 'T' => 27, 'U' => 28,
            'V' => 29, 'X' => 30, 'Y' => 31, 'Z' => 33
        ];

        // 檢查身份證字號格式
        // ps. 第二碼的例外條件ABCD，在這裡未實作，僅提供需要的人參考，實作方式是A對應10，只取個位數0去加權即可
        // 臺灣地區無戶籍國民、大陸地區人民、港澳居民：
        // 男性使用A、女性使用B
        // 外國人：
        // 男性使用C、女性使用D
        if (!preg_match("/^[A-Z]{1}[12ABCD]{1}[0-9]{8}$/", $id)){
            // ^ 是開始符號
            // $ 是結束符號
            // [] 中括號內是正則條件
            // {} 是要重複執行幾次
            throw new Exception('格式、長度錯誤'); 
        }

        // 切開字串
        $idArray = str_split($id);

        // 英文字母加權數值
        $alphabet = $alphabetTable[$idArray[0]];
        $point = substr($alphabet, 0, 1) * 1 + substr($alphabet, 1, 1) * 9;

        // 數字部分加權數值
        for ($i = 1; $i <= 8; $i++) {
            $point += $idArray[$i] * (9 - $i);
        }
        $point = $point + $idArray[9];

        return $point % 10 == 0 ? true : false;
    }

}