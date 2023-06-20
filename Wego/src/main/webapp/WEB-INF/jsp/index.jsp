<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="google" content="notranslate">
  <link rel="icon" href="../image/ShinhanLogo.png"/>
  <link rel="stylesheet" href="../css/common.css">
  <link rel="stylesheet" href="../css/footer.css">
  <link rel="stylesheet" href="../css/header.css">
  <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

  <title>common</title>
</head>
<body>
  <div class="header">
    <div class="headerTop">
      <div class="topText">
        <p><a href="">로그아웃</a></p>
        <p><a href="">마이 페이지</a></p>
      </div>
    </div>
    <div class="headerBottom">
      <div class="picBottom">
        <a href=""><img src="/image/logoMain.png" alt=""></a>
        <img class="admin" src="/image/logo_admin.png" alt="">
      </div>
      <ul>
        <li class="menu"><p><a href="">여행 계획</a></p></li>
        <li class="menu"><p><a href="">여행 후기</a></p></li>
        <li class="menu"><p><a href="">나의 기록</a></p></li>
      </ul>

    </div>
  </div>
  <div class="contents">
    <!-- 이 부분에 헤더 푸터 사이에 들어가는 것들 넣어주세요. -->
    <!-- 정렬이 페이지마다 조금씩 달라서 wrapper 역할을 할 div(width: 100%, height: 100% + 원하는 정렬 등) 넣고 그 안에 요소들 넣으면 될 것 같습니다. -->
    <!-- common.css 파일은 수정하지 않고 새로운 css 파일을 추가 후 스타일 작성 -->
  </div>
  <div class="footer">
    <div class="textFooter">
      <p>고객센터 대표번호 1588-0000</p>
      <p>이용약관 | 개인정보처리방침</p>  
      <p>사업자등록번호 : 222-222-2222</p>
      <p> 우) 03993 서울 마포구 월드컵북로 4길 77</p>
    </div>
    <div class="picFooter">
      <img src="../image/pic1.png" alt="">
      <img src="../image/pic2.png" alt="">
    </div>
  </div>
</body>
</html>
