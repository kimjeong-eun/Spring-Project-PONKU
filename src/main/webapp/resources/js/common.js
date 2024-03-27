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
const dropZone = document.getElementById('file-draganddrop'); // 파일을 드래그 앤 드롭할 div
var fileSelect = document.getElementById('file-selectinput'); // 파일을 선택할 수 있는 input
const dataTranster = new DataTransfer(); // 데이터 전송 객체 생성
var preview = document.getElementById("Preview"); // 파일 미리보기가 나올 div

//if (!(preview == null)) { // 파일이 있으면
//	preview = preview.querySelector("div");	//이미지 드롭 필드 변경??????????
//}
const inputFile = $("input[name='uploadFile']"); // ?


function onClickFunction() {	//필드 클릭시 파일선택 이벤트 등록
	fileSelect.click();
}

// 폼에 이미지 input 태그를 동적으로 생성하여 추가하는 함수
function createUploadFileInput(form) {
	// 파일 미리보기 div 안에 파일들을 가져온다.
	let nodes = document.querySelector("#Preview").querySelectorAll("div"); // 
	// 생성된 input 태그들을 저장할 변수
	let inputString = "";

	// 가져온 각 이미지에 대해 처리
	$(nodes).each(function(i, obj) {
		// 파일 이름을 저장할 hidden input 태그 생성
		let inputFileName = document.createElement("input");
		// 파일 경로를 저장할 hidden input 태그 생성
		let inputFilePath = document.createElement("input");
		// 파일 UUID를 저장할 hidden input 태그 생성
		let inputFileUuid = document.createElement("input");

		// 각 input 태그의 속성 설정
		inputFileName.type = "hidden";
		inputFileName.setAttribute('name', "imgList[" + i + "].fileName"); // imgList의 1번째 배열의 파일네임으로 name 속성지정
		inputFileName.setAttribute('value', obj.getAttribute("fileName")); // 

		inputFilePath.type = "hidden";
		inputFilePath.setAttribute('name', "imgList[" + i + "].uploadPath");
		inputFilePath.setAttribute('value', obj.getAttribute("uploadPath"));

		inputFileUuid.type = "hidden";
		inputFileUuid.setAttribute('name', "imgList[" + i + "].uuid");
		inputFileUuid.setAttribute('value', obj.getAttribute("uuid"));

		// 생성된 input 태그들을 문자열로 결합
		inputString += inputFileName.outerHTML + inputFilePath.outerHTML + inputFileUuid.outerHTML;
	});

	// 생성된 input 태그들을 폼에 추가하고 폼을 제출
	form.append(inputString).submit();
}

