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

  <div class="col-lg-12">
    <div class="panel panel-default">

      <!-- /.panel-heading -->
      <div class="panel-body">

        <div class="review-form-container">
    <div class="form-group review-form-group">
        <label class="review-label">리뷰번호</label>
        <input class="form-control review-input" name="bno" value="<c:out value='${board.bno }'/>" readonly="readonly">
    </div>

    <div class="form-group review-form-group">
        <label class="review-label">제목</label>
        <input class="form-control review-input" name="title" value="<c:out value='${board.title }'/>" readonly="readonly">
    </div>

    <div class="form-group review-form-group">
        <label class="review-label">내용</label>
        <textarea class="form-control review-textarea" rows="3" name="content" readonly="readonly"><c:out value='${board.content}'/></textarea>
    </div>

    <div class="form-group review-form-group">
        <label class="review-label">작성자</label>
        <input class="form-control review-input" name="writer" value="<c:out value='${board.writer }'/>" readonly="readonly">
    </div>
    
    <div class="form-group review-form-group">
    <label class="review-label">첨부된 이미지</label>
    <div id="image-preview" class="review-image-preview" name="uploadResult" style="display: none;">
        <!-- 기존에 등록한 이미지를 여기에 표시할 곳입니다. -->
        <!-- 이미지가 없을 경우에는 아무것도 표시되지 않습니다. -->
    </div>
</div>

    

        <sec:authentication property="principal" var="pinfo"/>

        <sec:authorize access="isAuthenticated()">

        <c:if test="${pinfo.username eq board.writer}">
        
        <button data-oper='modify' class="btn btn-default">수정</button>
        
        </c:if>
        </sec:authorize>

<button data-oper='list' class="btn btn-info">목록</button>

<form id='operForm' action="/review/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
 
</form>



      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->



<style>
.review-form-container {
    max-width: 500px;
    margin: 0 auto; /* 중앙 정렬 */
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: white;
}

/* 리뷰 폼 그룹 스타일 */
.review-form-group {
    margin-bottom: 20px;
}

/* 라벨 스타일 */
.review-label {
    font-weight: bold;
}

/* 입력 필드 스타일 */
.review-input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-sizing: border-box; /* 패딩과 테두리 포함하여 크기 조정 */
    background-color: #f2f2f2; /* 적당한 회색 배경색 */
}

/* 텍스트 영역 스타일 */
.review-textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-sizing: border-box; /* 패딩과 테두리 포함하여 크기 조정 */
    background-color: #f2f2f2; /* 적당한 회색 배경색 */
}

.review-image-preview {
    margin-top: 10px;
}

.preview-image {
    max-width: 100%;
    height: auto;
    margin-top: 10px;
}

.review-image-preview {
    width: 200px; /* 이미지 미리보기 영역의 너비 */
    height: 200px; /* 이미지 미리보기 영역의 높이 */
    border: 1px solid #ccc; /* 테두리 스타일 */
    margin-top: 10px; /* 위쪽 여백 */
    padding: 5px; /* 내부 여백 */
    display: flex; /* 내부 요소를 가로로 배치하기 위해 flex 사용 */
    justify-content: center; /* 내부 요소를 수평 가운데 정렬 */
    align-items: center; /* 내부 요소를 수직 가운데 정렬 */
    background-color: #f9f9f9; /* 배경색 */
}

.review-image-preview img {
    max-width: 100%; /* 이미지의 최대 너비 */
    max-height: 100%; /* 이미지의 최대 높이 */
    display: block; /* 이미지를 블록 요소로 표시하여 가로 중앙 정렬 */
    margin: 0 auto; /* 이미지를 가로로 중앙 정렬 */
}
=======
#content {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
  }
  .post {
    border: 1px solid #ccc;
    margin-bottom: 20px;
    padding: 10px;
  }
  
.btn-info {
    background-color: #000000; /* 검은색 배경색 */
    color: #ffffff; /* 흰색 글자색 */
    border: 1px solid #000000; /* 검은색 테두리 */
    padding: 8px 16px; /* 내부 여백 */
    border-radius: 5px; /* 둥근 테두리 */
    cursor: pointer; /* 마우스 커서 타입 */
}

.btn-info:hover {
    background-color: #333333; /* 마우스 오버 시 어두운 검은색 배경색 */
    border: 1px solid #333333; /* 마우스 오버 시 어두운 검은색 테두리 */
}


</style>



<div class='row'>

  <div class="col-lg-12">

    <!-- /.panel -->
    <div class="panel panel-default">
      <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> 댓글
        <sec:authorize access="isAuthenticated()">
        <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 달기</button>
        </sec:authorize>
      </div>      
       
      
      
      <!-- /.panel-heading -->
      <div class="panel-body">        
      
        <ul class="chat">

        </ul>
        <!-- ./ end ul -->
      </div>
      <!-- /.panel .chat-panel -->

	<div class="panel-footer"></div>


		</div>
  </div>
  <!-- ./ end row -->
