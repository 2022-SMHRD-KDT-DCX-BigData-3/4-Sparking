<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
<META HTTP-EQUIV="refresh" CONTENT="5">
  <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>동 선택 페이지</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/assets/css/styles.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script type="text/javascript">
  
   $(document).ready(function() {
        $('.btnAdd').click (function () {                                        
              $('.buttons').append (                        
                  '<input type="text" name="txt"> <input type="button" class="btnRemove" value="Remove"><br>'                    
              ); // end append                            
              $('.btnRemove').on('click', function () { 
                  $(this).prev().remove (); // remove the textbox
                  $(this).next ().remove (); // remove the <br>
                  $(this).remove (); // remove the button
              });
          }); // end click   
   });
  
  </script>
  
</head>
<body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav" >
            <div class="container">
                <a class="navbar-brand" href="#page-top">
                <h1>Sparking</h1>
                </a>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                       <c:if test="${mvo.mem_Id=='admin'}">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="admin">관리자 페이지</a></li>
                       </c:if>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#myModal" data-toggle="modal">회원정보 수정</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#">로그아웃</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        
        <!-- 회원정보 수정페이지 시작  -->
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header" style="background-color: gold;">
          <h4 class="modal-title">회원정보 수정</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
         <form action="update" method="post">
         <input type="hidden" value="${mvo.mem_Id}" name="mem_Id"/>
        <!-- Modal body -->
        <div class="modal-body">
          
          <div class="p-2">
          *아파트 선택           
              <select name="apt" class="custom-select mb-3">
                <option selected>apt</option>
                <option value="1">test1</option>
                <option value="2">test2</option>
                <option value="3">test3</option>
              </select>       
          </div>
          <br><br>
          <div class="container-fluid justify-content-center align-items-start" style="">
          *동 <input type="text" class="form-control w-25" value="${mvo.apt_dong}" name="apt_dong"/>
          *호수 <input type="text" class="form-control w-25" value="${mvo.apt_hnum}" name="apt_hnum"/>
          <button type="button" class="btn-primary btn-sm">중복확인</button>
          </div>
          <div class="p-2">
           *비밀번호<input type="password" value="${mvo.mem_Pw}" name="mem_Pw"/>
          </div>
          
          <%-- <div class="p-2">
           *전화번호<input type="id" value = "${mvo.mem_Id}" name="mem_Id"/>
          </div> --%>
          
          *차량번호
           <!-- <button type="button" id="addButton" class="btn-primary">추가</button>
           <button type="button" id="rmvButton" class="btn-primary">삭제</button> -->
          <div id="add" class="p-2">
           <input type="text" value="${mvo.car_num}" name="car_num"/>
          </div>
          <div class="buttons">            
        <input type="text" name="txt"> <input type="button" class="btnAdd" value="Add"><br>        
        </div>  
          <div class="p-2">
          *선호 주차 시간
            <input type = "time" value = "${mvo.p_intime}" name="p_intime" />  
          </div>
          <div class="p-2">
          *선호 외출 시간       
             <input type = "time" value = "${mvo.p_outtime}" name="p_outtime"/>           
          </div>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="submit" class="btn btn-primary">수정</button>
        </div>
        </form>
      </div>
    </div>
  </div>
  <!-- 회원정보 수정페이지 끝  -->
  
        <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center" 
        style="background-image: url('${pageContext.request.contextPath}/resources/images/bn4.png'); 
        background-repeat: no-repeat; background-size : cover; height: 500px;">
            <div class="container d-flex align-items-center flex-column">

            </div>
        </header>
