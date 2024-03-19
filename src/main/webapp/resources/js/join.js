// 에러 메세지 객체
const errMsg = {
  id: { 
    invalid: "6~20자의 영문 소문자와 숫자만 사용 가능합니다",
    success: "사용 가능한 아이디입니다",
    fail: "사용할 수 없는 아이디입니다"
  },
  pw: "8~20자의 영문, 숫자, 특수문자를 모두 포함한 비밀번호를 입력해주세요",
  pwRe: {
    success: "비밀번호가 일치합니다",
    fail: "비밀번호가 일치하지 않습니다"
  },
  birth: "생년월일을 다시 확인해주세요",
  mobile: "‘-’ 제외 11자리를 입력해주세요" 
}

// 계정 정보 객체
const account = {
  id: null,
  pw: null,
  email: null,
  birth: null,
  mobile: null
}

/*** SECTION - ID ***/
const idInputEl = document.querySelector('#info__id input');
const idErrorMsgEl = document.querySelector('#info__id .error-msg');
const idCheckBtn = document.querySelector('#id-check');

idInputEl.addEventListener('change', () => {
  const idRegExp = /^[a-zA-Z0-9]{6,20}$/;
  if(idRegExp.test(idInputEl.value)) { // 정규식 조건 만족 O
    idErrorMsgEl.textContent = "";
    account.id = idInputEl.value;
  } else { // 정규식 조건 만족 X
    idErrorMsgEl.style.color = "red";
    idErrorMsgEl.textContent = errMsg.id.invalid;
    account.id = null;
  }
  console.log(account);
});

	$(document).ready(function() {
    // ID 입력란에서 포커스가 벗어날 때 동작한다.
    $("#id-input-field").focusout(function() {
        var userId = $("#id-input-field").val();

        if (userId == '' || userId.length == 0) {
            $("#id-error-msg").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
            return false;
        }

        // Ajax로 전송
        $.ajax({
            url: "checkId", // 실제로 서버에서 ID 중복 확인을 처리하는 스크립트의 경로
            type: "post",
            data: {userId: userId},
            dataType: 'json',
            success: function(result) {
                if (result == true) {
                    $("#id-error-msg").css("color", "black").text("사용 가능한 ID 입니다.");
                } else {
                    $("#id-error-msg").css("color", "red").text("사용 불가능한 ID 입니다.");
                }
            },
            error: function(xhr, status, error) {
                // 서버 요청 실패 시 실행할 코드
                console.error('AJAX request failed:', error);
            }
        }); // End Ajax
    });
});

/*** SECTION - PASSWORD ***/
// pwVal: 패스워드, pwReVal: 패스워드 재입력, isPwValid: 패스워드 유효 여부
let pwVal = "", pwReVal = "", isPwValid = false
// 비밀번호와 재입력 값 일치 여부
function checkPwValid() {
  account.pw = null
  if(pwReVal === "") { // 미입력
    pwReErrorMsgEl.textContent = ""
  }
  else if(pwVal === pwReVal) { // 비밀번호 재입력 일치
    if(isPwValid)
      account.pw = pwVal
    pwReErrorMsgEl.style.color = "green"
    pwReErrorMsgEl.textContent = errMsg.pwRe.success
  }
  else { // 비밀번호 재입력 불일치
    pwReErrorMsgEl.style.color = "red"
    pwReErrorMsgEl.textContent = errMsg.pwRe.fail
  }
}

const pwInputEl = document.querySelector('#info__pw input')
const pwErrorMsgEl = document.querySelector('#info__pw .error-msg')
pwInputEl.addEventListener('change', () => {
  const pwRegExp = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/
  pwVal = pwInputEl.value
  if(pwRegExp.test(pwVal)) { // 유효성 검사 성공
    isPwValid = true
    pwErrorMsgEl.textContent = ""
  } 
  else { // 유효성 검사 실패
    isPwValid = false
    pwErrorMsgEl.textContent = errMsg.pw
  }
  checkPwValid()
  console.log(pwVal, pwReVal, isPwValid, account)
});

/*** SECTION - PASSWORD RECHECK ***/
const pwReInputEl = document.querySelector('#info__pwRe input')
const pwReErrorMsgEl = document.querySelector('#info__pwRe .error-msg')
pwReInputEl.addEventListener('change', () => {
  pwReVal = pwReInputEl.value
  checkPwValid()
  console.log(pwVal, pwReVal, isPwValid, account)
});

/*** SECTION - EMAIL ***/
emailList = ["", ""]
function checkEmailValid() {
  if(emailList[0] !== "" && emailList[1] !== "") {
    account.email = emailList.join('@')
  }
  else
  account.email = null
}

const emailInputEl = document.querySelector('#email-txt')
emailInputEl.addEventListener('change', () => {
  emailList[0] = emailInputEl.value
  checkEmailValid()
  console.log(account, emailList)
})

const domainInputEl = document.querySelector('#domain-txt')
domainInputEl.addEventListener('change', () => {
  emailList[1] = domainInputEl.value
  checkEmailValid()
  console.log(account, emailList)
})

// 도메인 직접 입력 or domain option 선택
const domainListEl = document.querySelector('#domain-list')
domainListEl.addEventListener('change', () => {
  // option에 있는 도메인 선택 시
  const domainSelected = domainListEl.value
  if(domainSelected !== "type") {
    // 선택한 도메인을 input에 입력하고 disabled
    domainInputEl.value = domainSelected
    domainInputEl.disabled = true
    emailList[1] = domainSelected
  } else { // 직접 입력
    // input 내용 초기화 & 입력 가능하도록 변경
    domainInputEl.value = ""
    domainInputEl.disabled = false
    emailList[1] = ""
  }
  checkEmailValid()
  console.log(account, emailList)
})


