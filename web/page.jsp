<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/11
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>手动分页</title>
</head>
<body>
<c:forEach var="list" items="${list}">
    ${list.id}----
    ${list.name}----
    ${list.password}<br/>
</c:forEach>

<div style="margin-top: 15px">
    <input type="button" value="首页" onclick="beginPage();">
    <input type="button" value="上一页" onclick="frontPage();">
    <input type="button" value="下一页" onclick="nextPage();">
    <input type="button" value="尾页" onclick="endPage();">
    <br/>
    当前页数为 : <span style="color: red">${currentPage+1}</span> , 总页数 : <span style="color: red">${total+1}</span>。
    跳转到：<input style="width: 40px" id="tz" type="number" oninput="tzPage(this.value)" value=${currentPage+1}>。
    选择跳转到：
    <select onchange="goPage(this.value);">
        <c:forEach var="i" begin="0" end="${total}">
            <option value="${i}" ${i eq currentPage  ? 'selected':''}>${i+1}</option>
        </c:forEach>
    </select> 页
    选择查看：
    <select onchange="sizePage(this.value);">
        <option value="1" ${pageSize eq 1 ? 'selected':''}  ${currentPage*1 ge size ?'hidden' :'' }>1</option>
        <option value="5" ${pageSize eq 5 ? 'selected':''} ${currentPage*5 ge size ?'hidden' :'' }>5</option>
        <option value="10" ${pageSize eq 10 ? 'selected':''} ${currentPage*10 ge size ?'hidden' :'' }>10</option>
        <option value="20" ${pageSize eq 20 ? 'selected':''} ${currentPage*20 ge size ?'hidden' :'' }>20</option>
        <option value="50" ${pageSize eq 50 ? 'selected':''} ${currentPage*50 ge size ?'hidden' :'' }>50</option>
        <option value="100" ${pageSize eq 100 ? 'selected':''} ${currentPage*100 ge size ?'hidden' :'' } >100</option>
    </select> 条记录

</div>
<div style="margin-bottom: 15px">
    <form action="page" id="pageForm">
        <input type="hidden" id="currentPage" name="CurrentPage">
        <input type="hidden" id="PageSize" name="PageSize">
    </form>
</div>
<script type="text/javascript">
    function nextPage() {

        // 1.将currentPage+1
        document.getElementById("currentPage").value =${currentPage+1}>=${total}? ${total} :${currentPage+1};
        document.getElementById("PageSize").value = ${pageSize};
        // 2.将表单数据提交
        document.getElementById("pageForm").submit();
    }

    function frontPage() {

        // 1.将currentPage+1
        document.getElementById("currentPage").value =${currentPage-1 le 0 ?0:currentPage-1 };
        document.getElementById("PageSize").value = ${pageSize};
        // 2.将表单数据提交
        document.getElementById("pageForm").submit();
    }

    function goPage(val) {

        // 1.将currentPage+1
        document.getElementById("currentPage").value = val;
        document.getElementById("PageSize").value = ${pageSize};
        // 2.将表单数据提交
        document.getElementById("pageForm").submit();
    }

    function sizePage(val) {

        // 1.将currentPage+1
        document.getElementById("currentPage").value =${currentPage};
        document.getElementById("PageSize").value = val;
        // 2.将表单数据提交
        document.getElementById("pageForm").submit();
    }

    function tzPage(val) {

        // 1.将currentPage+1
        document.getElementById("currentPage").value = val - 1 >=${total} ? ${total} : val - 1 <= 0 ? 0 : val - 1;
        document.getElementById("PageSize").value = ${pageSize};
        // 2.将表单数据提交
        document.getElementById("pageForm").submit();
    }

    function beginPage() {

        // 1.将currentPage+1
        document.getElementById("currentPage").value = 0;
        document.getElementById("PageSize").value = ${pageSize};
        // 2.将表单数据提交
        document.getElementById("pageForm").submit();
    }

    function endPage() {

        // 1.将currentPage+1
        document.getElementById("currentPage").value =${total};
        document.getElementById("PageSize").value = ${pageSize};
        // 2.将表单数据提交
        document.getElementById("pageForm").submit();
    }
</script>
</body>
</html>
