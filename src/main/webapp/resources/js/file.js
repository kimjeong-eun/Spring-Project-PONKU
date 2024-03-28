// 스프링 시큐리티용
//const csrfHeader = $("meta[name='_csrf_header']").attr("content");
//const csrfToken = $("meta[name='_csrf']").attr("content");

/**
 *  (제이쿼리 메서드 설명)
 *  on()             : 이벤트를 받는 메서드 ex) on(이벤트, 동작할 메서드)
 *  css()            : HTML 태그에 CSS 속성을 부여한다 ex) css(속성명, 값)                                        
 *  $(this)          : 자기 자신을 선택한다
 *  index()          : 자기 자신의 순서를 찾는 제이쿼리 메서드
 *  addClass()       : HTML 태그에 className을 추가한다
 *  removeClass()    : HTML 태그에 className을 삭제한다
 *  prevAll()        : 선택한 요소의 이전의 요소들을 찾는다
 *  nextAll()        : 선택한 요소의 이후의 요소들을 찾는다
*/
console.log("file.js 실행...");
// file upload drag 
const attachmentUploadDiv = document.getElementById("attachmentUploadDiv");
const dropZone = document.getElementById('file-draganddrop'); // 드래그앤드롭
var fileSelect = document.getElementById('file-selectinput'); // input file
var preview = document.getElementById("Preview"); // 파일 이미지 + 이름 + 버튼

function onClickFunction() {	//필드 클릭시 파일선택 이벤트 등록
	fileSelect.click();
}

// 드래그 앤 드롭 이벤트 처리
// 사용자가 파일을 드래그하여 영역 위에 올렸을 때의 동작
dropZone.addEventListener('dragover', function(e) {
	e.preventDefault(); // 파일이 드롭될 수 있도록 기본 이벤트 무시
	dropZone.classList.add('dragover'); // 드래그 중 스타일 변경
});

// 사용자가 드래그한 항목을 드롭 영역 바깥으로 이동시켰을 때의 동작
dropZone.addEventListener('dragleave', function(e) {
	dropZone.classList.remove('dragover'); // 드래그 떠날 때 스타일 복원
});

// 사용자가 드래그한 파일을 드롭 영역 안에 놓았을 때의 동작(파일선택)
dropZone.addEventListener('drop', function(e) {
	e.preventDefault();	//기본 이벤트 정지
	dropZone.classList.remove('dragover'); // 스타일 복원
	const files = e.dataTransfer.files;	// 들어온 파일들을 files에 저장
	//fileSelect.files = files;   // 파일 선택(input type="file"인 요소)에 드롭된 파일들을 설정
	console.log(files); // 잘 들어갔는지 확인
	// FileList {0: File, length: 1}
	//0:File {name: '주석달아놓은 get.jsp',
	//lastModified: 1709881610860,
	//lastModifiedDate: Fri Mar 08 2024 16:06:50 GMT+0900 (한국 표준시),
	//webkitRelativePath: '', size: 13688, …}
	//length: 1[[Prototype]]: FileList
	uploadFiles(files); // 드롭된 파일들을 업로드 함수에 전달
});

dropZone.addEventListener("click", onClickFunction);

fileSelect.addEventListener("change", function(e) { // 클릭해서 파일선택 시 변화감지
	var files = e.target.files;
	console.log("fileSelect에 변화 감지");
	uploadFiles(files);
});

var csrfHeaderName = $("meta[name='_csrf_header']").attr("content")//"${_csrf.headerName}";
var csrfTokenValue = $("meta[name='_csrf']").attr("content")//"${_csrf.token}";

// 파일 처리 함수를 정의합니다.
function uploadFiles(files) {
	console.log("선택된 파일들:", files);
	// 여기에 파일 처리 로직을 추가합니다.
	var formData = new FormData();								// 가상의 폼태그를 생성하고
	for (var i = 0; i < files.length; i++) {
		console.log(files[i].name);					// 파일이 있는만큼 반복하면서
		if (!checkExtension(files[i].name, files[i].size)) {		// 파일 중에 제한된 확장자를 가진 파일이 있는지, 파일 최대 크기보다 큰 크기의 파일이 있는지 검사하고 만약 올리지 못할 파일이 있다면
			console.log("업로드 불가능한 파일");
			return false;											// 안돼 돌아가
		}
		formData.append("uploadFile", files[i]);					// 없다면 ajax으로 파일을 업로드하기 위해 formData에 파일들을 집어넣는다.
		console.log(formData.getAll('uploadFile'));
	}

	$.ajax({													// ajax으로 파일 업로드하기
		url: '/uploadAjaxAction',									// 전송 경로
		processData: false, 										// false여야만 전송된다.
		contentType: false,										// false여야만 전송된다.
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		data: formData,											// formData 자체를 보낸다
		type: 'POST',												// post 방식으로 보낸다.
		/*dataType: formData,*/											// json방식으로 보낸다.
		success: function(result) {								// 성공 시 
			console.log(result);
			showFiles(result);								// 업로드 결과를 화면에 출력하도록 한다.	
		}, error: function(result) {
			console.log(result);
		}
	}); //$.ajax

}