/*** SECTION - BIRTH ***/
const birthArr = [-1, -1, -1]
/* 유효한 날짜인지 여부 확인 (윤년/평년) */
function checkBirthValid(birthArr) {
  isBirthValid = true
  y = birthArr[0]
  m = birthArr[1]
  d = birthArr[2]
  // 생년월일 모두 선택 완료 시
  if(y > 0 && m > 0 && d > 0) {
    if ((m == 4 || m == 6 || m == 9 || m == 11) && d == 31) { 
      isBirthValid = false
    }
    else if (m == 2) {
      if(((y % 4 == 0) && (y % 100 != 0)) || (y % 400 == 0)) { // 윤년
        if(d > 29) { // 윤년은 29일까지
          isBirthValid = false
        }
      } else { // 평년
        if(d > 28) { // 평년은 28일까지
          isBirthValid = false
        }
      }
    }

    if(isBirthValid) { // 유효한 날짜
      birthErrorMsgEl.textContent = ""
      account.birth = birthArr.join('')
    } else { // 유효하지 않은 날짜
      birthErrorMsgEl.textContent = "생년월일을 다시 확인해주세요"
      account.birth = null
    }
  }
}

const birthErrorMsgEl = document.querySelector('#info__birth .error-msg')
// '출생 연도' 셀렉트 박스 option 목록 동적 생성
const birthYearEl = document.querySelector('#birth-year')
// option 목록 생성 여부 확인
isYearOptionExisted = false;
birthYearEl.addEventListener('focus', function () {
  // year 목록 생성되지 않았을 때 (최초 클릭 시)
  if(!isYearOptionExisted) {
    isYearOptionExisted = true
    for(var i = 1940; i <= 2022; i++) {
      // option element 생성
      const yearOption = document.createElement('option')
      yearOption.setAttribute('value', i)
      yearOption.innerText = i
      // birthYearEl의 자식 요소로 추가
      this.appendChild(yearOption);
    }
  }
});

birthYearEl.addEventListener('change', () => {
  birthArr[0] = birthYearEl.value
  birthYearEl.style.color = "#383838"
  checkBirthValid(birthArr)
  console.log(account, birthArr)
});

// 월 select box
const birthMonthEl = document.querySelector('#birth-month')
isMonthOptionExisted = false;
birthMonthEl.addEventListener('focus', function () {
  if(!isMonthOptionExisted) {
    isMonthOptionExisted = true
    for(var i = 1; i <= 12; i++) {
      const monthOption = document.createElement('option')
      if(i < 10)
        monthOption.setAttribute('value', '0' + i)
      else
        monthOption.setAttribute('value', i)
      monthOption.innerText = i
      this.appendChild(monthOption);
    }
  }
});

birthMonthEl.addEventListener('change', () => {
  birthArr[1] = birthMonthEl.value
  birthMonthEl.style.color = "#383838"
  checkBirthValid(birthArr)
  console.log(account, birthArr)
});

// 일 select box
const birthDayEl = document.querySelector('#birth-day')
isDayOptionExisted = false;
birthDayEl.addEventListener('focus', function () {
  if(!isDayOptionExisted) {
    isDayOptionExisted = true
    for(var i = 1; i <= 31; i++) {
      const dayOption = document.createElement('option')
      if(i < 10)
        dayOption.setAttribute('value', '0' + i)
      else
        dayOption.setAttribute('value', i)
      dayOption.innerText = i
      this.appendChild(dayOption);
    }
  }
});

birthDayEl.addEventListener('change', () => {
  birthArr[2] = birthDayEl.value
  birthDayEl.style.color = "#383838"
  checkBirthValid(birthArr)
  console.log(account, birthArr)
});

/*** SECTION - MOBILE ***/
const mobileInputEl = document.querySelector('#info__mobile input')
const mobileErrorMsgEl = document.querySelector('#info__mobile .error-msg')
mobileInputEl.addEventListener('change', () => {
  const mobileRegExp = /^010([0-9]{8})$/
  if(mobileRegExp.test(mobileInputEl.value)) { // 유효성 검사 성공
    account.mobile = mobileInputEl.value
    mobileErrorMsgEl.textContent = ""
  } else { // 유효성 검사 실패
    account.mobile = null
    mobileErrorMsgEl.textContent = errMsg.mobile
  }
  console.log(account)
});

/*** SUBMIT ***/
const submitBtn = document.querySelector('#submit')
const resultFailEl = document.querySelector('#result-fail')
submitBtn.addEventListener('click', function() {
  let isAllFilled = true
  const word = {  
    id: "아이디를",
    pw: "비밀번호를",
    email: "이메일을",
    birth: "생년월일을",
    mobile: "휴대폰 번호를"
  }
  for(element in account) {
    if(account[element] === null) {
      resultFailEl.textContent = word[element] + " 다시 한번 확인해주세요"
      isAllFilled = false
      break
    }
  }
  if (isAllFilled === true) {
    resultFailEl.textContent = ""
    setTimeout(function() {
      alert("서버 전송 데이터 : " + JSON.stringify(account))
    }, 300)
  }
})