function previewInner(fileList) {	// 파일리스트를 받아서
	let nodes = document.querySelector("#Preview").querySelectorAll("div");
	for (var i = 0; i < nodes.length; i++) {
		nodes[i].remove();
	}; // 있던걸 하나씩 지우고 .. ????????????
	$(fileList).each(function(i, obj) {
		const innerDiv = document.createElement("div");	//div 태그 생성
		//if (i == 0) {
		//	carouselInner.className = "carousel-item active";
		//} else {
		//	carouselInner.className = "carousel-item";
		//} ????????????
		const img = document.createElement("img");				//img 태그 생성
		var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
		console.log(fileCallPath);
		img.src = "/download?fileName=" + fileCallPath; // 이미지경로
		img.setAttribute('width', "10%");
		img.setAttribute('height', "10%");
		img.setAttribute('class', "d-block w-100");
		img.setAttribute('uploadPath', obj.uploadPath);
		img.setAttribute('uuid', obj.uuid);
		img.setAttribute('fileName', obj.fileName);				//img태그에 데이터 등록
		innerDiv.appendChild(img);
		const p = document.createElement("p");
		// 파일 이름을 텍스트로 설정
		p.innerText = obj.fileName;
		// 필요한 경우 <p> 태그에 추가적인 속성 설정
		//p.setAttribute('class', "file-name-class"); // 예시로 class 추가
		// 다른 속성들도 필요에 따라 추가 가능
		// 원하는 부모 요소에 <p> 태그 추가
		innerDiv.appendChild(p);
		var uploadButton = document.createElement("button");
		var deleteButton = document.createElement("button");
		uploadButton.setAttribute("id", "uploadfile");
		deleteButton.setAttribute("id", "deletefile");
		uploadButton.setAttribute("value", "파일추가");
		deleteButton.setAttribute("value", "삭제");
		innerDiv.appendChild(uploadButton);
		innerDiv.appendChild(deleteButton);
		preview.appendChild(carouselInner);				//완성된 div를 캐러셀에 등록
	});

	//createUploadFileInput(formObj);
	console.log(preview);
	dropZone.removeAttribute('eventList');						//이벤트 등록 정보 태그 삭제
	dropZone.removeEventListener("click", onClickFunction);		//캐러셀 클릭 이벤트 제거
	console.log("클릭 파일추가 이벤트 삭제");

	let nodeList = document.querySelector("#Preview").querySelectorAll("div");	//캐러셀 이너 div 선택
	console.log(nodeList);
	if (nodeList.length == 0) {	// 파일이 없으면
		var div = document.getElementById('attachmentUploadDiv');
		var label = document.createElement("label");
		var emptyNode = document.createElement("div");
		var emptyPriview = document.createElement("div");
		label.innerText = "첨부 파일";
		div.appendChild(label);
		emptyNode.setAttribute("id", "file-draganddrop");
		emptyNode.innerText = "여기에 파일을 드래그하거나, 클릭하여 업로드";
		emptyPriview.setAttribute("id", "Preview")
		emptyNode.appendChild(emptyPriview);
		div.appendChild(emptyNode);

		dropZone.setAttribute('eventList', 'click');														//클릭 이벤트 등록 정보 태그 생성
		dropZone.addEventListener("click", onClickFunction);												//클릭 이벤트 등록
		console.log("클릭 파일추가 이벤트 추가");
	}

};


