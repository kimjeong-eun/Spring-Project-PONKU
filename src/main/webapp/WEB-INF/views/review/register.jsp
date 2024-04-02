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

     <form role="form" action="/review/register" method="post" class="review-form"  enctype="multipart/form-data">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
    
    <div class="form-group">
        <label for="review-title">제목</label>
        <input id="review-title" class="form-control review-input" name="title" placeholder="제목을 입력하세요">
    </div>

    <div class="form-group">
        <label for="review-content">리뷰</label>
        <textarea id="review-content" class="form-control review-textarea" rows="5" name="content" placeholder="리뷰를 작성하세요"></textarea>
    </div>

    <div class="form-group">
        <label for="review-writer">작성자</label>
        <input id="review-writer" class="form-control review-input" name="writer" placeholder="작성자를 입력하세요">
    </div>
    
    <div class="form-group">
    <label for="file-upload">첨부 파일</label>
    <input id="file-upload" class="form-control file-input" type="file" name="file" accept=".jpg, .jpeg, .png, .gif">
    <small class="form-text text-muted">이미지 파일(.jpg, .jpeg, .png, .gif)만 업로드 가능합니다.</small>
    <div id="image-preview" class="uploadResult">
    	<ul>	
    	</ul>
    
    
    </div>
</div>
    

    <button type="submit" class="btn btn-primary review-submit-btn">등록</button>
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
.review-form {
    max-width: 500px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.review-form .form-group {
    margin-bottom: 20px;
}

.review-form label {
    font-weight: bold;
}

.review-form .form-control {
    width: 100%;
}

.review-submit-btn {
    width: 100%;
}
.image-preview {
    max-width: 100%;
    height: auto;
    margin-top: 10px;
}

</style>



	<script type="text/javascript">
		$(document).ready(function(e){
			var formObj = $("form[role='form']");
			
			$("button[type='submit']").on("click",function(e){
				
				e.preventDefault();
				
				console.log("submit clicked");
				
				/* 파일 리스트 처리  */
				
				var str ="";
				
				$(".uploadResult ul li").each(function(i , obj){
					
					var jobj = $(obj);
					
					  console.dir(jobj);
				      console.log("-------------------------");
				      console.log(jobj.data("filename"));
				      
				      
				      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
				      
				});
				 console.log(str);
				    
				formObj.append(str).submit();

				
			});
			
			var regex = new RegExp("(.*?)\\.(exe|sh|zip|alz)$");
			
			var maxSize = 5242880 ; //5mb
			
			function checkExtension(fileName , fileSize){
				
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				}
				
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				
				return true;
				
			}
			
			/* csrf 토큰 처리  */
			
			var csrfHeaderName = "${_csrf.headerName}";  //"X-CSRF-TOKEN"
			var csrfTokenValue = "${_csrf.token}";		// 
			
			var formData = new FormData();
			
			$("input[type='file']").change(function(e){
				
				var formData = new FormData(); //가상의 폼데이터
				
				var inputFile = $("input[id='file-upload']");
				
				var files = inputFile[0].files;
				
				for(var i = 0; i<files.length ; i++){
					if(!checkExtension(files[i].name,files[i].size)){
						
						return false;
						
					}
					formData.append("uploadFile" , files[i]);
				}
				
				
				$.ajax({
					url:'/uploadAjaxAction',
					processData:false, //쿼리스트링 방지
					contentType:false, //기본 타입 방지
					beforeSend: function(xhr){   // 헤더에 csrf 값 추가
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					data: formData,
					type:'POST',
					dataType:'json',
					success: function(result){
					console.log(result);
					showUploadResult(result);
					}
				});
			});
			
			
			function showUploadResult(uploadResultArr){
			    
			    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
			    
			    var uploadUL = $(".uploadResult ul");
			    
			    var str ="";
			    
			    $(uploadResultArr).each(function(i, obj){ //i: 인덱스 obj: fileDTO
					
					if(obj.image){
						var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
						str += "<li data-path='"+obj.uploadPath+"'";
						str +=" data-uuid='"+obj.uuid+"' data-fileName='"+obj.fileName+"' data-type='"+obj.image+"'"
						str +" ><div>";
						str += "<span> "+ obj.fileName+"</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' "
						str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str +"</li>";
					}else{
						var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
					    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					      
						str += "<li "
						str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
						str += "<span> "+ obj.fileName+"</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
						str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/resources/img/attach.png'></a>";
						str += "</div>";
						str +"</li>";
					}

			    });
			   
			    $(".uploadResult ul").html(str);
			  }
			 
			//이벤트 위임
			$(".Result").on("click","button",function(e){
				
				console.log("delete file");
				
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				
				var targetLi = $(this).closest("li"); //선택한 요소를 포함하면서 가장 가까운 상위 요소를 선택합니다.
				
				$.ajax({
					
					url: '/deleteFile',
					data:{fileName:targetFile , type : type},
					beforeSend: function(xhr) {
						
					xhr.setRequestHeader(csrfHeaderName , csrfTokenValue);
					},
					dataType : 'text',
					type:'POST',
					success: function(result){
					alert(result);
					targetLi.remove();
					 }
					
				}); //end ajax
			});

		});

</script>



<%@include file="../includes/footer.jsp"%>
