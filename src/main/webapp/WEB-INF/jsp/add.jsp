<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xiana
  Date: 2019/9/26
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container-fluid">
        <h2 class="text-center">添加商品</h2>

        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <form action="${pageContext.request.contextPath}/good/addgood" method="post" enctype="multipart/form-data">
                    <div>
                    <div><input type="hidden" name="goodid" class="form-control" placeholder="商品id"></div>
                    <div class="form-inline" style="margin-top: 30px">名称:<input type="text" name="gname" class="form-control" placeholder="商品名称"></div>
                    <div class="form-inline mt-3" style="margin-top: 15px">原价：<input type="number" name="price" class="form-control" placeholder="原价"></div>
                    <div class="form-inline mt-3" style="margin-top: 15px">现价：<input type="number" name="nowprice" class="form-control" placeholder="现价"></div>
                    <div class="form-inline mt-3" style="margin-top: 15px">商品种类：
                    <select class="form-control" name="category">
                        <c:forEach items="${categories}" var="c">
                            <option value="${c.catename}">${c.catename}</option>
                        </c:forEach>
                    </select>
                    </div>
                    <div class="form-inline mt-3" style="margin-top: 15px">生产日期：<input type="date" name="createdate" class="form-control" placeholder="生产日期"></div>
                    <div class="form-inline mt-3" style="margin-top: 15px">库存：<input type="number" name="count" class="form-control" placeholder="库存"></div>
                    <div class="form-inline mt-3" style="margin-top: 15px">生产地：<input type="text" name="address" class="form-control" placeholder="生产地"></div>
                    <div class="form-inline mt-3" style="margin-top: 15px">状态<input class="radio-inline" type="radio" name="state"  value="1" checked style="margin-left: 10px">上架
                    <input class="radio-inline" type="radio" name="state"  value="0">下架</div>
                    <div class="form-inline mt-3" style="margin-top: 15px">上传图片<input type="file" name="uploadImg"/></div>
                    <button class="btn btn-success" style="margin-top: 15px" type="submit">保 存</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