if (!(dropZone == null)) { // 파일이 있으면 .. ? 드롭 영역이 있으면 .. ?
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
		const dataTranster = new DataTransfer(); // 왜 다시 ?!
		const inputFile = document.querySelector("#file-selectinput"); // input file 태그
		e.preventDefault();								//기본 이벤트 정지, 정지하지 않을 경우 새 창에서 이미지 열림
		dropZone.classList.remove('dragover'); // 스타일 복원
		const files = e.dataTransfer.files;				//input태그에 담긴 파일들을 데이터 트랜스퍼 객체를 통해 옮겨담음
		for (let i = 0; i < files.length; i++) {
			let file = files[i];
			if (file) { // 파일이 있으면
				dataTranster.items.add(file);			// 추가
			}
		};
		inputFile.files = dataTranster.files;			//인풋태그의 파일들 교체
		console.log(inputFile);
		fileUpload(inputFile.files);						//서버로 이미지 데이터 전송
	});

	console.log(!(document.getElementById("file-draganddrop") == null));

	console.log(dropZone.dispatchEvent);
	if (!(document.getElementById("file-draganddrop") == null)) {

		dropArea.setAttribute('eventList', 'click');
		dropArea.addEventListener("click", onClickFunction);
		console.log("event set");
	} else {
		if (document.getElementById("drop-area") == null) {
			if ((!dropArea.getAttribute('eventList') == null)) {
				dropArea.removeAttribute('eventList');
				dropArea.removeEventListener("click", onClickFunction);
				console.log("event remove");
			}
		}
	}

	if (!(fileSelect == null)) {
		// 파일 입력 필드 변경 이벤트 처리
		fileSelect.addEventListener("change", function(e) {
			var csrfHeader = $("meta[name='_csrf_header']").attr("content");
			var csrfToken = $("meta[name='_csrf']").attr("content");
			console.log(csrfHeader + " : " + csrfToken);
			var inputFile = document.querySelector("#file-selectinput");
			var formData = new FormData();
			var files = inputFile.files; // input 태그에 있는 파일들
			console.log(files);
			for (var i = 0; i < files.length; i++) {
				//if(!checkExtension(files[i].name, files[i].size)){
				//console.log(!checkExtension(files[i].name, files[i].size));
				//	return false;
				//}
				console.log(i + files[i] + files[i].name);
				formData.append("uploadFile", files[i], files[i].name); // uploadFile 속성으로 파일, 파일이름
			};
			for (var pair of formData.entries()) { // 폼데이터의 키 값을 출력(확인)
				console.log(pair[0] + ', ' + pair[1]);
			}

			$.ajax({
				url: '/uploadAjaxAction',
				processData: false,
				contentType: false,
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeader, csrfToken);
				},
				data: formData,
				type: 'POST',
				success: function(result) {
					console.log(result);
					createCarouselInner(result);
				},
				error: function(result) {
					alert("uploadFail");
					createCarouselInner(result);
					console.log(result);
				}
			}); //$.ajax
		});

	};

	function imgUpload(files) {
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");
		var formData = new FormData();
		console.log(files);
		for (var i = 0; i < files.length; i++) {
			//if(!checkExtension(files[i].name, files[i].size)){			//파일 사이즈 검증 로직, 우선 막음
			//console.log(!checkExtension(files[i].name, files[i].size));
			//	return false;
			//}
			console.log(i + files[i] + files[i].name);
			formData.append("uploadFile", files[i], files[i].name);			//폼에 파일 데이터 추가
		};
		for (var pair of formData.entries()) {
			console.log(pair[0] + ', ' + pair[1]);
		}																	//폼 데이타 파일 출력 코드
		//var urlString = '/'+ window.location.pathname.split("/")[1]+'/uploadAjaxAction';		//REST방식, 주소 파싱하여 해당 테이블로 전송하기 위한 URI 생성

		$.ajax({
			url: /* urlString */'/uploadAjaxAction',
			processData: false,
			contentType: false,
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			data: formData,
			type: 'POST',
			success: function(result) {
				console.log(result);
				previewInner(result);			//리턴타입 리스트
			},
			error: function(result) {
				alert("업로드 실패");
				console.log(result);
			}
		}); //$.ajax
	}

	var uploadButton = document.getElementById("uploadfile");	//캐러셀 이미지 등록 버튼
	var deleteButton = document.getElementById("deletefile");	//캐러셀 이미지 삭제 버튼
	// 클릭 이벤트 처리
	uploadButton.addEventListener("click", function() {
		fileInput.click();
	});

	deleteButton.addEventListener("click", function() {
		let deleteFile = this.parentElement;
		console.log(deleteFile); // 확인용으로 출력
		//for (let i = 0; i < nodes.length; i++) {
		//	if (nodes[i].getAttribute("class").includes("active")) {
		//		deleteFile = nodes[i];
		//	}
		//}
		if (deleteFile != null) {
			let deleteFilePath = deleteFile.querySelector("img").getAttribute("uploadpath") + "\\" + deleteFile.querySelector("img").getAttribute('uuid') + "_" + deleteFile.querySelector("img").getAttribute('fileName');
			console.log(deleteFilePath);
			let deleteFileType = "zip";
			$.ajax({
				url: '/deleteFile',
				data: { fileName: deleteFilePath, type: deleteFileType },
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeader, csrfToken);
				},
				type: 'POST',
				success: function(result) {
					console.log(result);

					deleteFile.remove();
					nodes = document.querySelector("#Preview").querySelectorAll("div");
					//console.log(document.querySelectorAll('[fileName='+'"'+deleteFile.querySelector("img").getAttribute('fileName')+'"'+']'));
					//document.querySelector('[fileName='+'"'+deleteFile.querySelector("img").getAttribute('fileName')+'"'+']').remove();
					//if (nodes.length != 0) {
					//	nodes[0].setAttribute("class", nodes[0].getAttribute("class") + " active");
					//} else {
					if (nodes.length == 0) {
						var div = document.getElementById('attachmentUploadDiv');
						var label = document.createElement("label");
						var emptyNode = document.createElement("div");
						var emptyPriview = document.createElement("div");
						label.innerText = "첨부 파일";
						div.appendChild(label);
						emptyNode.setAttribute("id", "file-draganddrop");
						emptyNode.innerText = "여기에 파일을 드래그하거나, 클릭하여 업로드";
						emptyPriview.setAttribute("id", "Preview")
						emptyNode.appendChild(emptyPriview);
						div.appendChild(emptyNode);
					}
				},
				error: function(result) {
					console.log(result);
				}
			}); //$.ajax
		}
	});

};

// 이미지 표시 메서드(테스트용 코드)
//function displayImage(file) {
//	const reader = new FileReader();
//	reader.onload = () => {
//
//		imagePreview.src = reader.result;
//		imagePreview.style.display = "block";
//	};
//	reader.readAsDataURL(file);
//}

