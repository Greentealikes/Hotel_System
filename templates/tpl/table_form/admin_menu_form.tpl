
<!--++++++++++++++++++++++++++++++++++++++++++++++
功能介紹：
此頁面為選單連結管理
管理者可登入後台
使用套件：
          tablesorter..資料排列
          sweetalert2..彈出視窗
++++++++++++++++++++++++++++++++++++++++++++++++-->

<{if $op == "op_list"}>
    <div class="row mb-2">
        <div class="cols-sm-4">
            <select name="kind" id="kind" class="form-control" onchange="location.href='?kind='+this.value">
                <option value="mainMenu" <{if $kind == "mainMenu"}>selected<{/if}> >主要選單 </option>
                <option value="secMenu" <{if $kind == "secMenu"}>selected<{/if}> >次要選單</option>
            </select>
        </div>
    </div>

  <table class="table table-striped table-bordered table-hover table-sm myTable" id="myTable">
    <thead>
    <tr>
      <th scope="col">標題</th>
      <th scope="col">網址</th>
      <th scope="col">外連</th>    
      <th scope="col">類別</th>
      <th scope="col">狀態</th>
      <th scope="col">  <a href="usermenu.php?op=op_form&kind=<{$kind}>"><i class="fas fa-plus-square"></i>新增</a></th>
    </tr>
    </thead>
    <tbody>
      <{foreach $rows as $row}>
        <tr>
          <td><{$row.title}></td>
          <td><{$row.url}></td>
          <td><{$row.target}></td>      
          <td><{$row.ofsn}></td>
          <td>          
            <{if $row.enable}><i class="fas fa-check"></i><{/if}>             
          <td>
            <a href="usermenu.php?op=op_form&kind=<{$row.kind}>&sn=<{$row.sn}>"><i class="far fa-edit"></i></a>
            <a href="javascript:void(0)" onclick="op_delete('<{$row.kind}>',<{$row.sn}>);"><i class="far fa-trash-alt"></i></a>
          </td>
        </tr>
      <{foreachelse}>
        <tr>
          <td colspan=6>目前沒有資料</td>
        </tr>
      <{/foreach}>
    </tbody>
  </table>

 <!-- sweetalert2 -->
    <link rel="stylesheet" href="<{$xoAppUrl}>class/sweetalert2/sweetalert2.min.css">
    <script src="<{$xoAppUrl}>class/sweetalert2/sweetalert2.min.js"></script>
    <script>
        function op_delete(kind,sn){
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
                    document.location.href="usermenu.php?op=op_delete&kind=" + kind + "&sn="+sn;
                }
            })
        }
    </script>
<{/if}>

<!--++++++++++++++++++++++++++++++++++++++++++++++
功能介紹：
此頁面為管理者連結新增、更新頁面
使用套件：
          tablesorter..資料排列
          sweetalert2..彈出視窗
++++++++++++++++++++++++++++++++++++++++++++++++-->

<{if $op == "op_form"}>  
    <div class="container">        
        <form action="usermenu.php" method="post" id="myForm" class="mb-2" enctype="multipart/form-data">
            <!-- 	 						 -->
            <div class="row">         
                <!--標題-->              
                <div class="col-sm-12">
                    <div class="form-group">
                        <label>標題<span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="title" id="title" value="<{$row.title}>" >
                    </div>
                </div>          
                <!--網址-->              
                <div class="col-sm-12">
                    <div class="form-group">
                        <label>網址<span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="url" id="url" value="<{$row.url}>" >
                    </div>
                </div>
              
               <!--類別-->              
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>類別</label>
                        <input type="text" class="form-control text-right" name="ofsn" id="ofsn" value="<{$row.ofsn}>">
                    </div>
                </div>

                 <!--排序-->              
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>排序</label>
                        <input type="text" class="form-control text-right" name="sort" id="sort" value="<{$row.sort}>">
                    </div>
                </div>

                 <!-- 外連狀態  -->
                <div class="col-sm-3">
                    <div class="form-group">
                        <label style="display:block;">外連狀態</label>
                        <input type="radio" name="target" id="target_1" value="1" <{if $row.target=='1'}>checked<{/if}>>
                        <label for="target_1" style="display:inline;">啟用</label>&nbsp;&nbsp;
                        <input type="radio" name="target" id="target_0" value="0" <{if $row.target=='0'}>checked<{/if}>>
                        <label for="target_0" style="display:inline;">停用</label>
                    </div>
                </div> 

                <!--選單狀態  -->
                <div class="col-sm-3">
                    <div class="form-group">
                        <label style="display:block;">選單狀態</label>
                        <input type="radio" name="enable" id="enable_1" value="1" <{if $row.enable=='1'}>checked<{/if}>>
                        <label for="enable_1" style="display:inline;">啟用</label>&nbsp;&nbsp;
                        <input type="radio" name="enable" id="enable_0" value="0" <{if $row.enable=='0'}>checked<{/if}>>
                        <label for="enable_0" style="display:inline;">停用</label>
                    </div>
                </div>  
            </div>
            
            <div class="text-center pb-20">
            <input type="hidden" name="op" value="<{$row.op}>">
            <input type="hidden" name="sn" value="<{$row.sn}>">
            <input type="hidden" name="kind" value="<{$row.kind}>">
            <button type="submit" class="btn btn-primary">送出</button>
            </div>
        
        </form>
        <!-- 表單驗證 -->
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
        <!-- 調用方法 -->
        <style>
            .error{
            color:red;
            }
        </style>
        <script>
            $(function(){
                $("#myForm").validate({
                    submitHandler: function(form) {
                        form.submit();
                    },
                    rules: {
                        'title' : {
                            required: true
                        },
                        'url' : {
                            required: true
                        }
                    },
                    messages: {
                        'title' : {
                            required: "必填"
                        },
                        'url' : {
                            required: "必填"
                        }

                    }
                });

            });
        </script>
    </div>

<{/if}>
