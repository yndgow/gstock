<div align="center">
	<img src="https://github.com/hwangbj123/Green-Stock/assets/118721780/8e2d5818-e35b-473e-b9ff-2c026b6c19df"  style="width:100%;">
</div>

<div>

 
</div>

<br>

## 🚀 프로젝트 개요
- *모든 팀원이 풀스택으로 개발에 참여했으며, 주 포지션은 아래와 같습니다.*
<br>

|   Name   | 이승호(팀장) | 김지홍 | 김민환 | 양승리 | 황병준 |
| :------: | :----: | :----: | :----: | :----: | :---: |
| Position | 회원<br>결제 기능 | 주식정보<br>전문가 구독 기능  | 공지사항 | 포트폴리오 | 채팅<br>커뮤니티 게시판 |

- 프로젝트 기간 : 2023년 10월 23일 ~ 2023년 11월 13일
- 시연 영상 (유튜브) : 

<br> 

## 🎮 기술 스택

### ✨ Front-End

<details>
    <summary>⚡️ FE 자세히 살펴보기</summary>
    <br>
    <ul>
        <li>bootstrap : 5.2.3 </li>
        <li>HTML5 </li>
        <li>CSS3 </li>
        <li>JavaScript : 1.16.1 </li>
        <li>JQuery : 3.5.1 </li>
        <li>Chart.js </li>
        <li>summernote : 0.8.18 </li>
    </ul>
</details>

  <br>

### 💻 Back-End

<details>
      <summary>⚡️ BE 자세히 살펴보기</summary>
      <br>
      <ul>
          <li>springboot : 2.7.15 </li>
          <li>MySQL : 8.0.32 </li>
          <li>jdk : 11.0.16.01 </li>
          <li>lombok </li>
          <li>MyBatis </li>
          <li>JSP </li>
          <li>BCrypt HASH </li>
          <li>Apache Tomcat : 9.0 </li>
      </ul>
  </details>
  
  <br>
  
### 🛠 외부 API

<details>
      <summary>⚡️ API 자세히 살펴보기</summary>
      <br>
      <ul>
          <li>카카오 소셜 로그인 API</li>
          <li>네이버 소셜 로그인 API</li>
          <li>구글 소셜 로그인 API</li>
          <li>카카오페이 API</li>
          <li>javax.mail API</li>
	  <li>한국투자증권 API</li>
      </ul>
</details>

  <br>

### 🙌🏻 Collaboration
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=Jira&logoColor=white"/> <img src="https://img.shields.io/badge/SpringBoot-6DB33F?style=flat&logo=Slack&logoColor=white"/> <img src="https://img.shields.io/badge/Github-181717?style=flat&logo=Github&logoColor=white"/> <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=Notion&logoColor=white"/> <img src="https://img.shields.io/badge/Chart.js-FF6384?style=flat&logo=Notion&logoColor=white"/> <img src="https://img.shields.io/badge/Eclipse-2C2255?style=flat&logo=Notion&logoColor=white"/><br><img src="https://img.shields.io/badge/JQuery-0769AD?style=flat&logo=Notion&logoColor=white"/> <img src="https://img.shields.io/badge/Gradle-02303A?style=flat&logo=Notion&logoColor=white"/> <img src="https://img.shields.io/badge/Tomcat-F8DC75?style=flat&logo=Notion&logoColor=white"/> <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=Notion&logoColor=white"/> <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=Notion&logoColor=white"/>


<br>

## ⚙ 의존성
```java
	implementation 'org.springframework.boot:spring-boot-starter-web'
	implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:2.3.1'
	implementation 'org.springframework.boot:spring-boot-starter-mail'
	implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
	implementation 'javax.servlet:jstl'
	implementation 'net.nurigo:sdk:4.3.0'
	compileOnly 'org.projectlombok:lombok'
	developmentOnly 'org.springframework.boot:spring-boot-devtools'
	runtimeOnly 'com.h2database:h2'
	runtimeOnly 'com.mysql:mysql-connector-j'
	annotationProcessor 'org.projectlombok:lombok'
	testImplementation 'org.springframework.boot:spring-boot-starter-test'
	testImplementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter-test:2.3.1'
	testImplementation 'io.projectreactor:reactor-test'
	implementation 'javax.mail:javax.mail-api:1.6.2'
	implementation group: 'com.google.zxing', name: 'javase', version: '3.5.0'
	implementation group: 'com.google.zxing', name: 'core', version: '3.5.0'
	implementation 'org.springframework.boot:spring-boot-starter-websocket'
	implementation 'org.springframework.boot:spring-boot-starter-webflux'
	implementation 'org.springframework.boot:spring-boot-starter-data-jpa'
	implementation 'org.springframework.security:spring-security-crypto'
	testRuntimeOnly 'org.junit.platform:junit-platform-launcher'
	// jsoup	
	implementation 'org.jsoup:jsoup:1.13.1'
	//file
	implementation 'commons-fileupload:commons-fileupload:1.4'
    	implementation 'commons-io:commons-io:2.11.0'
```