</div>



<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">리뷰 모달</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>리뷰</label> 
                <input class="form-control" name='reply' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>작성자</label> 
                <input class="form-control" name='replyer' value='replyer'>
              </div>
              <div class="form-group">
                <label>수정일</label> 
                <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
              </div>
      
            </div>
	  <div class="modal-footer">
        <button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default">닫기</button>
      </div>         
       </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>


$(document).ready(function(){
  
    var bno = '<c:out value="${board.bno}"/>';
        
    $.getJSON("/review/getAttachList", {bno: bno}, function(arr){
        console.log(arr);
        var str = "";
        $(arr).each(function(i, attach){
            
        	// image type
            if(attach.fileType){
                var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
                str += "<div data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-fileName='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
                str += "<img src='/display?fileName="+fileCallPath+"'>";
                str += "</div>";
            } else {
                str += "<div data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-fileName='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
                str += "<span>"+attach.fileName+"</span><br/>";
                str += "<img src='/resources/img/attach.png'></a>";
                str += "</div>";
           	 }
        	
        	});
        
       	  $("div[name='uploadResult']").html(str).show();
     
     
     });//end getjson

    
  })();//end function
  
  $(".uploadResult").on("click","li", function(e){
      
    console.log("이미지 보기");
    
    var liObj = $(this);
    
    var path = encodeURIComponent(liObj.data("uploadPath")+"/" + liObj.data("uuid")+"_" + liObj.data("fileName"));
    
    if(liObj.data("type")){
      showImage(path.replace(new RegExp(/\\/g),"/"));
    }else {
      //download 
      self.location ="/download?fileName="+path
    }
    
    
  });
  
  function showImage(fileCallPath) {
	    alert(fileCallPath);
	    
	    // 이미지 미리보기 영역을 보이도록 변경하고 이미지를 표시합니다.
	    $(".review-image-preview").css("display", "flex").show().html("<img src='/display?fileName=" + fileCallPath + "' >").animate({width:'100%', height: '100%'}, 1000);
	}

	// 이미지 미리보기 영역을 클릭했을 때 동작하는 이벤트 핸들러를 정의합니다.
	$(".review-image-preview").on("click", function(e) {
	    // 이미지를 축소시키고 이미지 미리보기 영역을 숨깁니다.
	    $(".review-image").animate({width:'0%', height: '0%'}, 1000);
	    setTimeout(function() {
	        $('.review-image-preview').hide();
	    }, 1000);
	});


</script>




<script>

$(document).ready(function() {
    $('#image-upload').on('change', function() {
        var input = $(this)[0];
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#image-preview').html('<img src="' + e.target.result + '" class="review-image-preview" />');
            };
            reader.readAsDataURL(input.files[0]);
        }
    });
});


