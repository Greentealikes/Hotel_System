<?php
/*--++++++++++++++++++++++++++++++++++++++++++ 
class .. reservation_status
預約系統問題狀況回報
++++++++++++++++++++++++++++++++++++++++++--*/ 
class reservation_status{
    
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

/*--++++++++++++++++++++++++++++++++++++++++++ 
class .. Page_attr
頁面屬性
++++++++++++++++++++++++++++++++++++++++++--*/

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


/*--++++++++++++++++++++++++++++++++++++++++++ 
class .. Error_status
錯誤狀況回報，如發生錯誤則返回
++++++++++++++++++++++++++++++++++++++++++--*/
class Error_status{
    public $error_no = "無異常錯誤";
    public $err_date = "輸入日期錯誤";
    public $err_numlimit = "人數限制";
    public $err_dataduplicate = "資料重複";
    public $err_bookfail = "預定失敗";

    public function geterrorcode($error = null){
        if($error == $this->err_dataduplicate)
            return 1;
        else if($error == $this->err_date)
            return 2;
        else if($error == $this->err_numlimit)
            return 3;
        else if($error == $this->err_bookfail)
            return -1;
        return 0;
    }
}

/*--++++++++++++++++++++++++++++++++++++++++++ 
class .. Post_date
前端json紀錄
++++++++++++++++++++++++++++++++++++++++++--*/
/*
class Post_date{
    
    protected $post_datein = "";
    protected $post_dateout = "";
    protected $post_title = "";
    protected $post_category = "";
    protected $post_num = "";
    protected $post_price = "";
    protected $post_roomextra = "";
    protected $post_roomnum = "";
    protected $post_roomsum = "";

    public function setpostdate(array $data) 
    {
        $this->post_datein = $data['post_datein'];
        $this->post_dateout = $data['post_dateout'];
        $this->post_title = $data['post_title'];
        $this->post_category = $data['post_category'];
        $this->post_num = $data['post_num'];
        $this->post_price = $data['post_price'];
        $this->post_roomextra = $data['post_roomextra'];
        $this->post_roomsum = $data['post_roomsum'];
    }
    public function getdatein() 
    {
        return $this->post_datein;
    }

    public function getdateout() 
    {
        return $this->post_dateout;
    }

    public function gettitle() 
    {
        return $this->post_title;
    }

    public function getcategory() 
    {
        return $this->post_category;
    }

    public function getpostnum() 
    {
        return $this->post_num;
    }

    public function getprice() 
    {
        return $this->post_price;
    }

    public function getroomextra() 
    {
        return $this->post_roomextra;
    }

    public function getroomsum() 
    {
        return $this->post_roomsum;
    }

    public function jsonSerialize() 
    {
        return 
        [
            'post_datein'=>$this->getdatein(),
            'post_dateout'=>$this->getdateout(),
            'post_title'=> $this->gettitle(),
            'post_category'=> $this->getcategory(),
            'post_num'=> $this->getpostnum(),
            'post_price'=> $this->getprice(),
            'post_roomextra'=> $this->getroomextra(),
            'post_roomsum'=> $this->getroomsum()
        ];
    }
}*/