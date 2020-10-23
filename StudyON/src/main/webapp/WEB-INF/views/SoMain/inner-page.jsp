<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

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

<%@ include file="footer.jsp" %>