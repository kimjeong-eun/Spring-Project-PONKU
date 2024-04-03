<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<style>
/* 페이지네이션 컨테이너 스타일 */
.pagination-container {
   display: flex;
   justify-content: center;
   margin-top: 30px;
   margin-bottom: 20px;
}

/* 페이지네이션 스타일 */
.pagination {
   display: flex;
   list-style: none;
}

/* 페이지네이션 아이템 스타일 */
.pagination li {
   margin-right: 5px;
}

/* 페이지네이션 링크 스타일 */
.pagination li a {
   padding: 5px 10px;
   text-decoration: none;
   border: 1px solid #ccc;
   color: #333;
}

/* 활성화된 페이지네이션 링크 스타일 */
.pagination li.active a {
   background-color: #000;
   color: #fff;
   border-color: #000;
}
#regBtn {
    position: relative;
    bottom: 10px; 			/* 하단 여백 조정 */
    right: 10px; 			/* 우측 여백 조정 */
    padding: 5px 10px; 		/* 내부 여백 조정 */
    font-size: 14px; 		/* 글꼴 크기 조정 */
    border: 1px solid #ccc; /* 테두리 스타일 */
    border-radius: 5px; 	/* 테두리의 모서리 둥글기 조정 */
    background-color: #f8f9fa; /* 배경색 지정 */
    color: #333; 			/* 글꼴 색상 지정 */
    cursor: pointer; 		/* 커서 타입 지정 */
    transition: background-color 0.3s, color 0.3s; /* hover 효과를 위한 transition 설정 */
}

#regBtn:hover {
    background-color: #007bff; /* hover 시 배경색 변경 */
    color: #fff; /* hover 시 글꼴 색상 변경 */
}
/* 입력 필드 스타일 */
input[type='text'] {
    padding: 8px; /* 내부 여백 */
    border: 1px solid #ccc; /* 테두리 스타일 */
    border-radius: 5px; /* 테두리의 모서리 둥글기 */
    font-size: 14px; /* 글꼴 크기 */
}

/* 버튼 스타일 */
button {
    padding: 8px 16px; /* 내부 여백 */
    background-color: #ccc; /* 배경색 */
    color: #fff; /* 글꼴 색상 */
    border: 1px solid #888; /* 테두리 스타일 */
    border-radius: 5px; /* 테두리의 모서리 둥글기 */
    cursor: pointer; /* 마우스 커서 타입 */
    transition: background-color 0.3s, color 0.3s; /* hover 효과를 위한 transition 설정 */
}

button:hover {
    background-color: #888; /* hover 시 배경색 변경 */
}


/* 셀렉트 박스 스타일 */
select {
    padding: 8px; /* 내부 여백 */
    border: 1px solid #ccc; /* 테두리 스타일 */
    border-radius: 5px; /* 테두리의 모서리 둥글기 */
    font-size: 14px; /* 글꼴 크기 */
}

/* 선택된 옵션 스타일 */
select option[selected] {
    background-color: #007bff; /* 선택된 옵션 배경색 */
    color: #fff; /* 선택된 옵션 글꼴 색상 */
}

</style>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default" style="text-align: right; position: relative;">
            <div class="panel-heading">
           <button id='regBtn' type="button" class="btn btn-xs" style="position: absolute; bottom: 0; right: 0;">리뷰 등록</button>
            </div>
        </div>
    </div>
</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>리뷰번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>

          <c:forEach items="${list}" var="board">
            <tr>
              <td><c:out value="${board.bno}" /></td>
               <td>
                  <a class='move' href='<c:out value="${board.bno}"/>'>
                  <c:out value="${board.title}" />   <b>  
                  [<c:out value="${board.replycnt}" />  ]</b>
                  </a>
              <td><c:out value="${board.writer}" /></td>
              <td><fmt:formatDate pattern="yyyy-MM-dd"
                  value="${board.regdate}" /></td>
              <td><fmt:formatDate pattern="yyyy-MM-dd"
                  value="${board.updatedate}" /></td>
            </tr>
          </c:forEach>

				</table>

				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/review/list" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
							</select> 
							<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
							<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>검색</button>
						</form>
					</div>
				</div>


	<div class="text-center">
		<div class="pagination-container">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a
						href="${pageMaker.startPage -1}">Previous</a></li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="paginate_button"><a href="${ num }">${num}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="${pageMaker.endPage +1 }">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>

	<!--  end Pagination -->
			</div>

			<form id='actionForm' action="/review/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

				<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
				<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>

			</form>


			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary">저장</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->


<script type="text/javascript">
	$(document).ready(
		function() {
		var result = '<c:out value="${result}"/>';
			
		checkModal(result);

		history.replaceState({}, null, null);

			function checkModal(result) {
				if (result === '' || history.state) {
								return;
				}if (parseInt(result) > 0) {
					$(".modal-body").html(
					"게시글 " + parseInt(result) + " 번이 등록되었습니다.");
							}
				$("#myModal").modal("show");
						}
				$("#regBtn").on("click", function() {
					
					self.location = "/review/register";

						});

						var actionForm = $("#actionForm");

						$(".paginate_button a").on("click", function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move").on("click",
						function(e) {

								e.preventDefault();
					actionForm.append("<input type='hidden' name='bno' value='"
					+ $(this).attr("href") + "'>");
						actionForm.attr("action", "/review/get");
								actionForm.submit();
								});

						var searchForm = $("#searchForm");

						$("#searchForm button").on("click",
							function(e) {

							if (!searchForm.find("option:selected").val()) {
									alert("검색종류를 선택하세요");
									return false;
									}
							if (!searchForm.find(
								"input[name='keyword']").val()) {
									alert("키워드를 입력하세요");
									return false;
									}
							searchForm.find("input[name='pageNum']").val("1");
									e.preventDefault();

									searchForm.submit();

								});

					});
</script>






<%@include file="../includes/footer.jsp"%>
