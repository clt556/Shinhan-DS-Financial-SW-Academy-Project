<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="google" content="notranslate" />
    <link rel="icon" href="../image/ShinhanLogo.png" />
    <link rel="stylesheet" href="../css/common.css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/footer.css" />
    <link rel="stylesheet" href="../css/review/review.css" />

    <script src="//code.jquery.com/jquery-3.3.1.min.js">
  
    
    </script>


    <title>common</title>
  </head>
  <body>
      <jsp:include page="/WEB-INF/jsp/include/header.jsp"/>
    <div class="contents">
      <div class="ContentsContainer">
        <div class="title">후기 게시판</div>
        
        <div class="postsWrapper">
          
          
          <script>
          	console.log(${result.list});
          </script>
          
          
          <c:forEach var="vo" items="${result.list }">
          
          <div class="postWrapper" onclick="location.href='/main/review/view.do?review_pk=${vo.review_pk}';">
            <div class="photoWrapper" style="background-color: transparent; position:relative;">
	          	<img src="${pageContext.request.contextPath}/image/client/${vo.imagename}" onerror="this.src='/main/image/logoMain.png'" style="width:100%; height:100%;"/>  
            </div>
            <div class="postInfoWrapper">
              <div class="titleWrapper">
                ${vo.title}
                <div class="iconsWrapper">
                  <div class="iconWrapper">
                    <img class="icon" src="../image/review/BsHandThumbsUpFill.png" />
                    ${vo.review_recommend_count}
                  </div>
                  <div class="iconWrapper">
                    <img class="icon" src="../image/review/BsEye.png" />
                    ${vo.review_watch_count }
                  </div>
                </div>
              </div>
              
              <div class="subWrapper">${vo.nickname}</div>
              <div class="subsubWrapper">${vo.regdate}</div>
              <div class="buttonsWrapper">
              	
              
                
                
              </div>
            </div>
          </div>
        
         </c:forEach>
          
          
          
          
          
          </div>
       <div class="pageWrapper">
                        
                    </div>
 
        
        
        
        
        
        
        
        
        
     <div class="pageControllerWrapper">
        <div class="pagenate clear">
             <ul class='paging'>
             <c:if test="${result.prev == true }">
             	<li><a href="index.do?page=${result.startPage-1 }&stype=${param.stype }&sword=${param.sword}" class="smallLetter"> <img src="../image/review/MdNavigateBefore.png" /> </a></li>
	             	<div class="MdNavigateBefore"></div>
             </c:if>
             <c:forEach begin="${result.startPage }" end="${result.endPage }" var="num">
                 <li class="horizontal smallLetter">
                 	<a href='index.do?page=${num }&stype=${param.stype }&sword=${param.sword}' 
                 		<c:if test="${reviewVO.page eq num}">class="selectLetter"</c:if>
                 		>${num }</a>
                 		</li>
                 		
             </c:forEach>    
             <c:if test="${result.next == true }">
             	<li><a href="index.do?page=${result.endPage+1 }&stype=${param.stype }&sword=${param.sword}"> <img src="../image/review/MdNavigateNext.png" /> </a></li>
             	<div class="MdNavigateNext"></div>
             </c:if>
             </ul> 
         </div>
      </div>
        <!-- 페이지처리 -->
        
         
         <hr />
        <div class="search">
	        <form method="get" name="searchForm" id="searchForm" action="index.do">
	          <div class="searchWrapper">
	            <select id="stype" name="stype" class="select" title="검색분류 선택">
	              <option value="all">전체</option>
	              <option value="title" <c:if test="${param.stype=='title' }">selected</c:if>>제목</option>
	              <option value="content" <c:if test="${param.stype=='content' }">selected</c:if>>내용</option>
	            </select>
	            
	            <input type="text" id="sval" name="sword" value="${param.sword }"  title="검색어 입력" class="input" placeholder="검색어를 입력하세요" />
	            <button class="btn yellowBblackL">검색</button>
	          </div>
        	</form>
        </div>
        
        
        
        
    </div>

      <!-- 이 부분에 헤더 푸터 사이에 들어가는 것들 넣어주세요. -->
      <!-- 정렬이 페이지마다 조금씩 달라서 wrapper 역할을 할 div(width: 100%, height: 100% + 원하는 정렬 등) 넣고 그 안에 요소들 넣으면 될 것 같습니다. -->
      <!-- common.css 파일은 수정하지 않고 새로운 css 파일을 추가 후 스타일 작성 -->
    </div>
 <jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
  </body>
</html>