function displayImage(file, caroucel) { // 파일을 읽어 이미지를 표시 .. ?
	const reader = new FileReader();
	reader.onload = () => { // 파일 읽기 작업이 완료되면 이 함수가 호출
		caroucel.className = "d-block w-100";
		caroucel.style.objectFit = "cover";
		caroucel.src = reader.result;
		caroucel.style.display = "block";
	};
	reader.readAsDataURL(file);
}


var writeForm = $("#writeForm"); // 폼 in 문의종류, 상품정보, 제목, 내용, 작성자, 첨부파일(1,0), 비밀글(1,0), 비밀번호(선택)

$("button[type='submit']").on("click", function(e) {	//폼 등록버튼 선택
	e.preventDefault();								//기본 동작 막기
	console.log("글쓰기 버튼 클릭----------------------------");
	console.log(formObj);
	//createUploadFileInput(formObj);
	let nodes = document.querySelector("#Preview").querySelector("div").querySelectorAll("img");	//캐러셀 이미지들 호출
	let inputString = "";
	$(nodes).each(function(i, obj) {												//캐러셀 이미지들을 input태그에 담기
		let inputFileName = document.createElement("input");						//input 태그 생성
		let inputFilePath = document.createElement("input");
		let inputFileUuid = document.createElement("input");
		inputFileName.type = "hidden";
		inputFileName.setAttribute('name', "imgList[" + i + "].fileName");			//imgList List로 보내기 위해 imgList[i]로 전송
		inputFileName.setAttribute('value', obj.getAttribute("fileName"));			//imgList[0].filename = value
		inputFilePath.type = "hidden";
		inputFilePath.setAttribute('name', "imgList[" + i + "].uploadPath");
		inputFilePath.setAttribute('value', obj.getAttribute("uploadPath"));		//imgList[0].uploadPath = value
		inputFileUuid.type = "hidden";
		inputFileUuid.setAttribute('name', "imgList[" + i + "].uuid");
		inputFileUuid.setAttribute('value', obj.getAttribute("uuid"));				//imgList[0].uuid = value
		inputString += inputFileName.outerHTML + inputFilePath.outerHTML + inputFileUuid.outerHTML;
	});
	console.log(inputString);
	formObj.append(inputString).submit(); // 폼에 히든값 추가										//인풋태그들을 폼에 담아 전송(현재 동작 안함)
	var formnodes = document.querySelector("form").querySelectorAll("input");			//폼의 인풋태그들 선택
	console.log(formnodes);
	var newForm = document.createElement("form");									//새 폼 생성
	newForm.setAttribute("charset", "UTF-8");

	newForm.setAttribute("method", "Post");  //Post 방식

	newForm.setAttribute("action", "/actor/register"); //요청 보낼 주소

	newForm.setAttribute("style", "{display:none;}");

	$(formnodes).each(function(i, obj) {												//옮겨온 input태그들을 새 폼에 등록
		console.log(obj);
		newForm.appendChild(formnodes[i]);
	});
	document.querySelector("body").appendChild(newForm);							//바디 태그에 폼 등록
	console.log(newForm);
	newForm.submit();																//폼 전송
});

// ajax file upload method
$("#uploadBtn").on("click", (e) => {
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");
	console.log(csrfHeader + " : " + csrfToken);
	var formData = new FormData();
	var inputFile = document.querySelector("#file-input");
	var files = inputFile.files;
	console.log(files);
	for (var i = 0; i < files.length; i++) {
		//if(!checkExtension(files[i].name, files[i].size)){
		//console.log(!checkExtension(files[i].name, files[i].size));
		//	return false;
		//}
		console.log(i + files[i] + files[i].name);
		formData.append("uploadFile", files[i], files[i].name);
	};
	for (var pair of formData.entries()) {
		console.log(pair[0] + ', ' + pair[1]);
	}

	$.ajax({
		url: '/uploadAjaxAction',
		processData: false,
		contentType: false,
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeader, csrfToken);
		},
		data: formData,
		type: 'POST',
		success: function(result) {
			console.log(result);
		},
		error: function(result) {
			alert("uploadFail");
			console.log(result);
		}
	}); //$.ajax
});

























