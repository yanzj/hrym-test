<%--suppress ALL --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>数据列表</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/easyui/easyui.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/view/easyui/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/view/easyui/jquery.easyui.min.js"></script>
    <link href="${pageContext.request.contextPath}/view/static/assets/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/view/static/assets/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/view/static/assets/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/view/static/assets/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/view/static/assets/css/style.css?v=4.1.0" rel="stylesheet">

    <style>
        table{
            width:100px;
            table-layout:fixed;/* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */
        }
        td{
            width:100%;
            white-space:nowrap;/* 不换行 */
            overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
            /*text-overflow:ellipsis;!* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用*!*/
        }
        .table td:hover{
            overflow:hidden;/* 内容超出宽度时隐藏超出部分的内容 */
            overflow: scroll;   /* 滚动条*/
            overflow: auto;
            white-space: nowrap;
            height: 10px;
        }
        .itemPic_itemPic{
            width: 100px;
            height: 50px;
        }

    </style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox ">
                <div class="ibox-title">
                    <h5>数据管理</h5>
                </div>
                <div class="ibox-content">
                    <div class="row row-lg">
                        <div class="col-sm-12">
                            <!-- Example Card View -->
                            <div class="example-wrap">
                                <div class="example">
                                    <table id="table_list"></table>
                                </div>
                            </div>
                            <!-- End Example Card View -->
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>


<!-- 全局js -->
<script src="${pageContext.request.contextPath}/view/static/assets/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/view/static/assets/js/bootstrap.min.js?v=3.3.6"></script>


<!-- Bootstrap table -->
<script src="${pageContext.request.contextPath}/view/static/assets/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/view/static/assets/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="${pageContext.request.contextPath}/view/static/assets/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

<!-- Peity -->
<script src="${pageContext.request.contextPath}/view/static/assets/js/plugins/peity/jquery.peity.min.js"></script>

<script src="${pageContext.request.contextPath}/view/static/assets/js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="${pageContext.request.contextPath}/view/static/assets/js/content.js?v=1.0.0"></script>
<script src="${pageContext.request.contextPath}/view/static/assets/js/plugins/layer/laydate/laydate.js"></script>


<!-- Page-Level Scripts -->
<script>
    $(document).ready(function () {
        //初始化表格,动态从服务器加载数据
        $("#table_list").bootstrapTable({
            //使用get请求到服务器获取数据
            type: "POST",
            //必须设置，不然request.getParameter获取不到请求参数
            contentType: "application/json",
            //获取数据的Servlet地址
            url: "${pageContext.request.contextPath}/admin/findUserDataTable",
            //表格显示条纹
            striped: true,
            //启动分页
            pagination: true,
            //每页显示的记录数
            pageSize: 10,
            //当前第几页
            pageNumber: 1,
            //记录数可选列表
            pageList: [5, 10, 15, 20, 25],
            //是否启用查询
            search: false,
            showColumns: true, //是否显示所有的列
            showToggle:true, //是否显示详细视图和列表视图的切换按钮
            cardView: false, //是否显示详细视图
            //是否启用详细信息视图
            detailView:false,
//            detailFormatter:detailFormatter,
            //表示服务端请求
            sidePagination: "server",
            //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder
            //设置为limit可以获取limit, offset, search, sort, order
            queryParamsType: "undefined",
            //json数据解析
            responseHandler: function(res) {
                return {
                    "rows": res.rows,
                    "total": res.total
                };
            },
            //数据列
            columns: [{
                title: "日期",
                field: "tableName"
            },{
                title: "日活量",
                field: "count",
                formatter: function (value) {
                        return value
                }
            },{
                title: "注册量",
                field: "Tcount"
            },{
                title: "ios注册量",
                field: "iosCount"
            },{
                title: "安卓注册量",
                field: "andCount"
            },{
                title: "新增注册数",
                field: "newRegistNumber"
            },{
                title: "iOS新增注册数",
                field: "iosNewRegistNumber",
                width:120
            },{
                title: "and新增注册数",
                field: "andNewRegistNumber",
                width:120
            },{
                title: "安卓日活量",
                field: "androidDayCount"
            },{
                title: "ios日活量",
                field: "iosDayCount"
            },{
                title:"操作",
                field:"tableName",
                formatter: function (value, row, index) {
                    var operateHtml = '<button class="btn btn-primary btn-xs" type="button" onclick="showData(\''+row.tableName+'\')"><i class="fa fa-edit"></i>&nbsp;详情</button> &nbsp;';
                     return operateHtml;
                }
            }],
            //注册加载子表的事件。注意下这里的三个参数！
            onExpandRow: function (index, row, $detail) {
                InitSubTable(index, row, $detail);
            }
        });
    });
    function detailFormatter(index, row) {

        var html = [];
        html.push('<p><b>描述:</b> ' + row.id + '</p>');
        return html.join('');
    }

    //表数据传值
    function showData(tableName) {
        var tableName ="user_data_"+tableName;
        window.location='${pageContext.request.contextPath}/admin/findAlldiurnalData?tableName='+tableName;

    }


    //        名称搜索
    function eventquery() {
        var itemName = $('#itemName').val();
        $('#table_list').bootstrapTable('refresh', { url: '${pageContext.request.contextPath}/admin/searchItem?itemName='+encodeURI(encodeURI(itemName,"UTF-8"))});
    }

    //        重置搜索
    function reset() {
        var itemName = $('#itemName').val('');
        $('#table_list').bootstrapTable('refresh', { url: '${pageContext.request.contextPath}/admin/searchItem'});
    }

</script>
</body>

</html>