<br>
<br>

        <section class="page-section portfolio" id="portfolio">
          <form action="/dongParking" method = "get">
            <div class="container">
                <!-- Portfolio Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">동 선택</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <div class="row justify-content-center">
                <c:forEach var="item" items="${dong_info}">
               <c:choose>
                  <c:when test="${item.apt_dong == 101}">
                     <c:choose>
                          <c:when test="${item.cnt == 10}">
                             <c:set var="colorA" value="bg-danger" />
                             <c:set var="colorA_check" value="1" />
                          </c:when>
                          <c:when test="${item.cnt >= 6 and item.cnt <= 9}">
                             <c:set var="colorA" value="bg-warning" />
                             <c:set var="colorA_check" value="1" />
                          </c:when>
                          <c:when test="${item.cnt >= 1 and item.cnt <= 5}">
                             <c:set var="colorA" value="bg-success" />
                             <c:set var="colorA_check" value="1" />
                          </c:when>
                       </c:choose>
                       <c:set var="A_cnt" value = "${item.cnt }"></c:set>
                  </c:when>
                  
                  <c:when test="${item.apt_dong == 102}">
                     <c:choose>
                          <c:when test="${item.cnt == 10}">
                             <c:set var="colorB" value="bg-danger" />
                             <c:set var="colorB_check" value="1" />
                          </c:when>
                          <c:when test="${item.cnt >= 6 and item.cnt <= 9}">
                             <c:set var="colorB" value="bg-warning" />
                             <c:set var="colorB_check" value="1" />
                          </c:when>
                          <c:when test="${item.cnt >= 1 and item.cnt <= 5}">
                             <c:set var="colorB" value="bg-success" />
                             <c:set var="colorB_check" value="1" />
                          </c:when>
                       </c:choose>
                       <c:set var="B_cnt" value = "${item.cnt }"></c:set>
                  </c:when>
                  
                  <c:when test="${item.apt_dong == 103}">
                     <c:choose>
                          <c:when test="${item.cnt == 10}">
                             <c:set var="colorC" value="bg-danger" />
                             <c:set var="colorC_check" value="1" />
                          </c:when>
                          <c:when test="${item.cnt >= 6 and item.cnt <= 9}">
                             <c:set var="colorC" value="bg-warning" />
                             <c:set var="colorC_check" value="1" />
                          </c:when>
                          <c:when test="${item.cnt >= 1 and item.cnt <= 5}">
                             <c:set var="colorC" value="bg-success" />
                             <c:set var="colorC_check" value="1" />
                          </c:when>
                       </c:choose>
                       <c:set var="C_cnt" value = "${item.cnt }"></c:set>
                  </c:when>
                  
                  <c:when test="${item.apt_dong == 104}">
                     <c:choose>
                          <c:when test="${item.cnt == 10}">
                             <c:set var="colorD" value="bg-danger" />
                             <c:set var="colorD_check" value="1" />
                          </c:when>
                          <c:when test="${item.cnt >= 6 and item.cnt <= 9}">
                             <c:set var="colorD" value="bg-warning" />
                             <c:set var="colorD_check" value="1" />
                          </c:when>
                          <c:when test="${item.cnt >= 1 and item.cnt <= 5}">
                             <c:set var="colorD" value="bg-success" />
                             <c:set var="colorD_check" value="1" />
                          </c:when>
                       </c:choose>
                       <c:set var="D_cnt" value = "${item.cnt }"></c:set>
                  </c:when>
                  
                  <c:when test="${item.apt_dong == 105}">
                     <c:choose>
                          <c:when test="${item.cnt == 10}">
                             <c:set var="colorE" value="bg-danger" />
                             <c:set var="colorE_check" value="1" />
                          </c:when>
                          <c:when test="${item.cnt >= 6 and item.cnt <= 9}">
                             <c:set var="colorE" value="bg-warning" />
                             <c:set var="colorE_check" value="1" />
                          </c:when>
                          <c:when test="${item.cnt >= 1 and item.cnt <= 5}">
                             <c:set var="colorE" value="bg-success" />
                             <c:set var="colorE_check" value="1" />
                          </c:when>
                       </c:choose>
                       <c:set var="E_cnt" value = "${item.cnt }"></c:set>
                  </c:when>
                  
                  <c:when test="${item.apt_dong == 106}">
                     <c:choose>
                          <c:when test="${item.cnt == 10}">
                             <c:set var="colorF" value="bg-danger" />
                             <c:set var="colorF_check" value="1" />
                          </c:when>
                          <c:when test="${item.cnt >= 6 and item.cnt <= 9}">
                             <c:set var="colorF" value="bg-warning" />
                             <c:set var="colorF_check" value="1" />
                          </c:when>
                          <c:when test="${item.cnt >= 1 and item.cnt <= 5}">
                             <c:set var="colorF" value="bg-success" />
                             <c:set var="colorF_check" value="1" />
                          </c:when>
                       </c:choose>
                       <c:set var="F_cnt" value = "${item.cnt }"></c:set>
                  </c:when>
                  
               </c:choose>
               </c:forEach>
                    
                    <div class="col-md-6 col-lg-4 mb-5">
                            <!-- 101동 -->
                  <c:if test="${colorA_check!=1 }">
                     <c:set var="colorA" value="bg-success" />
                     <c:set var="A_cnt" value="0"/>
                  </c:if>
                  
                   <div class="card ${colorA }">
                       <div class="card-body text-center">
                             <p class="card-text"><a href="parking?apt_dong=101" id="subpa" class="text-body" onclick="subpa()"><h3>101동</h3></a><h5>[${A_cnt } / 10]</h5></p>
                             <script type="text/javascript">
                                subpa(){
                                   document.getElementById('subpa').submit();
                                }
                             </script>
                       </div>
                   </div>
                    </div>
                    
                    <div class="col-md-6 col-lg-4 mb-5">
                      <!-- 102동 -->
                   <c:if test="${colorB_check!=1 }">
                           <c:set var="colorB" value="bg-success" />
                           <c:set var="B_cnt" value="0"/>
                        </c:if>
                   <div class="card ${colorB }">
                     <div class="card-body text-center">
                       <p class="card-text"><a href="parking?apt_dong=102" id ="subpb" class="text-body" onclick="subpb"><h3>102동</h3></a><h5>[${B_cnt } / 10]</h5></p>
                        <script type="text/javascript">
                        subpb(){
                           document.getElementById('subpb').submit();
                        }
                        </script>      
                     </div>
                   </div>
                    </div>
                    
                    <div class="col-md-6 col-lg-4 mb-5">
                      <!-- 103동 -->
                   <c:if test="${colorC_check!=1 }">
                           <c:set var="colorC" value="bg-success" />
                           <c:set var="C_cnt" value="0"/>
                        </c:if>
                   <div class="card ${colorC }">
                     <div class="card-body text-center">
                       <p class="card-text"><a href="parking?apt_dong=103" id = "subpc" class="text-body" onclick="subpc"><h3>103동</h3></a><h5>[${C_cnt } / 10]</h5></p>
                           <script type="text/javascript">
                           subpc(){
                              document.getElementById('subpc').submit();
                           }            
                           </script>
                     </div>
                   </div>
                    </div>
                    
                    <div class="col-md-6 col-lg-4 mb-5">
                      <!-- 104동 -->
                   <c:if test="${colorD_check!=1 }">
                           <c:set var="colorD" value="bg-success" />
                           <c:set var="D_cnt" value="0"/>
                        </c:if>
                   <div class="card ${colorD }">
                     <div class="card-body text-center">
                       <p class="card-text"><a href="parking?apt_dong=104" id = "subpd" class="text-body" onclick="subpd"><h3>104동</h3></a><h5>[${D_cnt } / 10]</h5></p>
                           <script type="text/javascript">
                              subpd(){
                                 document.getElementById('subpd').submit();
                              }
                           
                           </script>
                     </div>
                   </div>  
                    </div>
                    
                    <div class="col-md-6 col-lg-4 mb-5">
                      <!-- 105동 -->
                   <c:if test="${colorE_check!=1 }">
                           <c:set var="colorE" value="bg-success" />
                           <c:set var="E_cnt" value="0"/>
                        </c:if>
                   <div class="card ${colorE }">
                     <div class="card-body text-center">
                       <p class="card-text"><a href="parking?apt_dong=105" id = "subpe" class="text-body" onclick="subpe"><h3>105동</h3></a><h5>[${E_cnt } / 10]</h5></p>
                           <script type="text/javascript">
                              subpe(){
                                 document.getElementById('subpe').submit();
                              }
                           
                           </script>
                     </div>
                   </div>
                    </div>
                    
                    <div class="col-md-6 col-lg-4 mb-5">
                      <!-- 106동 -->
                   <c:if test="${colorF_check!=1 }">
                           <c:set var="colorF" value="bg-success" />
                           <c:set var="F_cnt" value="0"/>
                        </c:if>
                   <div class="card ${colorF }">
                     <div class="card-body text-center">
                       <p class="card-text"><a href="parking?apt_dong=106" id="subpf" class="text-body" onclick="subpf"><h3>106동</h3></a><h5>[${F_cnt } / 10]</h5></p>
                          <script type="text/javascript">
                             subpf(){
                                
                                document.getElementById('subpf').submit();
                             }
                          </script>
                     </div>
                   </div>
                    </div>
                
                 </div>   
            </div>
           </form>
         </section>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>
</html>