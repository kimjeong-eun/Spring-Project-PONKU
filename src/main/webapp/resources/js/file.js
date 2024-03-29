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
		dataType: 'json',											// json방식으로 보낸다
		success: function(result) {								// 성공 시 
			console.log(result);
			let files = [];
			files = result;
			showFiles(files);	// 업로드 결과를 화면에 출력하도록 한다.	
			addFormFileList(files);
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
	for (let i = 0; i < files.length; i++) {
		console.log("----------------------------" + files[i]); // 각 요소를 개별적으로 출력
	}
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

	let fileList;
	console.log("preview.innerHTML : " + preview.innerHTML);
	if (!(preview.innerHTML == '' || preview.innerHTML == null)) { // 안에 뭐가 있으면
		console.log("ul 이미 존재함");
		fileList = preview.querySelector('ul');
	} else {
		fileList = document.createElement('ul');
		fileList.id = 'fileList'; // <ul id="fileList">
		console.log("ul 처음 새로 만든다");
	}

	$(files).each(function(i, file) {
		let listItem = document.createElement('li');
		listItem.className = 'fileItem'; // <li class="fileItem">
		var img = document.createElement('img');
		var itag = document.createElement('i');
		if (file.image) { // 파일이 이미지라면
			console.log("이미지다!");
			var fileCallPath = encodeURIComponent(file.uploadPath + "/s_" + file.uuid + "_" + file.fileName);
			img.src = "/display?fileName=" + fileCallPath
			listItem.appendChild(img);
		} else { // 일반파일이라면
			console.log("이미지 아니다!");
			itag.className = "fa-solid fa-file";
			listItem.appendChild(itag);
		}
		let span = document.createElement('span');
		span.textContent = `${file.fileName} (${file.size} bytes)`; // 사이즈 추가
		listItem.appendChild(span);
		let deleteButton = document.createElement('button');
		deleteButton.className = 'deleteButton'; // <button class="deleteButton">
		deleteButton.style.float = 'right'; // 오른쪽으로 정렬
		deleteButton.textContent = '삭제';

		deleteButton.addEventListener('click', function(event) {
			event.stopPropagation(); // 이벤트 전파 중단(클릭시 파일선택하는 이벤트 실행되지 않게한다.)
			console.log("삭제할 파일:", file);
			console.log("삭제할 파일명 : " + file.uploadPath + "\\s_" + file.uuid + "_" + file.fileName);
			console.log("fileName : " + file.fileName);
			$.ajax({ // ajax으로 전송
				url: '/deleteFile', // 전송할 경로
				data: { uploadPath: file.uploadPath, uuid: file.uuid, fileName: file.fileName, type: file.image }, // 경로를 포함한 파일명, 이미지여부를 fileName, type라는 이름으로 설정
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				dataType: 'text', // text 타입으로
				type: 'POST', // post 방식으로
				success: function(result) { // 성공 시 결과를
					listItem.remove(); // 해당 파일 항목 삭제
					console.log("삭제한 파일 : " + result);
					removeFormFileList(result); // 삭제한 파일
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

var writeForm = $("#writeForm");
var formFileList = [];
// input file 태그는 초기화가 필요하다고 한다 .. 아직 모르겠음 ㅜ

function addFormFileList(files) { // attachFileDTO list
	for (let i = 0; i < files.length; i++) {
		formFileList.push(files[i]); // 그냥 파일을 push 하고
		if (files[i].image == true) { // 이미지라면 썸네일 파일도 push 한다.
			// 썸네일도 추가해야함(uuid 앞에 s_가 붙으면 된다 ㅍ.... )
			files[i].uuid = "s_" + files[i].uuid;
			console.log("addFormFileList 추가, 변경된 uuid : " + files[i].uuid);
			formFileList.push(files[i]); // uuid가 바뀐 파일(썸네일) 저장 .. ?
		}
	}
}

function removeFormFileList(deleteFile) {
	// 일반파일, 이미지파일의원본파일 삭제
	var index = formFileList.findIndex(function(file) {
		return file.uuid === deleteFile.uuid;
	});
	if (index !== -1) { // 파일을 찾았으면
		formFileList.splice(index, 1); // 해당 인덱스의 요소를 1개 삭제
		console.log("파일이 삭제되었습니다.");
	} else {
		console.log("해당 파일을 찾을 수 없습니다.");
	} // 일반파일, 이미지파일의원본파일 삭제

	// 썸네일 파일 삭제
	if (deleteFile.image == true) { // 삭제할 파일이 이미지라면
		deleteFile.uuid = "s_" + deleteFile.uuid;
		var thumbnailIndex = formFileList.findIndex(function(file) {
			console.log("formFileList의 uuid : " + file.uuid);
			console.log("deleteFile의 uuid(s_) : " + deleteFile.uuid);
			return file.uuid == deleteFile.uuid;
		});
		if (thumbnailIndex !== -1) { // 파일을 찾았으면
			formFileList.splice(thumbnailIndex, 1); // 해당 인덱스의 요소를 1개 삭제
			console.log("썸네일 파일이 삭제되었습니다.");
		} else {
			console.log("썸네일 파일을 찾을 수 없습니다.");
		}
	} // 썸네일 파일 삭제
}

$("button[id='submitwrite']").on("click", function(e) {
	console.log("formFileList 출력시작--------------");
	for (let i = 0; i < formFileList.length; i++) {
		console.log(formFileList[i]);
	}
	console.log("formFileList 출력 끝 --------------");

	e.preventDefault(); //기본 동작 막기
	console.log("글쓰기 버튼 클릭, 폼 : " + writeForm);
	let nodes = document.querySelector("#Preview").querySelector("ul").querySelectorAll("li");
	$(nodes).each(function(file) {
		console.log("파일명:", file);
	});
	let inputString = "";
	$(nodes).each(function(i, file) { // 프론트의 file목록(li)
	let img =
		$(formFileList).each(function(ffl) { // 스크립트 파일목록
			if (file.name == ffl.fileName) {
				let inputFileUuid = document.createElement("input");
				inputFileUuid.type = "hidden";
				inputFileUuid.setAttribute('name', "attachList[" + i + "].uuid");
				inputFileUuid.setAttribute('value', file.getAttribute("uuid"));
				console.log("------------");
				console.log(inputFileUuid);

				let inputFilePath = document.createElement("input");
				inputFilePath.type = "hidden";
				inputFilePath.setAttribute('name', "attachList[" + i + "].uploadPath");
				inputFilePath.setAttribute('value', file.getAttribute("uploadPath"));
				console.log(inputFilePath);

				let inputFileName = document.createElement("input");
				inputFileName.type = "hidden";
				inputFileName.setAttribute('name', "attachList[" + i + "].fileName");
				inputFileName.setAttribute('value', file.getAttribute("fileName"));
				console.log(inputFileName);

				let inputFileType = document.createElement("input");
				inputFileType.type = "hidden";
				inputFileType.setAttribute('name', "attachList[" + i + "].fileType") // boolean
				inputFileType.setAttribute('value', file.getAttribute("fileType"));
				console.log(inputFileType);
				console.log("------------");
			}
		});




	});

	formFileList = [];
});























