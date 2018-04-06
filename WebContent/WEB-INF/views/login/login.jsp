<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<title>Booky</title>
		
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		
		<link rel="stylesheet" href="<%=request.getContextPath()%>/materialize/css/materialize.css">
</head>
<body style="background-color: floralwhite;">
  <!-- Modal Structure -->
  <div id="login_modal_1" class="modal bottom-sheet" style="width: 400px;">
    <div class="modal-content">
	   	<div class="container"> 
	 	<h4>Login</h4>
	
	<form class="col s12" name="frmForm" id="_frmForm" action="loginAf.do" method="post">
		
		  <div class="row">
		    <div class="input-field col s12">
		      <input type="text" id="_userid" name="id" data-msg="ID를" class="validate">
		      <label for="아이디">아이디</label>
		    </div>
		    <!-- 
		    	<label>
		       	 <input type="checkbox"  id="_chk_save_id"/>
		        	<span>ID 저장</span>
		      	</label>
		      	-->
		    <div class="input-field col s12">
		      <input type="password" id="_pwd" name="pwd" value="" class="validate">
		      <label for="비밀번호">비밀번호</label>
		  </div>
		  </div>
		  
	</form>
	
	<div>
		<a href="regi.do" title="회원가입">아직 Booky의 회원이 아니신가요?</a><br>
		<a id="_btnLogin" class="waves-light btn btn-block modal-trigger" href="#none">로그인</a>
	</div>
	
	 	
    </div>
    </div>
    
  </div>

  <nav class="nav-extended">
  	<div class="container">
	    <div class="nav-wrapper">
	      <a href="#" class="brand-logo">Booky</a>
	      <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>
	      <ul id="nav-mobile" class="right hide-on-med-and-down">
	        <li><a class="waves-effect waves-light btn modal-trigger" href="#login_modal_1">로그인</a></li>
	      </ul>
	    </div>
    </div>
  </nav>

  <ul id="slide-out" class="sidenav">
	  <li>
		  <div class="user-view">
			  <div class="background">
			  	<img src="image/bg.jpg">
			  </div>
			  
			  <a href="#user"><img class="circle" src="image/blank-person.jpg"></a>
			  <a href="#name"><span class="white-text name">로그인이 필요합니다.</span></a>
			  <a href="#email"><span class="white-text email">로그인을 해주세요.</span></a>
		  </div>
	  </li>
	  <li><a class="waves-effect waves-light btn modal-trigger" href="#login_modal_1">로그인</a></li>
  </ul>
  
<div class="carousel carousel-slider center">
    <div class="carousel-fixed-item center">
      <a class="btn waves-effect white grey-text darken-text-2">button</a>
    </div>
    <div class="carousel-item red white-text" href="#one!">
      <h2>First Panel</h2>
      <p class="white-text">This is your first panel</p>
    </div>
    <div class="carousel-item amber white-text" href="#two!">
      <h2>Second Panel</h2>
      <p class="white-text">This is your second panel</p>
    </div>
    <div class="carousel-item green white-text" href="#three!">
      <h2>Third Panel</h2>
      <p class="white-text">This is your third panel</p>
    </div>
    <div class="carousel-item blue white-text" href="#four!">
      <h2>Fourth Panel</h2>
      <p class="white-text">This is your fourth panel</p>
    </div>
 </div>
 
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/materialize/js/materialize.js"></script>
		
<script type="text/javascript">


var instance = M.Carousel.init({
    fullWidth: true,
    indicators: true
  });

  // Or with jQuery

  $('.carousel.carousel-slider').carousel({
    fullWidth: true,
    indicators: true
  });

			$("#_btnLogin").click(function() {
				
				if ($("#_userid").val() == "") {
					alert($("#_userid").attr("data-msg") + " 입력해 주십시요.");
					$("#_userid").focus();
				} else if ($("#_pwd").val() == "") {
					alert($("#_pwd").attr("data-msg") + " 입력해 주십시요.");
					$("#_pwd").focus();
				} else {
					$("#_frmForm").attr("target","_self").submit();
				}
			});
			$("#_btnRegi").click(function() {
				location.href='regi.do';
			});
			$("#_userid").keypress(function(event) {
				if (event.which == '13') {
					event.preventDefault();
					$("#_pwd").focus();
				}
			});

			$("#_pwd").keypress(function(event) {
				if (event.which == '13') {
					event.preventDefault();
					$("#_btnLogin").click();
				}
			});
			
			//id저장
	        var user_id = $.cookie("user_id");
			//alert(user_id);
	        if (user_id != null) {
	        	$("#_userid").val(user_id);
	            $("#_chk_save_id").prop("checked",true);
	        }
			
			$("#_chk_save_id").click(function () {

			    if ($(this).prop("checked")) {
			        if ($("#_userid").val() == "") {
			            $(this).prop("checked", false);
			            alert("아이디를 입력해 주십시요.");
			        } else {
			            $.cookie("user_id", $("#_userid").val(), { path:"/", expires:365 });
			        }
			    } else {
			    	$.cookie("user_id", null, { path:"/", expires:-1 });
			    }
			});
			
			var elem = document.querySelector('.sidenav');
			var instance = M.Sidenav.init(elem, 'left');

		  // Or with jQuery

		  $(document).ready(function(){
		    $('.sidenav').sidenav();

			//var xhttp = new XMLHttpRequest();
		   // xhttp.open("GET", "http://175.128.83.242:5100/trans", true);
		  //  xhttp.send();
	
		  });
		  
		  var elem = document.querySelector('.modal');
		  var instance = M.Modal.init(elem, 'opacity');

		  // Or with jQuery

		  $(document).ready(function(){
		    $('.modal').modal();
		  });
		  
		  var elem = document.querySelector('.fixed-action-btn');
		  var instance = M.FloatingActionButton.init(elem, {
		    direction: 'left',
		    hoverEnabled: false
		  });

		</script>
</body>
</html> 