<br>
<br>

## 1️⃣ 프로젝트 구조

<details>
    <summary>⚡️ 구조 자세히 살펴보기</summary>
    
    📦src
     ┗ 📂main
       ┣ 📂java
       ┃ ┗ 📂com
       ┃   ┗ 📂green
       ┃     ┗ 📂greenstock
       ┃       ┃ ┣ 📂config
       ┃       ┃ ┗ 📂controller
       ┃       ┣ 📂dto
       ┃       ┣ 📂enums
       ┃       ┣ 📂handler
       ┃       ┃ ┗ 📂exception
       ┃       ┣ 📂repository
       ┃       ┃ ┣ 📂interfaces
       ┃       ┃ ┗ 📂model
       ┃       ┃ ┗ 📂entity
       ┃       ┣ 📂service
       ┃       ┗ 📂utils
       ┣ 📂resources
       ┃ ┣ 📂mapper
       ┃ ┗ 📂static
       ┗ 📂webapp
         ┗ 📂WEB-INF
           ┣ 📂resources
           ┃ ┣ 📂css
           ┃ ┣ 📂js
           ┃ ┣ 📂plugins
           ┃ ┣ 📂fonts
           ┃ ┗ 📂img
           ┗ 📂view
             ┣ 📂admin
             ┣ 📂advisor
             ┣ 📂board
             ┣ 📂chatting
             ┣ 📂layout
             ┣ 📂notice
             ┣ 📂pay
             ┣ 📂portfolio
             ┣ 📂stock
             ┗ 📂user


    
</details>
    
<br>

## 2️⃣ 프로젝트 개요

* 핵심 기능이 많으며 실무에서 활용할 수 있는 기능이 포함된 것들 중,
  결제, 환불, 채팅 등 여러 기능과 다양한 외부 API를 경험 해볼 수 있는 주식 커뮤니티 사이트로 주제를 선정함

<br>

## 3️⃣ 기능 구분

#### User

* 회원기능 : 로그인, 회원가입, 소셜 로그인(Kakao, Google, Naver), ID/PW 찾기, 작성글 관리, 구독 목록 관리
* 주식 정보 조회 : 당일 주식 정보확인, 개별 주식 상세 정보 확인, 주식 별 실시간 채팅
* 주식 포트폴리오 : 포트폴리오 입력 및 조회, 각 포트폴리오 관리 및 랭킹 조회
* 커뮤니티 : 커뮤니티 게시판, 공지사항
* 주식 전문가 : 주식 전문가 신청, 전문가 목록 조회, 전문가 구독 및 결제

#### Manager

* 대시보드 : 일일 접속 유저 차트 조회, 월별 구독자수 차트 조회
* 회원 관리 : 유저 목록 및 검색, 유저 정지기능
* 커뮤니티 관리 : 공지사항 관리, 커뮤니티 게시글 관리, 채팅 관리

#### Notice
* 페이징: 일반, 어드민 둘다 가능 
* 관리자: 공지사항 작성, 수정, 삭제 기능, 비공개/공개 양방향 기능
* 일반 사용자: 공지사항 상세보기, 조회수 증가
* 상세보기: 관리자/일반 화면 구분
<br>