// 파일 업로드는 별도의 업로드 버튼을 두지 않고 <input type='file'>의 내용이 변경되는것을 감지해서 처리하도록 한다.
var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");			// 제한할 파일 확장자
var maxSize = 41943040; //40MB									// 파일 최대 크기
//파일 업로드 시 제한된 파일 확장자인지, 최대 파일크기를 넘었는지 검사한다.  
function checkExtension(fileName, fileSize) {					// 파일명과, 파일크기를 매개값으로 받는다.

	if (fileSize >= maxSize) {									// 파일크기 초과 시
		alert("파일 사이즈 초과");
		return false;												// 안돼 돌아가
	}

	if (regex.test(fileName)) {									// 파일이름중에 제한된 확장자를 가진 파일이 있으면
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;												// 안돼 돌아가
	}
	return true;												// 둘다 통과했으면 괜찮음 ~
}

function showFiles(files) { // AttachFileDTO 리스트로 전달된다.
	console.log("showFiles 함수 호출!!!!!!!!");
	$(files).each(function(i, file) {
		console.log(file); // 각 요소를 개별적으로 출력
	});
	if (!files || files.length == 0) {
		console.log("업로드 된 파일이 없습니다.");
		return;
	} // 업로드에 성공한 file이 없으면 돌아가기

	if (hasChildLi()) {
		console.log("선택된 파일 있음"); // 이미 선택된 파일이 있다는 뜻
	} else {
		console.log("선택된 파일 없음"); // 이미 선택된 파일이 없으면 다지웡
		preview.innerHTML = ''; // preview 내부 요소 모두 삭제
	}

	const fileList = document.createElement('ul');
	fileList.id = 'fileList'; // <ul id="fileList">
	if (!(fileList == null)) {
		console.log("ul 생성 성공");
	}

	$(files).each(function(i, file) {
		const listItem = document.createElement('li');
		listItem.className = 'fileItem'; // <li class="fileItem">
		var img = document.createElement('img');
		if (file.image) { // 파일이 이미지라면
			console.log("이미지다!");
			img.src = encodeURIComponent(file.uploadPath + "/s_" + file.uuid + "_" + file.fileName);
		} else { // 일반파일이라면
			console.log("이미지 아니다!");
			img.src = encodeURIComponent(file.uploadPath + "/" + file.uuid + "_" + file.fileName);
		}
		listItem.appendChild(img);
		const span = document.createElement('span');
		span.textContent = `${file.fileName} (${file.size} bytes)`; // 사이즈 추가
		listItem.appendChild(span);
		const deleteButton = document.createElement('button');
		deleteButton.className = 'deleteButton'; // <button class="deleteButton">
		deleteButton.textContent = '삭제';

		deleteButton.addEventListener('click', function() {
			console.log("삭제할 파일:", file);

			$.ajax({ // ajax으로 전송
				url: '/deleteFile', // 전송할 경로
				data: { fileName: file.fileName, type: file.image }, // 경로를 포함한 파일명, 이미지여부를 fileName, type라는 이름으로 설정
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				dataType: 'text', // text 타입으로
				type: 'POST', // post 방식으로
				success: function(result) { // 성공 시 결과를
					alert(result); // alert
					listItem.remove(); // 해당 파일 항목 삭제
					event.stopPropagation(); // 이벤트 전파 중단(클릭시 파일선택하는 이벤트 실행되지 않게한다.)
				}
			}); //$.ajax
		});

		listItem.appendChild(deleteButton); // 삭제 버튼을 파일 항목에 추가
		fileList.appendChild(listItem);
	});
	preview.appendChild(fileList); // preview에 파일 목록 추가
}


function hasChildLi() { // 자식 li 요소가 있는지 확인하는 함수
	const childLi = preview.querySelector('li');
	return !!childLi; // childLi가 존재하면 true, 없으면 false 반환
}


























