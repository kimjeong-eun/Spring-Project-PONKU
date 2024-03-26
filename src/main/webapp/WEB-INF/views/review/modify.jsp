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

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">리뷰 수정</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
      
      <form role="form" action="/review/modify" method="post">
      
       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
      
        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
		
		<div class="form-group">
			<label>리뷰번호</label>
			<input class="form-control" name='bno' 
			value='<c:out value="${board.bno }"/>' readonly="readonly">
		</div>
		
		<div class="form-group">
  			<label>제목</label> 
 			 <input class="form-control" name='title' 
   			 value='<c:out value="${board.title }"/>' >
		</div>

		<div class="form-group">
 			 <label>내용</label>
  			 <textarea class="form-control" rows="3" name='content' >
  			 <c:out value="${board.content}"/></textarea>
		</div>

		<div class="form-group">
  			<label>작성자</label> 
  			<input class="form-control" name='writer' 
  			value='<c:out value="${board.writer}"/>' readonly="readonly">            
		</div>

		<div class="form-group">
  			<label>작성일</label> 
  			<input class="form-control" name='regDate'
   			 value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regdate}" />'  
   			 readonly="readonly">            
		</div>
		
		<div class="form-group">
  			<label>수정일</label> 
  			<input class="form-control" name='regDate'
   			 value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updatedate}" />'  
   			 readonly="readonly">            
		</div>
		
		<sec:authentication property="principal" var="pinfo"/>

		<sec:authorize access="isAuthenticated()">

		<c:if test="${pinfo.username eq board.writer}">

  		<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
 		 <button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
	   </c:if>
	</sec:authorize>

  <button type="submit" data-oper='list' class="btn btn-info">목록</button>
  
 
</form> <!-- /review/modify form 종료  -->
    </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->



<script type="text/javascript">
$(document).ready(function() {


	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/review/remove");
	      
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/review/list").attr("method","get");
	      
	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();      
	      
	      formObj.empty();
	      
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	      formObj.append(keywordTag);
	      formObj.append(typeTag);	  
	      
	    }else if(operation === 'modify'){
	        
	        console.log("submit clicked");
	        
	        var str = "";
	        
	        $(".uploadResult ul li").each(function(i, obj){
	          
	          var jobj = $(obj);
	          
	          console.dir(jobj);
	          
	          str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	          
	        });
	        formObj.append(str).submit();
        }
    
	    formObj.submit();
	  });

});
</script>

