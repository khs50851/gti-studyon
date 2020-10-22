<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>StudyOn</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/img/on-off.png" rel="icon">
  <link href="/img/on-off.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/css/style.css" rel="stylesheet">
  

  
  <!-- =======================================================
  * Template Name: eNno - v2.1.0
  * Template URL: https://bootstrapmade.com/enno-free-simple-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="index">StudyOn</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="drop-down lecture"><a href="">강의들</a>
            <ul>
              <li class="drop-down"><a href="#">개발/프로그래밍</a>
                <ul>
                  <li><a href="#">웹 개발</a></li>
                  <li><a href="#">모바일 앱 개발</a></li>
                  <li><a href="#">서버 개발</a></li>
                  <li><a href="#">게임 개발</a></li>
                  <li><a href="#">데이터베이스</a></li>
                  <li><a href="#">기타</a></li>
                </ul>
              </li>
              <li class="drop-down"><a href="#">IT보안/네트워크</a>
                <ul>
                  <li><a href="#">보안</a></li>
                  <li><a href="#">자동화</a></li>
                  <li><a href="#">인프라</a></li>
                  <li><a href="#">사물인터넷</a></li>
                  <li><a href="#">블록체인</a></li>
                  <li><a href="#">기타</a></li>
                </ul>
              </li>
              <li class="drop-down"><a href="#">크리에이티브</a>
                <ul>
                  <li><a href="#">UX/UI</a></li>
                  <li><a href="#">웹앱 디자인</a></li>
                  <li><a href="#">그래픽 디자인</a></li>
                  <li><a href="#">3D 모델링</a></li>
                  <li><a href="#">기타</a></li>
                </ul>
              </li>
              <li class="drop-down"><a href="#">커리어</a>
                <ul>
                  <li><a href="#">취업/이직</a></li>
                  <li><a href="#">개인브랜딩</a></li>
                  <li><a href="#">업무스킬</a></li>
                  <li><a href="#">기타</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="search-form-area animated">
         <form action="#" method="post">
         <input type="search" name="search" id="search" placeholder="배우고 싶은 지식을 입력해보세요.">
         <button type="submit" class="d-none"><img src="/img/core-img/search-icon.png" alt="Search"></button>
          </form></li>

        </ul>
        
        
        
        <!-- Search btn -->
<!--
        <div class="search-button">
         <a href="#" id="search-btn"><img src="img/core-img/search-icon.png" alt="Search"></a>
         </div>
-->
      </nav><!-- .nav-menu -->

      <a href="/SoMember/So_Login" class="get-started-btn scrollto">Sign In</a>
      <a href="/SoMember/So_Meminsert" class="get-started-btn scrollto">Sign Up</a>

    </div>
  </header><!-- End Header -->

  <main id="main">
    
    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex align-items-center">
         <div class="cources">
          <div class="cources-img"><img src="/img/cote-1.png"></div>
          <div class="cources-info">
              <h3>코딩테스트는 스터디온에서</h3>
              <table>
                  <tr>
                      <th>수강정보</th>
                      <td><i class="icofont-star"></i>
                      <i class="icofont-star"></i>
                      <i class="icofont-star"></i>
                      <i class="icofont-star"></i>
                      <i class="icofont-star"></i>&nbsp;(4개의 수강평)&nbsp;&nbsp;17명의 수강생</td>
                  </tr>
                  <tr>
                      <th>스킬태그</th>
                      <td>프로그래밍</td>
                  </tr>
              </table>
          </div>
        </div>
    </div>
      </div>
    </section><!-- End Breadcrumbs -->

    <div class="inner-page">
      <div class="container">
        
        <div class="tabmenu">
      <ul class="cources-nav">
    <li id="tab1" class="btnCon"> <input type="radio" checked name="tabmenu" id="tabmenu1">
      <label for="tabmenu1">강의소개</label>
      <div class="tabCon" >강의소개 구역</div>
      
    </li>
    <li id="tab2" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu2">
      <label for="tabmenu2">교육과정</label>
      <div class="tabCon" >교육과정 구역</div>
      
    </li>    
    <li id="tab3" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu3">
      <label for="tabmenu3">수강후기</label>
      <div class="tabCon" >수강후기 구역</div>
      
    </li>
    
    <li id="tab4" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu4">
      <label for="tabmenu4">Q&A</label>
      <div class="tabCon" >수강생 질문과 답변 구역</div>
      
    </li>
    
    <li id="tab5" class="btnCon"><input type="radio" name="tabmenu" id="tabmenu5">
      <label for="tabmenu5">커뮤니티</label>
      <div class="tabCon" >강사 커뮤니티 구역</div>
      
    </li>
  </ul>
</div>
        </div> 
    </div>
    
    <div class="buybox">
        
        <div>
            <h3> 550,000원</h3>
            <input type="button" class="buybutton" name="buy" value="구매하기">
            <input type="button" class="cartbutton" name="cart" value="♡">
            
        </div>
        
    </div>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">

      <div class="container">

        <div class="row  justify-content-center">
          <div class="col-lg-6">
            <h3>StudyOn</h3>
            <p>원하는 강의를 찾지 못하셨나요? 듣고싶은 강의를 신청해보세요.</p>
          </div>
        </div>

        <div class="row footer-newsletter justify-content-center">
          <div class="col-lg-6">
            <form action="" method="post">
              <input type="email" name="email" placeholder="원하는 강의 내용을 간단히 입력하세요."><input type="submit" value="신청하기">
            </form>
          </div>
        </div>

        

      </div>
    </div>


    <div class="container footer-bottom clearfix">
      <div class="copyright">
        &copy; Copyright <strong><span>StudyOn</span></strong>. All Rights Reserved
      </div>
      
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/enno-free-simple-bootstrap-template/ -->
        Designed by StudyOn
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

	<c:choose>
	<c:when test="${row==1 }">
		<script>
			alert("회원 가입이 완료 되었습니다. 이메일을 통해 인증 완료 후 로그인 해주시기 바랍니다.");
			location.replace("/SoMain/index");
		</script>
	</c:when>
	<c:when test="${row==0 }">
		<script>
			alert("접속자가 많아서 등록이 지연되고 있습니다\n 잠시후에...");
			history.back();
		</script>
	</c:when>

</c:choose>

  <!-- Vendor JS Files -->
  <script src="/vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="/vendor/php-email-form/validate.js"></script>
  <script src="/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="/vendor/counterup/counterup.min.js"></script>
  <script src="/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/vendor/venobox/venobox.min.js"></script>
  <script src="/vendor/owl.carousel/owl.carousel.min.js"></script>
  
   <!-- Template Main JS File -->
  <script src="/js/main.js"></script>



</body>

</html>