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
    
    <div class="nav-content">
      <ul class="tabs tabs-transparent">
        <li class="tab"><a class="active" href="#test1">Q & A</a></li>
        <li class="tab"><a href="#">질문 등록</a></li>
        <li class="tab"><a href="#">My Page</a></li>
        <li class="tab"><a href="tab4.do">Coins</a></li>
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
	
	<div class="container">

		<div class="card">
		  <div class="card-content" style="padding-bottom: 10px;">
		  	<div class="row">
		  		<div class="col s3 m1">
			  		<img class="circle" width="50px" height="50px" src="./upload/3.jpg"/>
		  		</div>
		  		
		  		<div class="col s9 m11">
		  		<h4 style="margin-top: 10px;">
		  			<a href='#' class="card-title activator grey-text text-darken-4">부동산 매매 후 하자보수 관련</a>
		  		</h4>
		  		</div>
		  		
		  		<div class="col s12">
		  		<p style="text-overflow: ellipsis;white-space: nowrap; overflow: hidden; margin-top: 10px;"><b>Q : </b> 부동산 매매 계약서 특약사항에 아래와 같이 명시한 후 거래 완료하였습니다. (잔금 완료) [건물의 노후로 인하여
		  		</p>
		  		</div>
		  	</div>
		  </div>
		</div>
		
		<div class="card">
		  <div class="card-content" style="padding-bottom: 10px;">
		  	<div class="row">
		  		<div class="col s3 m1">
			  		<img class="circle" width="50px" height="50px" src="./upload/2.jpg"/>
		  		</div>
		  		
		  		<div class="col s9 m11">
		  		<h4 style="margin-top: 10px;">
		  			<a href='#' class="card-title activator grey-text text-darken-4">건물경매 시 월세 보증금</a>
		  		</h4>
		  		</div>
		  		
		  		<div class="col s12">
		  		<p style="text-overflow: ellipsis;white-space: nowrap; overflow: hidden; margin-top: 10px;"><b>Q : </b> 현재 빌라에 월세로 살고있는데요 (200/30) 16년에 1년 계약했다가 그냥 더 사는식으로 얘기해서 따로 계약
		  		</p>
		  		</div>
		  	</div>
		  </div>
		</div>
		
		<div class="card">
		  <div class="card-content" style="padding-bottom: 10px;">
		  	<div class="row">
		  		<div class="col s3 m1">
			  		<img class="circle" width="50px" height="50px" src="./upload/1.jpg"/>
		  		</div>
		  		
		  		<div class="col s9 m11">
		  		<h4 style="margin-top: 10px;">
		  			<a href='#' class="card-title activator grey-text text-darken-4">쌍방폭행 관련 문의합니다</a>
		  		</h4>
		  		</div>
		  		
		  		<div class="col s12">
		  		<p style="text-overflow: ellipsis;white-space: nowrap; overflow: hidden; margin-top: 10px;"><b>Q : </b> 쌍방폭행이었는데 상대방은 상처가 남았지만 저는 상처가 없는 상황입니다. 상대방은 상해진단서를 제출한
		  		</p>
		  		</div>
		  	</div>
		  </div>
		</div>
		
		<div class="card">
		  <div class="card-content" style="padding-bottom: 10px;">
		  	<div class="row">
		  		<div class="col s3 m1">
			  		<img class="circle" width="50px" height="50px" src="./upload/3.jpg"/>
		  		</div>
		  		
		  		<div class="col s9 m11">
		  		<h4 style="margin-top: 10px;">
		  			<a href='#' class="card-title activator grey-text text-darken-4">펀드 매입,기준가 질문</a>
		  		</h4>
		  		</div>
		  		
		  		<div class="col s12">
		  		<p style="text-overflow: ellipsis;white-space: nowrap; overflow: hidden; margin-top: 10px;"><b>Q : </b> 펀드시작한 초보입니다 이틀전에 펀드 매입을했는데 이틀뒤 완전히 매입이 된다고하더라고요 근데 내일 
		  		</p>
		  		</div>
		  	</div>
		  </div>
		</div>
		
		<div class="card">
		  <div class="card-content" style="padding-bottom: 10px;">
		  	<div class="row">
		  		<div class="col s3 m1">
			  		<img class="circle" width="50px" height="50px" src="./upload/3.jpg"/>
		  		</div>
		  		
		  		<div class="col s9 m11">
		  		<h4 style="margin-top: 10px;">
		  			<a href='#' class="card-title activator grey-text text-darken-4">청약통장 해지할까요?</a>
		  		</h4>
		  		</div>
		  		
		  		<div class="col s12">
		  		<p style="text-overflow: ellipsis;white-space: nowrap; overflow: hidden; margin-top: 10px;"><b>Q : </b>  현재 스무살이구요 5년 정도 전에 신한 청약통장 상품을 가입해놓은 적이 있습니다. 그냥 돈 좀 남으면 조금씩
		  		</p>
		  		</div>
		  	</div>
		  </div>
		</div>
</div>
	
	
	
	
	
	
	
	
	
	
	
	
  <div class="fixed-action-btn">
  <a class="btn-floating btn-large red">
    <i class="large material-icons">mode_edit</i>
  </a>
  <ul>
    <li><a class="btn-floating red"><i class="material-icons">insert_chart</i></a></li>
    <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
    <li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
    <li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
  </ul>
</div>

		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery.cookie.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/materialize/js/materialize.js"></script>
		
<script type="text/javascript">

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