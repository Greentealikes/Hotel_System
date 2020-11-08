<!--++++++++++++++++++++++++++++++++++++++++++++++
功能介紹：
此頁面為產品新增頁面
基本資料:產品圖片、名稱、英文名稱、種類(1,0)、類別、定價、內容
詳細資料(床:1):面積、尺寸、數量、入住人數、是否加床
詳細資料(其他:0):尺寸、數量
資料表:prods(存放基本資料)、prods_full(存放詳細資料)
使用套件：
          sweetalert2..彈出視窗
          ckeditor..文字編輯器
++++++++++++++++++++++++++++++++++++++++++++++++-->

<{if $book == "op_insert_form"}>  
 <div class="container mt-3">
    <h1 class="text-center">產品資料表</h1>
    <form action="userprods.php" method="post" class="mb-20" enctype="multipart/form-data">
      <div class="alert alert-success row">  
          <div class="col-sm-12">
            <h3 class="text-center">產品基本資訊</h3>
          </div>

          <div class="col-sm-4">
            <div class="form-group">
              <label>名稱</label>
              <input type="text" class="form-control" name="title" id="title" value="<{if $row}><{$row.title}><{/if}>">
            </div>
          </div>

          <div class="col-sm-4">
            <div class="form-group">
              <label>英文名稱</label>
               <input type="text" class="form-control" name="title_en" id="title_en" value="<{$row.title_en}>" >
            </div>
          </div>
        
          <div class="col-sm-4">
            <div class="form-group">
              <div class="form-group">
                <label style="display:block;">種類</label>
                <input type="radio" name="kind" id="kind_1" value="1" <{if $row.kind=='1'}>checked<{/if}>>
                <label for="kind_1" style="display:inline;">房型</label>&nbsp;&nbsp;
              
                <input type="radio" name="kind" id="kind_0" value="0" <{if $row.kind=='0'}> checked <{/if}>>
                <label for="kind_0" style="display:inline;">其他</label>
              </div>
            </div>
          </div>

          <div class="col-sm-4">
            <div class="form-group">
              <label>產品類別</label>
              <input type="text" class="form-control" name="category" id="category" value="<{$row.category}>" >
            </div>
          </div> 

          <div class="col-sm-4">
            <div class="form-group">
              <label>定價</label>
              <input type="text" class="form-control" name="price" id="price" value="<{$row.price}>" >
            </div>
          </div> 
         
          <div class="col-sm-10">
            <div class="form-group">
                <label>圖片</label><br>
                <input name="my_file" type="file" multiple />
            </div>
          </div>  
      </div>

      <div class="alert alert-warning row">
          <div class="col-sm-12">
            <h3 class="text-center">產品詳細資訊</h3>
          </div>

          <div class="col-sm-4">
            <div class="form-group">
              <label>產品編號</label>
              <input type="text" class="form-control" name="present_sn" id="present_sn" value="<{$row.present_sn}>" >
            </div>
          </div> 
          
          <div class="col-sm-4">
            <div class="form-group">
              <label>數量</label>
              <input type="text" class="form-control" name="room_num" id="room_num" value="<{$row.room_num}>" >
            </div>
          </div> 

          <div class="col-sm-4">
            <div class="form-group">
              <label>尺寸</label>
              <input type="text" class="form-control" name="size" id="size" value="<{$row.size}>" >
            </div>
          </div> 

          <div class="col-sm-12"><hr></div>

        <{if $row.kind=='1'}>
          <div class="col-sm-4 hidden_col">
            <div class="form-group">
              <label>房間面積</label>
              <input type="text" class="form-control" name="area" id="area" value="<{$row.area}>" >
            </div>
          </div> 

          <div class="col-sm-4 hidden_col">
            <div class="form-group">
              <label>入住人數</label>
              <input type="text" class="form-control" name="people_num" id="people_num" value="<{$row.people_num}>" >
            </div>
          </div> 

          <div class="col-sm-4 hidden_col">
            <div class="form-group">
              <label style="display:block;">是否加床</label>
              <input type="radio" name="room_extra" id="room_extra" value="1" <{if $row.room_extra=='1'}>checked<{/if}>>
              <label for="extra_1" style="display:inline;">加床</label>&nbsp;&nbsp;
              
              <input type="radio" name="room_extra" id="room_extra" value="0" <{if $row.room_extra=='0'}> checked <{/if}>>
              <label for="extra_0" style="display:inline;">不加床</label>
            </div>
          </div>  
          <{/if}>
      </div>


      <div class="alert row">
          <div class="col-sm-12">
            <h3 class="text-center">資料狀態</h3>
          </div>

          <div class="col-sm-4">
            <div class="form-group">
              <label>建立時間</label>
              <input type="text" class="form-control" name="date" id="date" value="<{$row.date}>" readonly>
            </div>
          </div> 

          <div class="col-sm-4">
            <div class="form-group">
              <label>更新時間</label>
              <input type="text" class="form-control" name="date_update" id="date_update" value="<{$row.date_update}>" readonly>
            </div>
          </div> 

          <div class="col-sm-3">
            <div class="form-group">
              <label style="display:block;">狀態</label>
              <input type="radio" name="enable" id="enable" value="1" <{if $row.enable=='1'}>checked<{/if}>>
              <label for="enable_1" style="display:inline;">啟用</label>&nbsp;&nbsp;
              
              <input type="radio" name="enable" id="enable" value="0" <{if $row.enable=='0'}>checked <{/if}>>
              <label for="enable_0" style="display:inline;">停用</label>
            </div>
        </div>  
      </div>

      <div class="col-sm-12">
        <div class="form-group">
        <label>房型內容</label>
        <textarea class="form-control" name="content" id="content"  placeholder="No more than 100 words."
          rows="4" cols="40" value=""><{$row.content}></textarea>        
        </div>
      </div> 

        <!-- ckeditor -->
        <script src="<{$xoAppUrl}>class/ckeditor/ckeditor.js"></script>
        <script>
              CKEDITOR.replace('content',{
                    height:200,
                    contentsCss: ['<{$xoImgUrl}>css/creative.min.css'] //引入前台樣板css
                });
        </script>         
       
        <div class="col-sm-12 text-left ">
          <input type="hidden" name="sn" value="<{$row.sn}>">        
          <input type="hidden" name="present_sn" value="<{$row.present_sn}>">
          <input type="hidden" name="book" id="book" value="prods_insert">
          <button type="submit" class="btn btn-primary">送出</button>
          <a class="btn btn-danger" href="userprods.php?book=prods_list" role="button">返回</a>
        </div>
      </div>
    </form>
  </div>
