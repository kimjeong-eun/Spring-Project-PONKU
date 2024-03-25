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

      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/review/register" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
        
          <div class="form-group">
            <label>제목</label> <input class="form-control" name='title'>
          </div>

          <div class="form-group">
            <label>리뷰</label>
            <textarea class="form-control" rows="3" name='content'></textarea>
          </div>

          <div class="form-group">
            <label>작성자</label> <input class="form-control" name='writer'>
          </div>
          <button type="submit" class="btn btn-default">등록</button>
        </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<%@include file="../includes/footer.jsp"%>