## 4️⃣ ERD & 테이블 명세서
테이블 명세서 : [https://docs.google.com/spreadsheets/d/1oaUxJ4CWKrVUvi02h9mYOwBL-raDCLswAQ5Qllws7Xw/edit#gid=0](https://docs.google.com/spreadsheets/d/1PxWk2Hjt_2J9wEkbV4r2eIhkXZoKDakHFHb2PHKSTm8/edit#gid=0)

<br>
<br>

![Gstock](https://github.com/hwangbj123/Green-Stock/assets/121776914/10b95f94-4db1-4912-9ac0-b64d98926246)


<br>
<br>

## 5️⃣ SiteMap
<br>
<img src="https://github.com/hwangbj123/Green-Stock/assets/136680186/c6d7b80f-fe22-4087-8a39-40614cafb536">
<br>

## 6️⃣ 기능 - 회원

#### 회원가입
- 아이디 중복 확인
- 비밀번호 확인 
- Validation 처리
- 이메일 인증(javax.mail)

#### 로그인
- 카카오 소셜 로그인
- 구글 소셜 로그인
- 네이버 소셜 로그인
- 일반 로그인
- 아이디/비밀번호 찾기 (javax.mail)

#### 주식 정보 조회
- 회사명으로 주식 정보 조회
- 실시간 주식 가격 확인
- 기간별 종가, 거래량 차트

#### 주식 포트폴리오
- 포트폴리오 생성 및 수정, 삭제
- 포트폴리오 주식 추가 및 판매
- 포트폴리오 주식 목록 조회
- 포트폴리오 랭킹 조회
- 포트폴리오 일일 성장률 조회

#### 커뮤니티
- 커뮤니티 게시판 글 작성, 조회, 수정, 삭제
- 카테고리 별 분류 및 검색을 통한 게시글 부분 조회
- 게시글의 댓글 및 대댓글 작성
- 게시글 및 댓글, 대댓글 추천 기능
- 쿠키를 사용하여 조회수 중복 증가 방지
- 조회, 추천순으로 게시글 정렬
- summernote 를 활용한 이미지 업로드 및 속성 태그 적용
- STOMP 라이브러리를 통해 주식 별 단체 실시간 채팅
  
#### 주식 전문가
- 전문가 구독 및 결제(Kakao 결제 Api)
- 전문가 상담 게시판(구독자)
- 전문가 1:1 채팅(구독자)

#### 공지사항
- 공지사항 게시판 (글 작성, 수정, 삭제 불가능) 
- 공지사항 조회수
- 공지사항 페이징
- 공지사항에 대한 검색 기능
- 공지사항 상세보기
<br>

<table>
<tr>
  <td>메인 페이지</td>
  <td>구글 로그인</td>
</tr>
<tr>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/118721780/215261cd-f97b-47d0-9b95-89e5984d15cc"></td>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/118721780/7ac286e2-84bc-4abc-b12c-fe9b7458f4fa"></td>
</tr>
<tr>
  <td>카카오 로그인</td>
  <td>네이버 로그인</td>
</tr>
<tr>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/118721780/40aacc60-2f8b-4362-8229-5f0547249232"></td>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/118721780/6fc9389e-9c4c-4a2d-958f-94d90204a65a"></td>
</tr>
<tr>
  <td>회원 가입</td>
  <td>회원 정보 수정</td>
</tr>
<tr>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/118721780/93c30be4-aeb0-4d1b-8b5c-428bfd611ca5"></td>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/118721780/41a47637-aadf-4373-879c-040a71ebb2ae"></td>
</tr>
<tr>
  <td>게시판 CRUD</td>
  <td>게시판 검색/정렬</td>
</tr>
<tr>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/136680186/8b10f0e4-0b97-4b60-9279-03bdbe421672"></td>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/136680186/c7b0375c-46df-4e7b-a9d8-4db5da1760c9"></td>
</tr>
<tr>
  <td>게시판 댓글/대댓글</td>
  <td>주식 별 실시간 채팅</td>
</tr>
<tr>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/136680186/3ae1f247-4d95-4c9c-9e25-52d912a9bb74"></td>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/136680186/5f88bb13-e2a6-4c84-9b98-89c68e42a561"></td>
</tr>
<tr>
  <td>공지사항 상세보기/검색</td>
  <td>주식 정보 조회</td>
</tr>
<tr>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/88834171/53a5c99d-3ae7-4817-a354-d584f6b11eaf"></td>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/111404074/bdb8780c-fe42-4593-9885-fff52adf4c8e"></td>
</tr>
<tr>
  <td>전문가 상담게시판</td>
  <td>전문가 구독하기</td>
</tr>
<tr>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/111404074/58e46d96-33ba-4366-8cfb-c5a89b5931fc"></td>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/111404074/a8c8d45a-a409-4722-9447-486a51434c16"></td>
</tr>
<tr>
  <td>유저 포트폴리오</td>
</tr>
<tr>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/118721780/fbdebc0b-d234-47ee-bd92-a028a1c2096d"></td>
</tr>
</table>

<br>

## 7️⃣ 기능 - 관리자

#### 대시보드
- chart.js 활용
- 일일 방문자 수, 월별 구독자 수

#### 회원 관리
- 회원 조회 (검색 기능, 페이징 처리)
- 회원 정지 기능

#### 게시판 관리
- 게시글 조회 (검색 기능, 페이징 처리)
- 게시글 삭제

#### 채팅 메시지 관리
- 채팅 조회 (주식 별, 구독자 채팅)
- 채팅 메시지 삭제

#### 공지사항
- 공지사항 (작성 ,수정, 삭제)
- 공지사항(공개/비공개)
- 공지사항 (검색기능, 페이징 처리) 
<br>

<table>
<tr>
  <td>게시판 관리</td>
  <td>채팅 메시지 관리</td>
</tr>
<tr>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/136680186/5aa8aa8b-49af-4c39-abb5-19fe707370f2"></td>
  <td><img src="https://github.com/hwangbj123/Green-Stock/assets/136680186/71a6169e-b43b-4a14-8692-ba3cb1a88574"></td>
</tr>
<tr>
  <td>공지사항 관리</td>
  <td>전문가 신청/승인</td>
</tr>
<tr>
 <td><img src="https://github.com/hwangbj123/Green-Stock/assets/88834171/76f40113-5e3e-44b7-8725-6b6ef116adca"></td>
 <td><img src="https://github.com/hwangbj123/Green-Stock/assets/111404074/abacc6d7-2b08-4ac7-a310-29715c9c2ede"></td>
</tr>
</table>

