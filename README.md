# [Spring-Project]
![home](https://github.com/kimjeong-eun/shopProject/assets/102582351/cb956a0f-60c1-4c3a-b91b-5bf3624e1376)
<br><br>

## 🖥️ 프로젝트 소개
CASETIFY 를 참고하여 만든 폰케이스 판매 사이트입니다.
<br><br>

## 🕰️ 개발 기간
* 2024.03.18 - 2024.04.04 (약 3주)
<br><br>

## 🧑‍🤝‍🧑 멤버 구성 및 역할
*   **정은**: 로그인(Spring Security), 커스텀 케이스 엔진, 쇼핑카트, 주문/결제 시스템
*   **수영**: 회원가입(유효성 검사), 마이페이지(회원정보/비밀번호 변경), 배송지 관리(CRUD), 회원 탈퇴
*   **범근**: 리뷰 시스템, 모아보기 게시판
*   **성은**: 1:1 문의 게시판
*   **나연**: 상품 카테고리 리스트, 관리자 대시보드
<br><br>

## 🛠 기술 스택 (Tech Stack)
### Backend
- **Language**: Java 11
- **Framework**: Spring Framework 5.0.7.RELEASE (Spring MVC)
- **Security**: Spring Security 5.0.6.RELEASE
- **Persistence**: MyBatis 3.4.6, HikariCP 2.7.9
- **Database**: Oracle Database (XE)
- **Build Tool**: Maven

### Frontend
- **View**: JSP, JSTL
- **Bundler**: Parcel
- **Library**: jQuery, Bootstrap

### Infrastructure
- **Server**: AWS EC2
- **Logging**: Log4j2, Log4jdbc

<img width="2287" height="696" alt="image" src="https://github.com/user-attachments/assets/d029db1b-b6bf-40c2-b648-b5f59d3faa1f" />

<br><br>

## 📌 주요 기능

#### 로그인 - <a href="https://github.com/kimjeong-eun/shopProject/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(%EB%A1%9C%EA%B7%B8%EC%9D%B8)" >상세보기 - WIKI 이동</a>
- Spring Security

#### 회원가입 - <a href="https://github.com/kimjeong-eun/shopProject/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85)" >상세보기 - WIKI 이동</a>
- 회원가입 (유효성 검사 - ID 중복 체크 등)

#### 전체 게시판, 관리자 모드 - <a href="https://github.com/kimjeong-eun/Spring-Project-PONKU/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(%EC%A0%84%EC%B2%B4-%EA%B2%8C%EC%8B%9C%ED%8C%90,-%EA%B4%80%EB%A6%AC%EC%9E%90-%EB%AA%A8%EB%93%9C)"> 상세보기 - WIKI 이동</a>
- 전체 목록 조회

#### 커스텀케이스 - <a href="https://github.com/kimjeong-eun/shopProject/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(%EC%BB%A4%EC%8A%A4%ED%85%80%EC%BC%80%EC%9D%B4%EC%8A%A4)"> 상세보기 - WIKI 이동</a>
- 케이스 커스텀 기능

#### 쇼핑카트&구매 - <a href="https://github.com/kimjeong-eun/shopProject/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(%EA%B5%AC%EB%A7%A4-&%EC%87%BC%ED%95%91%EC%B9%B4%ED%8A%B8)"> 상세보기 - WIKI 이동</a>
- 쇼핑카트담기 & 구매로직

#### 마이페이지 - <a href="https://github.com/kimjeong-eun/shopProject/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EC%A7%80)" >상세보기 - WIKI 이동</a>
- 주문/배송조회
- 구매내역
- 회원정보 변경
- 비밀번호 변경
- 배송지 관리 (crud)
- 회원 탈퇴
<br><br>

***
## PONKU 웹사이트 <a href="http://13.125.247.16:8080" target=_blank >클릭!</a> 시 홈페이지로 이동합니다.

### Test 계정 로그인
ID : user1234  / PW : 1111qqqq*
<br>
## PONKU 발표자료 <a href="https://github.com/kimjeong-eun/shopProject/files/14945720/default.pdf" >다운로드</a>
***


## 🏗 아키텍처 패턴 (Architecture Pattern)
본 프로젝트는 **계층형 아키텍처(Layered Architecture)**를 채택하여 관심사를 분리하고 유지보수성을 높였습니다.
- **Presentation Layer**: Spring MVC 컨트롤러를 통한 요청 처리 및 뷰 렌더링
- **Service Layer**: 비즈니스 로직 수행 및 `@Transactional`을 이용한 트랜잭션 관리
- **Persistence Layer**: MyBatis Mapper를 이용한 SQL 분리 및 데이터 접근
- **Domain Layer**: DTO/VO를 통한 계층 간 데이터 전송 최적화
<br><br>

## 🔍 주요 백엔드 로직
1. 주문 생성 시 시퀀스 번호를 선발급받아 여러 상세 테이블에 전파하고, 실패 시 전체 로직을 롤백하여 데이터 일관성 유지.
2. 기본 배송지 변경 시 기존 기본 배송지를 해제하고 새로운 주소를 등록하는 2단계 상태 전이 로직을 트랜잭션 내에서 안전하게 처리.
3. Spring Security의 암호화 체계를 유지하면서도, 민감한 회원 정보 수정 시 직접 JDBC PreparedStatement를 제어하여 보안 안정성과 리소스 관리 효율성 증대.
*   다중 테이블(Order, OrderItems, Cart) 간의 데이터 무결성 보장이 필수적인 주문 시스템에서, 원자성(Atomicity)을 확보하고 주문 경로(직접 구매 vs 장바구니)에 따른 복합적인 데이터 동기화 과제를 수행함.
*   Spring의 `@Transactional`과 MyBatis의 `<selectKey>`를 활용해 시퀀스 기반 주문 번호를 선발급하여 참조 무결성을 확보하고, Service 레이어에서 장바구니 항목의 유무에 따른 조건부 DML 실행 로직을 설계하여 비즈니스 프로세스를 최적화함.
*   예외 발생 시 전역 롤백(Global Rollback)을 통해 데이터 불일치(Inconsistency) 발생 가능성을 차단했으며, 주문 성공과 동시에 구매 항목을 자동 소거하는 워크플로우를 구현하여 DB 정합성 유지 및 사용자 경험을 개선함.
<br><br>
