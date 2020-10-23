<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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