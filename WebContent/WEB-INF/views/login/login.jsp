<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<title>Booki</title>
		
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
<nav>

    <div class="nav-wrapper">
    <div class="container">
    
      <a href="#" class="brand-logo">Booki</a>
      <a href="#" data-target="slide-out" class="sidenav-trigger">
      <i class="material-icons">menu</i></a>
      <ul class="right hide-on-med-and-down">
        <li><a href="sass.html">Sass</a></li>
        <li><a href="badges.html">Components</a></li>
        <li><a href="collapsible.html">Javascript</a></li>
        <li><a href="mobile.html">Mobile</a></li>
      </ul>
    </div>
    </div>
  </nav>

  <ul id="slide-out" class="sidenav">
  <li><div class="user-view">
  <div class="background">
  <img src="image/bg.jpg">
  </div>
  <a href="#user"><img class="circle" src="image/parkho.jpg"></a>
  <a href="#name"><span class="white-text name">SungHo Park</span></a>
  <a href="#email"><span class="white-text email">namespace92@gmail.com</span></a>
  </div></li>
  <li><a href="#!"><i class="material-icons">cloud</i>My Wallets</a></li>
  <li><a href="#!">Second Link</a></li>
  <li><div class="divider"></div></li>
  <li><a class="subheader">Subheader</a></li>
  <li><a class="waves-effect" href="#!">Third Link With Waves</a></li>
  </ul>

  <div class="container">
  	<div class="row">
    <form class="col s12">
      <div class="row">
        <div class="input-field col s12">
          <input id="last_name" type="text" class="validate">
          <label for="아이디">아이디</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="password" type="password" class="validate">
          <label for="password">Password</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="email" type="email" class="validate">
          <label for="email">Email</label>
        </div>
      </div>
    </form>
  </div>
  </div>



		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery.cookie.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
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
			    	//alert('cookie');
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

		</script>
</body>
</html> 