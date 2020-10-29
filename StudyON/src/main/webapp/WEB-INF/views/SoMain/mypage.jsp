<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>  
<html lang="en">

<head>
	
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>StudyOn</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/on-off.png" rel="icon">
  <link href="assets/img/on-off.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: eNno - v2.1.0
  * Template URL: https://bootstrapmade.com/enno-free-simple-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>


  <main id="main">
    <section class="breadcrumbs-mypage">
    <div class="inner-page">
      <div class="container">
       
    <div class="mypage"> 
    <div class="mypage-left">
        
        <li><a href="#">대시보드</a></li>
        <li><a href="#">모든 알림</a></li>
        <li><a href="#">내 학습</a></li>
                <ul>
                    <li><a href="#">내 강의</a></li>
                    <li><a href="#">내 목록</a></li>
                    <li><a href="#">내 질문</a></li>
                    <li><a href="#">문의내역</a></li>
                </ul>
        <li><a href="#">내 결제</a></li>
                <ul>
                    <li><a href="#">위시리스트</a></li>
                    <li><a href="#">수강바구니</a></li>
                    <li><a href="#">내 쿠폰함</a></li>
                    <li><a href="#">구매내역</a></li>
                    <li><a href="#">내 포인트</a></li>
                </ul>
        <li><a href="#">설정</a></li>
                <ul>
                    <li><a href="#">프로필 설정</a></li>
                    <li><a href="#">알림 설정</a></li>
                </ul>
    </div>
	
       <!--복붙-->
	   
	   <div class="mypage-right">
     
  <ul>
    <li><a href="#">대시보드</a></li>
  </ul>

        <h3 class="heading">대시보드</h3>
        <div class=" is-multiline">
          <div class="is-half">
            <div class="box profile">
              <div class="box_title">
                <p>내 프로필</p>
              </div>
              <div class="box_content">
                <div class="media">
                  <div class="media-content">
                    <h5>000님, 오늘 하루 어떤가요? 🍛</h5>
                    <span>닉네임: #</span><br>
                    <span>이메일: #</span><br>
                  </div>
                  <a class="bottom_right" href="#">프로필 수정하기</a>
                </div>
              </div>
            </div>
          </div>
		  
		  
		  <!--2번째-->
          <div class=" is-half">
            <div class="box hard">
              <div class="box_title"><p>최근 학습 강의</p></div>
              <div class="box_content">
			<p class="course_title">화면구현을 해봅시다</p>

			  <div class="inf_progress">
				<label>진도율 : #강/#강 (#%)</label>
				<progress class="progress is-link" value="#" max="100">#%</progress>
			  </div>		
			</div>
		</div>
		</div>
					  
          <!--3번째-->
		  
          <div class=" is-half">
            <div class="box note">
              <div class="box_title"><p>최근 내 노트</p></div>
              <div class="box_content">
                <div class="courses_container">
                  
                </div>
                <a class="bottom_right" href="#">내노트 전체보기</a>
              </div>
            </div>
          </div>
		  
		  
		  
		<!--4번째-->
		<div class="is-half">
            <div class="box plus">
              <div class="box_title"><p>학습 통계</p></div>
              <div class="box_content">
                <div class=" is-mobile">
                  <div class="mini">
                    <div class="status_value">
                      <span>0</span>
                    </div>
                    <div class="status_label">완료 강의수</div>
                  </div>
                  <div class="mini">
                    <div class="status_value">
                      <span>5</span>
                    </div>
                    <div class="status_label">완료 수업수</div>
                  </div>
                  <div class=" mini">
                    <div class="status_value">
                      <span>0</span>
                    </div>
                    <div class="status_label">획득 수료증</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
		  
		  
		  <!--5번째-->
      
          <div class=" is-half">
            <div class="box ingstudy">
              <div class="box_title"><p>최근 학습중인 강의들</p></div>
              <div class="box_content">
                <div class="courses_container">
                  
                  <a href="#" class="course_item">
                    <div class="course_title">초보부터 시작하는 코딩</div>
              
                  </a>
                  <a href="#" class="course_item">
                    <div class="course_title">스프링 입문 접근 기술</div>
               
                  </a>
               
                  <a href="#" class="course_item">
                    <div class="course_title">Do it! 자바 프로그래밍 입문</div>
                  </a>
                </div>
                <a class="bottom_right" href="#">내강의 전체보기</a>
              </div>
            </div>
		 </div>
		 
		 
		  <!--6번째-->
          <div class=" is-half">
            <div class="box perfect">
              <div class="box_title"><p>완료한 강의</p></div>
              <div class="box_content">
                <div class="courses_container">
                  
                </div>
                <a class="bottom_right" href="#">내강의 전체보기</a>
              </div>
            </div>
          </div>
        </div>
      </div>
	   

	   
		   </div>
			</div>
		
    </div>
    </section>


  </main><!-- End #main -->


<%@ include file = "footer.jsp" %>