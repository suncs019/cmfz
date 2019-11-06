<%@page pageEncoding="UTF-8"  contentType="text/html; UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#startable").jqGrid({
            url:"${pageContext.request.contentType}/star/selectAll",
            datatype:"json",
            height:300,
            colNames:[ '编号', '艺名', '真名', '照片', '性别', '生日' ],
            colModel : [
                {name : 'id',hidden:true,editable:false},
                {name : 'nickname',editable:true},
                {name : 'realname',editable:true},
                {name : 'photo',editable:true,edittype:"file",formatter:function (value,option,rows) {
                        return "<img style='width:100px;height:70px' src='${pageContext.request.contextPath}/star/img/"+rows.photo+"'>";
                    }},
                {name : 'sex',editable:true,edittype:"select",editoptions:{value:"男:男;女:女"}},
                {name : 'bir',formatter:"date",formatoptions:{newformat:'Y-m-d'}}
            ],
            styleUI:'Bootstrap',
            autowidth:true,
            rowNum : 3,
            rowList : [ 3, 5, 10],
            pager : '#page',
            viewrecords : true,
            subGrid : true,
            caption : "所有明星列表",
           editurl:"${pageContext.request.contentType}/star/edit",//编辑时url(保存 删除 和 修改)
            subGridRowExpanded : function(subgrid_id, id) {
                var subgrid_table_id, pager_id;
                subgrid_table_id = subgrid_id + "_t";
                pager_id = "p_" + subgrid_table_id;
                $("#" + subgrid_id).html(
                    "<table id='" + subgrid_table_id  +"' class='scroll'></table>" +
                    "<div id='" + pager_id + "' class='scroll'></div>");
                $("#" + subgrid_table_id).jqGrid(
                    {
                        url : "${pageContext.request.contextPath}/user/selectUsersByStarId?starId=" + id,
                        datatype : "json",
                        colNames : [ '编号', '用户名', '昵称', '头像','电话', '性别','地址','签名' ],
                        colModel : [
                            {name : "id"},
                            {name : "username"},
                            {name : "nickname"},
                            {name : "photo",formatter:function (value,option,rows) {
                                    return "<img style='width:100px;height:70px' src='${pageContext.request.contextPath}/star/img/"+rows.photo+"'>";
                                }},
                            {name : "phone"},
                            {name : "sex"},
                            {name : "address"},
                            {name : "sign"}
                        ],
                        styleUI:"Bootstrap",
                        rowNum : 2,
                        pager : pager_id,
                        autowidth:true,
                        height : '100%'
                    });
                jQuery("#" + subgrid_table_id).jqGrid('navGrid',
                    "#" + pager_id, {
                        edit : false,
                        add : false,
                        del : false,
                        search:false
                    });
            },

        }).jqGrid('navGrid', '#page', {add : true, edit : false, del : false, search:false},{},
       {
          //控制添加
          closeAfterAdd:true,
          afterSubmit:function (data) {
             console.log(data);
             var status = data.responseJSON.status;
             var  id = data.responseJSON.message;
             if (status){
                $.ajaxFileUpload({
                   url:"${pageContext.request.contentType}/star/upload",
                   type:"post",
                   fileElementId:"photo",
                   data:{id:id},
                   success:function (response) {
                      $("#startable").trigger("reloadGrid");
                   }
                });
             }
             return "ahfasuf";
          }
       });
    })

</script>
<div>
   <h3>展示所有mingxing</h3>
</div>
<table id="startable"></table>
<div id="page" style="height:40px"></div>