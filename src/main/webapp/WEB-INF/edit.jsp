<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <title>编辑</title>
  <script src="<%=request.getContextPath()%>/jquery.js"></script>
  <script src="<%=request.getContextPath()%>/jquery.validate.js"></script>
</head>
<body>
<script type="text/javascript">
  $(function() {
    debugger
    $("#editForm").validate({
      rules: {
        name: "required",
        price: {
          required: true
        }
      },
      messages: {
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


<form id="editForm" action="edit.do">
  <input type="hidden" name="id" value="${pro.id}"/>
  <p>name：<input type="text" name="name" value="${pro.name}" id="name"/></p>
  <p>price：<input type="text" name="price" value="${pro.price}" id="price"/></p>
  <input type="button" value="提交" onclick="edi();winclose();"/>
</form>
<script type="text/javascript">
  function edi(){
    if($("#editForm").valid()) {
      $.ajax({
        type: 'POST',
        url: 'update.do',
        data: $("#editForm").serialize(),
        success: function () {
          alert("修改成功！");
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
