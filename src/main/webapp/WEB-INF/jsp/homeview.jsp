<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: xiana
  Date: 2019/9/26
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container-fluid">
        <%--标题--%>
        <div class="row">
            <h2 class="text-center">商品列表</h2>
        </div>

        <%--搜索 --%>
        <div class="row">
            <div class="col-md-8 col-md-offset-1">
                    <form class="form-inline" method="post" action="#" name="frm">

                    <input type="hidden" name="pageNow" value="1" id="pageNow"/>

                    名称：<input type="text" class="form-control" name="gname" value="${qv.gname}" placeholder="商品名称"/>
                    类型：<select class="form-control" name="category">
                    <option value="0">===请选择===</option>
                    <c:forEach items="${categories}" var="c">
                        <option value="${c.catename}" <c:if test="${qv.category==c.catename}">selected</c:if>>${c.catename}</option>
                    </c:forEach>
                    </select>
                    状态：<select class="form-control" name="state">
                    <option value="">==请选择==</option>
                    <option value="1" <c:if test="${qv.state=='1'}">selected</c:if> >上架</option>
                    <option value="0" <c:if test="${qv.state=='0'}">selected</c:if> >下架</option>
                    </select>
                    <button class="btn btn-warning" onclick="search();">搜索</button>

                </form>
            </div>
        </div>

        <%--添加商品--%>
            <div class="row">
                <div class="col-md-4 col-md-offset-7">
                    <div style="float: right">
                        <a class="btn btn-success" style="margin-bottom: 10px" href="${pageContext.request.contextPath}/home/toadd">添加</a>
                        <button class="btn btn-danger" style="margin-bottom: 10px" onclick="delgoods();">批量删除</button>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>

        <%--显示商品--%>
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <table class="table table-hover">
                    <%--表头--%>
                        <tr>
                            <th>
                                <input type="checkbox" id="flag">
                            </th>
                            <th>编号</th>
                            <th>名称</th>
                            <th>图片</th>
                            <th>原价</th>
                            <th>现价</th>
                            <th>生产日期</th>
                            <th>生产地</th>
                            <th>库存</th>
                            <th>类型</th>
                            <th>状态</th>
                            <th>
                                操作
                            </th>
                        </tr>

                        <c:forEach items="${pageInfo.list}" var="g">
                            <tr>
                                <th>
                                    <input type="checkbox" name="flag" value="${g.goodid}">
                                </th>
                                <th>${g.goodid}</th>
                                <th>${g.gname}</th>
                                <th><img style="width: 80px" src="${pageContext.request.contextPath}/images/${g.goodimg}" title="图片" alt="未上传图片"></th>
                                <th>${g.price}</th>
                                <th>${g.nowprice}</th>
                                <th><fmt:formatDate value="${g.createdate}" pattern="yyyy-MM-dd"></fmt:formatDate></th>
                                <th>${g.address}</th>
                                <th>${g.count}</th>
                                <th>${g.category}</th>
                                <th><c:if test="${g.state==1}">上架</c:if>
                                    <c:if test="${g.state==0}">下架</c:if></th>
                                <th>
                                    <a class="btn btn-sm btn-success" href="${pageContext.request.contextPath}/home/toupdate?goodid=${g.goodid}">修改</a>
                                    <a class="btn btn-sm btn-danger" href="${pageContext.request.contextPath}/good/delgood?goodid=${g.goodid}">删除</a>
                                </th>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>




        <%--分页栏--%>
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="form-inline">
                    <div>当前页：${pageInfo.pageNum}/${pageInfo.pages}          共：${pageInfo.total}条</div>

                    <div>
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li <c:if test="${pageInfo.isFirstPage}">class="disabled"</c:if>>
                                    <span onclick="page(1)" aria-label="Previous" }> >首页</span>
                                </li>
                                <li <c:if test="${pageInfo.isFirstPage}">class="disabled"</c:if>>
                                    <span onclick="page(${pageInfo.prePage})" aria-label="Previous">&laquo;</span>
                                </li>

                                <c:forEach var="i" items="${pageInfo.navigatepageNums}">
                                    <c:if test="${pageInfo.pageNum == i}">
                                        <li class="active">
                                            <span style="cursor: pointer" onclick="page(${i})">${i}</span>
                                        </li>
                                    </c:if>
                                    <c:if test="${pageInfo.pageNum != i}">
                                        <li>
                                            <span style="cursor: pointer" onclick="page(${i})">${i}</span>

                                        </li>
                                    </c:if>
                                </c:forEach>

                                <li <c:if test="${pageInfo.isLastPage}">class="disabled"</c:if>>
                                    <span aria-label="Next" onclick="page(${pageInfo.nextPage})">&raquo;</span>

                                </li>
                                <li <c:if test="${pageInfo.isLastPage}">class="disabled"</c:if>>
                                    <span aria-label="Previous" onclick="page(${pageInfo.pages})">尾页</span>

                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function page(i){
            $("#pageNow").val(i);
            //提交表单时知道当前页
            document.frm.submit();
        }

        function search(){
            $("#pageNow").val(1);
            //搜索时当前页从第一页开始
            document.frm.submit();
        }
        
        $("#flag").click(function () {
            $("input[name=flag]").prop("checked",$(this).prop("checked"))
        })

        function delgoods(){
            if (!(confirm("确认要删除吗？"))){
                return;
            }
            var checks=$("input[name=flag]:checked");
            if(checks.length<1){
                alert("请至少选择一个商品");
                return;
            }
            var ids="";
            checks.each(function () {
                ids+=","+this.value;
            })
            ids=ids.substring(1);
            alert(ids);
            $.post(
                "${pageContext.request.contextPath}/good/delsomegoods",{
                    ids:ids,
                },function(data){
                    alert("删除成功")
                }
            )
        }


    </script>
</body>
</html>
