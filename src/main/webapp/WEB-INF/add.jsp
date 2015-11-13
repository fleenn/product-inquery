<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>添加</title>
    <script src="<%=request.getContextPath()%>/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/jquery.validate.js"></script>
</head>
<body>
<script type="text/javascript">
    $(function() {
        debugger
        $("#addForm").validate({
            rules: {
                id: {
                    required: true,
                    digits:true
                },
                name: "required",
                price: {
                    required: true
                }
            },
            messages: {
                id: {
                    required: "请输入id！",
                    digits: "必须为整数！"
                },
                name: {
                    required: "请输name!"
                },
                price: {
                    required: "请输price!"
                }
            }
        });
    });
</script>

<form id="addForm" action="/add.do">
  <p>id：<input type="text" name="id" id="id" value=""/></p>
  <p>name：<input type="text" name="name" id="name" value=""/></p>
  <p>price：<input type="text" name="price" id="price" value=""/><br/></p>
  <input type="button" value="提交" onclick="add();winclose()"/>
</form>

<script type="text/javascript">
    function add(){
        if($("#addForm").valid()) {
            $.ajax({
                type: 'POST',
                url: 'add.do',
                data: $("#addForm").serialize(),
                success: function() {
                    alert("添加成功！")
                }
            });
        }
    }
    function winclose() {
        window.opener.location.reload();
        window.close();
    }
</script>
</body>
</html>
