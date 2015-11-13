<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="zh-CN">
<html>
<head>
    <meta charset="utf-8">
    <title>查看</title>
    <script src="<%=request.getContextPath()%>/jquery.js"></script>
</head>
<body>
    <table border="2">
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
        </tr>
        </thead>
            <tr>
                <td>
                    ${pro.id}
                </td>
                <td>
                    ${pro.name}
                </td    >
                <td>
                    ${pro.price}
                </td>
            </tr>
        </table>
</form>
</body>
</html>