<{/if}>

<!--++++++++++++++++++++++++++++++++++++++++++++++
功能介紹：
此頁面為產品清單頁面(主要顯示:圖片、名稱、分類、定價、時間、狀態、編輯、刪除)
並使用選擇項目區分出產品類別(category)
使用套件：
          tablesorter..資料排列
          sweetalert2..彈出視窗
++++++++++++++++++++++++++++++++++++++++++++++++-->

<{if $book == "prods_list"}>
  <table class="table table-striped table-bordered table-hover table-sm tablesorter"  id="myTable" >
    <thead> 
    <tr>
      <th scope="col" style="width:100px;">圖片</th>
      <th scope="col">名稱</th>
      <th scope="col">產品種類</th>
      <th scope="col">產品類別</th>
      <th scopt="col">創立時間</th>
      <th scopt="col">更新時間</th> 
      <th scope="col">狀態</th> 
      <th scope="col" class="text-center">
          <a href="userprods.php?book=op_insert_form"><i class="fas fa-plus-square"></i>新增</a>
      </th>
    </tr>
    </thead>
    <tbody>
      <{foreach $rows as $row}>
        <tr>
            <td><img src = "<{$xoAppUrl}>uploads/img/<{$row.name}>" width=80></td>
            <td><{$row.title}></td>
            <td>
            <{if $row.kind == 1}> 房型 <{else}> 其他 <{/if}>
            </td>
            <td><{$row.category}></td>
            <td><{$row.date}></td>  
            <td><{$row.date_update}></td>
            <td><{if $row.enable}><i class="fas fa-check"></i><{/if}></td> 
            <td>
              <a href="userprods.php?book=op_insert_form&sn=<{$row.sn}>"><i class="far fa-edit"></i></a>
              <a href="javascript:void(0)" onclick="prods_delete(<{$row.sn}>,<{$row.present_sn}>);">
                <i class="far fa-trash-alt"></i>
              </a>
            </td>
        </tr>
      <{foreachelse}>
        <tr>
          <td colspan=8>目前沒有資料</td>
        </tr>
      <{/foreach}>
    </tbody>   
  </table>

<!--++++++++++++++++++++++++++++++++++++++++++++++
套件名稱：sweetalert2
用於刪除時跳出視窗，避免重要資料誤刪
++++++++++++++++++++++++++++++++++++++++++++++++-->
    <link rel="stylesheet" href="<{$xoAppUrl}>class/sweetalert2/sweetalert2.min.css">
    <script src="<{$xoAppUrl}>class/sweetalert2/sweetalert2.min.js"></script>
    <script>
        function prods_delete(sn,present_sn){
            Swal.fire({
                title: '你確定嗎？',
                text: "您將無法還原！",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '是的，刪除它！',
                cancelButtonText: '取消'
                }).then((result) => {
                if (result.value) {
                    document.location.href="userprods.php?book=prods_delete&sn="+sn+"&present_sn="+present_sn;
                }
            })
        }
    </script>
<{/if}>

<!--++++++++++++++++++++++++++++++++++++++++++++++
套件名稱：tablesorter
套用基本設定以及藍色主題css
++++++++++++++++++++++++++++++++++++++++++++++++-->

<script src='//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
<link rel="stylesheet" href="<{$xoAppUrl}>class/tablesorter/css/theme.blue.min.css"></link>
<script type="text/javascript" src="<{$xoAppUrl}>class/tablesorter/jquery.tablesorter.min.js"></script>
<script>
  $("#myTable").tablesorter({
    theme: "blue",
    widgets: ['zebra']
  });
</script>

<script>
$('[name=kind]').change(function () {
    if ($("input[name='kind']:checked").val() == 1){
      $('.hidden_col').show();
    } 
    else{
      $('.hidden_col').hide();
    }
})
</script>