$(document).ready(function () {
  
  var bnoValue = '<c:out value="${board.bno}"/>';
  var replyUL = $(".chat");
  
    showList(1);
    
    function showList(page){
    	
    	console.log("show list " + page);
        
        replyService.getList({bno:bnoValue,page: page|| 1 }, function(replyCnt, list) {
          
        console.log("replyCnt: "+ replyCnt );
        console.log("list: " + list);
        console.log(list);
        
        if(page == -1){
          pageNum = Math.ceil(replyCnt/10.0);
          showList(pageNum);
          return;
        }
          
         var str="";
         
         if(list == null || list.length == 0){
           return;
         }
         
         for (var i = 0, len = list.length || 0; i < len; i++) {
           str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
           str +="  <div><div class='header'><strong class='primary-font'>["
        	   +list[i].rno+"] "+list[i].replyer+"</strong>"; 
           str +="    <small class='pull-right text-muted'>"
               +replyService.displayTime(list[i].replyDate)+"</small></div>";
           str +="    <p>"+list[i].reply+"</p></div></li>";
         }
         
         replyUL.html(str);
         
         showReplyPage(replyCnt);

     
       });//end function
         
     }//end showList
    
    var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    function showReplyPage(replyCnt){
      
      var endNum = Math.ceil(pageNum / 10.0) * 10;  
      var startNum = endNum - 9; 
      
      var prev = startNum != 1;
      var next = false;
      
      if(endNum * 10 >= replyCnt){
        endNum = Math.ceil(replyCnt/10.0);
      }
      
      if(endNum * 10 < replyCnt){
        next = true;
      }
      
      var str = "<ul class='pagination'>";
      
      if(prev){
        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
      
       
      
      for(var i = startNum ; i <= endNum; i++){
        
        var active = pageNum == i? "active":"";
        
        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      if(next){
        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
      }
      
      str += "</ul></div>";
      
      console.log(str);
      
      replyPageFooter.html(str);
    }
     
    replyPageFooter.on("click","li a", function(e){
        e.preventDefault();
        console.log("page click");
        
        var targetPageNum = $(this).attr("href");
        
        console.log("targetPageNum: " + targetPageNum);
        
        pageNum = targetPageNum;
        
        showList(pageNum);
      });     

   
    var modal = $(".modal");
    var modalInputContent = modal.find("input[name='content']");
    var modalInputReplyer = modal.find("input[name='replyer']");
    var modalInputReplyDate = modal.find("input[name='replyDate']");
    
    
    
    
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");
    
  	$("#modalCloseBtn").on("click", function(e){
    	
    	modal.modal('hide');
    });
    
    var replyer = null;
	
	<sec:authorize access ="isAuthenticated()"> 
	
		replyer = '<sec:authentication property="principal.username"/>';
	
	</sec:authorize>
	
	var csrfHeaderName = "${_csrf.headerName}";  //"X-CSRF-TOKEN"
	var csrfTokenValue = "${_csrf.token}";	
    
    
	$("#addReplyBtn").on("click",function(e){
		
		modal.find("input").val("");
		modal.find("input[name='replyer']").val(replyer);
		modalInputReplyDate.closest("div").hide(); 
		// 등록 날짜 안보이게 비활성화 
		
		modal.find("button[id != 'modalCloseBtn']").hide(); //클로즈 버튼 말고 다 비활

		modalRegisterBtn.show(); //등록 버튼은 활성화 

		$(".modal").modal("show");
	
	});
	
	

	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";

	modalRegisterBtn.on("click", function(e) {
	    var reply = {
	        reply: modalInputContent.val(),
	        replyer: modalInputReplyer.val()
	    };


	    $.ajax({
	        type: 'post',
	        url: '/replies/new',
	        data: JSON.stringify(reply),
	        contentType: "application/json; charset=utf-8",
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	        },
	        success: function(result) {
	            alert(result);
	            modal.find("input").val("");
	            modal.modal("hide");
	            showList(-1);
	        },
	        error: function(xhr, status, error) {
	            console.error("댓글 추가 실패:", error);
	        }
	    });
	});



  //댓글 조회 클릭 이벤트 처리 
    $(".chat").on("click", "li", function(e){
      
      var rno = $(this).data("bno");
      
      replyService.get(rno, function(reply){
      
        modalInputReply.val(comments.id);
        modalInputReplyer.val(comments.replyer);
        modalInputReplyDate.val(replyService.displayTime( comments.replyDate))
        .attr("readonly","readonly");
        modal.data("id", comments.id);
        
        modal.find("button[id !='modalCloseBtn']").hide();
        modalModBtn.show();
        modalRemoveBtn.show();
        
        $(".modal").modal("show");
            
      });
    });
  

modalModBtn.on("click", function(e){
	
  var originalReplyer = modalInputReplyer.val();
	
  var reply = {
		      rno:modal.data("id"), 
		      reply: modalInputReply.val(),
		      replyer: originalReplyer};
  
	if(!replyer){
		 alert("로그인후 수정이 가능합니다.");
		 modal.modal("hide");
		 return;
	}

	console.log("작성자 : " + originalReplyer);
	
	if(replyer  != originalReplyer){
	 
		 alert("자신이 작성한 댓글만 수정이 가능합니다.");
		 modal.modal("hide");
		 return;
	 
	}
	  
	replyService.update(reply, function(result){
	      
	  alert(result);
	  modal.modal("hide");
	  showList(pageNum);
	  
	});
  
});

   	
   	modalRemoveBtn.on("click", function (e){
   	  
   	  var rno = modal.data("id");

   	  console.log("id : " + id);
   	  console.log("작성자 : " + replyer);
   	  
   	  if(!replyer){
   		  alert("로그인후 삭제가 가능합니다.");
   		  modal.modal("hide");
   		  return;
   	  }
   	  
   	  var originalReplyer = modalInputReplyer.val();
   	  
   	  console.log("댓글 : " + originalReplyer);
   	  
   	  if(replyer  != originalReplyer){
   		  
   		  alert("자신이 작성한 댓글만 삭제가 가능합니다.");
   		  modal.modal("hide");
   		  return;
   		  
   	  }
   	  
   	  
   	  replyService.remove(rno, originalReplyer, function(result){
   	        
   	      alert(result);
   	      modal.modal("hide");
   	      showList(pageNum);
   	      
   	  });
   	  
   	});

   	
    var replyer = null;
    
    <sec:authorize access="isAuthenticated()">
    
    replyer = '<sec:authentication property="principal.username"/>';   
    
</sec:authorize>
 
    var csrfHeaderName ="${_csrf.headerName}"; 
    var csrfTokenValue="${_csrf.token}";


 
});

</script>


<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/review/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/review/list")
    operForm.submit();
    
  
    });  
});


</script>





<%@include file="../includes/footer.jsp"%>