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
// file upload drag 
const dropZone = document.getElementById('file-draganddrop'); // 파일을 드래그 앤 드롭할 div
var fileSelect = document.getElementById('file-selectinput'); // 파일을 선택할 수 있는 input
const dataTranster = new DataTransfer(); // 데이터 전송 객체 생성

const inputFile = $("input[name='file-selectinput']"); // input file의 값 가져옴
var preview = document.getElementById("Preview"); // 파일 미리보기가 나올 div

function onClickFunction() {	//필드 클릭시 파일선택 이벤트 등록
	fileInput.click();
}



