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
	const dataTranster = new DataTransfer();
	var inputFile = document.querySelector("#file-selectinput"); // input file 태그
	e.preventDefault();	//기본 이벤트 정지
	dropZone.classList.remove('dragover'); // 스타일 복원
	const files = e.dataTransfer.files;	// 들어온 파일들을 files에 저장
	for (let i = 0; i < files.length; i++) { // 들어온 파일 하나씩
		let file = files[i]; // file 변수에 저장하고
		if (file) { // 파일이 있으면
			dataTranster.items.add(file); // 드롭된 파일을 dataTransferItems 컬렉션에 추가
		}
	};
	inputFile.files = dataTranster.files; // input 태그에 파일들 집어넣음(아마 .. 전송을 위한 작업)
	console.log(inputFile.files); // 잘 들어갔는지 확인
	// FileList {0: File, length: 1}
	//0:File {name: '주석달아놓은 get.jsp',
	//lastModified: 1709881610860,
	//lastModifiedDate: Fri Mar 08 2024 16:06:50 GMT+0900 (한국 표준시),
	//webkitRelativePath: '', size: 13688, …}
	//length: 1[[Prototype]]: FileList
	//fileUpload(inputFile.files); // 정의해야한다.
});

dropZone.addEventListener("click", onClickFunction);

/* 원하는 동작을 구현하려면 두 가지 이벤트인 클릭 이벤트와 파일 선택 이벤트를 다루어야 합니다. 클릭 이벤트가 발생했을 때 파일 선택을 유도하고, 파일이 선택되면 해당 파일에 대한 처리를 수행해야 합니다.

아래는 이를 구현한 예시 코드입니다.

// dropZone 요소를 가져옵니다. (예를 들어, id가 "dropZone"인 요소라고 가정합니다.)
var dropZone = document.getElementById("dropZone");

// 클릭 이벤트 핸들러를 등록합니다.
dropZone.addEventListener("click", function() {
    // 파일 선택(input file) 태그를 클릭합니다.
    var inputFile = document.querySelector("#file-selectinput");
    inputFile.click(); // 파일 선택 태그 클릭
});

// 파일 선택(input file) 이벤트 핸들러를 등록합니다.
var inputFile = document.querySelector("#file-selectinput");
inputFile.addEventListener("change", function(e) {
    // 선택된 파일들을 가져옵니다.
    var files = e.target.files;
    
    // 파일 처리를 위한 작업을 수행합니다.
    handleFiles(files);
});

// 파일 처리 함수를 정의합니다.
function handleFiles(files) {
    // 파일들에 대한 처리를 수행합니다.
    console.log("선택된 파일들:", files);
    // 여기에 파일 처리 로직을 추가합니다.
}
위의 코드에서는 먼저 dropZone을 클릭했을 때 파일 선택(input file) 태그를 클릭하도록 합니다. 그리고 파일 선택 태그에서 파일이 선택되면 change 이벤트가 발생하며, 이 때 파일 처리를 위한 함수 handleFiles()를 호출합니다. 이 함수 내에서는 선택된 파일들에 대한 원하는 처리를 수행할 수 있습니다. */




















