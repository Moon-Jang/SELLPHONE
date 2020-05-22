<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 목록</title>
</head>
<body>

<table border="10">
	<tr>
		<td colspan="12"><a href="write.do">[상품등록하기]</a></td>
	</tr>
	<tr>
			<td>상품번호</td>
			<td>판매자아이디</td>
			<td>상품 이름</td>
			<td>상품 설명</td>
			<td>상품 이미지</td>
			<td>상품 가격</td>
			<td>상품 상태</td>
			<td>상품 등록일자</td>
			<td>상품 저장공간</td>
			<td>상품색상 코드</td>
	</tr>
<c:if test="${ProductPage.hasNoProducts()}"><!-- 데이터가 없을시에-->
	<tr>
		<td colspan="12">상품이 없습니다.</td>
	</tr>
</c:if>
<c:forEach var="Product" items="${ProductPage.content}"> <!-- Has no Product page -->
	<tr>
		<td>${Product.number}</td> <!--상품번호-->
		<td>${Product.writer.name}</td> <!--판매자 아이디-->
        <td>${Product.writer.name}</td> <!--상품 이름-->
        <td>${Product.writer.name}</td> <!--상품 설명-->
        <td>${Product.writer.name}</td> <!--상품 이미지-->
        <td>${Product.writer.name}</td> <!--상품 가격-->
        <td>${Product.writer.name}</td> <!--상품 상태-->
        <td>${Product.writer.name}</td> <!--상품 등록일자-->
        <td>${Product.writer.name}</td> <!--상품 저장공간-->
        <td>${Product.writer.name}</td> <!--상품색상 코드-->

       
        

	</tr>
</c:forEach>
<c:if test="${ProductPage.hasProducts()}">
	<tr>
		<td colspan="4">
			<c:if test="${ProductPage.startPage > 5}">
			<a href="list.do?pageNo=${ProductPage.startPage - 5}">[이전]</a>
			</c:if>
			<c:forEach var="pNo" 
					   begin="${ProductPage.startPage}" 
					   end="${ProductPage.endPage}">
			<a href="list.do?pageNo=${pNo}">[${pNo}]</a>
			</c:forEach>
			<c:if test="${ProductPage.endPage < ProductPage.totalPages}">
			<a href="list.do?pageNo=${ProductPage.startPage + 5}">[다음]</a>
			</c:if>
		</td>
	</tr>
</c:if>
</table>
</body>
</html>