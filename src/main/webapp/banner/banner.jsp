<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="app"></c:set>
<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!--页头-->
<div class="page-header" style="margin-top: -20px;">
    <h1>轮播图管理</h1>
</div>
<%--jqgrid--%>
<script>
    $(function(){
        //创建jqgrid
        $("#empTable").jqGrid({
            url:"${app}/banner/selectAll",//请求数据
            datatype:"json",//指定请求数据格式 json格式
            colNames:["编号","名称","图片","描述","状态","创建日期"],//用来指定显示表格列
            colModel:[
                {name:"id",editable:false,hidden:true},
                {name:"name",editable:true},
                {name:"cover",editable:true,edittype:"file",formatter:function (value,option,rows) {
                        return "<img style='width:100px;height:60px;' src='${app}/banner/img/"+rows.cover+"'>";
                }},
                {name:"description",editable:true},
                {name:"status",editable:true,edittype:"select",editoptions:{value:"正常:正常;冻结:冻结"}},
                {name:"createDate",formatter:"date",formatoptions:{newformat:'Y-m-d'}}
            ],//用来对当前列进行配置
            height:250,
            styleUI:"Bootstrap",//使用bootstrap样式
            autowidth:true,//自动适应父容器
            pager:"#pager",//指定分页工具栏
            rowNum:3,//每页展示2条
            rowList:[3,10,15,20],//下拉列表
            viewrecords:true,//显示总条数
            caption:"轮播图列表",
            editurl:"${app}/banner/edit",//编辑时url(保存 删除 和 修改)
        }).navGrid("#pager",{edit:true,add:true,del:true,search:false},{
            //控制修改
            closeAfterEdit:true,
            beforeShowForm:function (fmt) {
                fmt.find("#cover").attr("disabled",true);
            }
        },{
            //控制添加
            closeAfterAdd:true,
            afterSubmit:function (data) {
                console.log(data);
                var status = data.responseJSON.status;
                var id = data.responseJSON.message;
                if (status){
                    $.ajaxFileUpload({
                       url:"${app}/banner/upload",
                        type:"post",
                        fileElementId:"cover",
                        data:{id:id},
                        success:function (response) {
                            $("#empTable").trigger("reloadGrid");
                        }
                    });
                }
                return "aaaaaa";
            }
        });

    })
</script>


<!--创建表格-->
<table id="empTable"></table>

<!--分页-->
<div id="pager"></div>
