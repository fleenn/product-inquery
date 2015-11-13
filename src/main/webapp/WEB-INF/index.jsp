<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>    </title>
    <script src="<%=request.getContextPath()%>/jquery.js"></script>
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
</head>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
           <img alt="100x200" src="<%=request.getContextPath()%>/img/2.png" class="img-rounded" />
        </div>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h1 class="panel-title">查询系统</h1>
            </div>
            <div class="panel-body">
                上架商品
            </div>
        </div>
    </div>
    <div class="preview">查询商品</div>
    <div class="view">
        <form class="form-search" id="search">
            <input class="input-medium search-query" value="${name}" type="text" name="name"id="inputSearch">
            <input type="button" id="clean" value="清空" class="btn" />
            <button type="button" class="btn"  onclick="search()">查找</button>
            <button class="btn" type="button"id="add" onClick="openwindow('next.do')">增加</button>
        </form>
    </div>

    <div class="row-fluid">
        <div class="span12">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        编号
                    </th>
                    <th>
                        产品
                    </th    >
                    <th>
                        价格
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <c:forEach items="${list}" var="Products">
                <tbody>
                <tr class="success">
                    <td>
                            ${Products.id}
                    </td>
                    <td>
                            ${Products.name}
                    </td>
                    <td>
                            ${Products.price}
                    </td>

                    <td>
                        <div class="span6">
                            <button class="btn" type="button"id="check" onClick="openwindow('view.do?id=${Products.id}')">查看</button>
                            <button class="btn" type="button" id="del" onclick="deletePro(${Products.id})">删除</button>
                            <button class="btn" type="button" onClick="openwindow('getById.do?id=${Products.id}')">修改</button>
                        </div>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    function deletePro(id) {
        if(confirm("确认删除")) {
            $.post('del.do',
                    {
                        'id': id
                    });
            search();
        }
    }
    function openwindow(page){
        window.open(page,'','top='+(screen.height-500)/2+',left='+(screen.width-800)/2+',' +
        'height=500,width=800,scrollbars=yes,status=yes,location=no')
    }

        function search() {
            document.forms[0].submit();
        }
</script>
<script type="text/javascript">
    $("#clean").click(function (){
        $("#inputSearch").val('');
    })
</script>
</html>