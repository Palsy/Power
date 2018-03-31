<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<title>Booki</title>
		
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/materialize/css/materialize.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		
</head>
<body style="background-color: lightgray;">

  <nav class="nav-extended">
  	<div class="container">
	    <div class="nav-wrapper">
	      <a href="#" class="brand-logo">Booky</a>
	      <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>
	      <ul id="nav-mobile" class="right hide-on-med-and-down">
	        <li><a class="waves-effect waves-light btn modal-trigger" href="#modal1">로그인</a></li>
	      </ul>
	    </div>
    
    <div class="nav-content">
      <ul class="tabs tabs-transparent">
        <li class="tab"><a href="login.do">인기 질문</a></li>
        <li class="tab"><a href="#">Item 2</a></li>
        <li class="tab"><a href="#">Item 3</a></li>
        <li class="tab"><a class="active" href="tab4.do">Item 4</a></li>
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
			  
			  <a href="#user"><img class="circle" src="image/parkho.jpg"></a>
			  <a href="#name"><span class="white-text name">SungHo Park</span></a>
			  <a href="#email"><span class="white-text email">namespace92@gmail.com</span></a>
		  </div>
	  </li>
	  <li><a href="#"><i class="material-icons">cloud</i>My Wallets</a></li>
	  <li><a href="#">Second Link</a></li>
	  <li><div class="divider"></div></li>
	  <li><a class="subheader">Subheader</a></li>
	  <li><a class="waves-effect" href="#">Third Link With Waves</a></li>
  </ul>

	<div class="container">
		  draw chart !!!
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
					//$("#_frmForm").attr("target","ifrmSpace").submit();
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