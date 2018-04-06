<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="nows" class="java.util.Date" />

<nav class="nav-extended">
  	<div class="container">
	    <div class="nav-wrapper">
	      <a href="#" class="brand-logo">Booky</a>
	      <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>
	      <ul id="nav-mobile" class="right hide-on-med-and-down">
		    <c:if test="${login.id ne ''}">
		    	<li>${login.id} : </li>
		    	<li>${login.coin} Coin</li>
				<li><a class="waves-effect waves-light btn modal-trigger" href="#" onclick="url_logout();">로그아웃</a></li>
			</c:if>
	      </ul>
	    </div>
    	
    	<div class="nav-content">
			<ul class="tabs tabs-transparent">
		        <li class="tab"><a href="#none" onclick="url_bbslist();" title="답변형게시판">답변형게시판</a></li>							
				<li class="tab"><a href="#none" onclick="url_pdslist();" title=자료실>자료실</a></li>	
				<li class="tab"><a href="#none" onclick="url_calendar();" title="일정관리">일정관리</a></li>
				<li class="tab"><a href="#none" onclick="url_polllist();" title="투표하기">투표하기</a></li>	
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
			  
			<c:if test="${empty login.filename}">
				<a href="#user"><img class="circle" src="./image/blank-person.jpg"></a>
			</c:if>
			
			<c:if test="${not empty login.filename}"> 
				<a href="#user"><img class="circle" src="./upload/${login.filename}"></a>
			</c:if>
			  
			<c:if test="${login.name ne ''}">
				<a href="#name"><span class="white-text name">${login.name}</span></a>
			</c:if>
			  
			  <a href="#email"><span class="white-text email">${login.email}</span></a>
		  </div>
	  </li>
	  <li><a class="waves-effect waves-light btn modal-trigger" href="#" onclick="url_logout();">로그아웃</a></li>
	  <li><div class="divider"></div></li>
	  <li><a class="waves-effect" href="#"><i class="material-icons">attach_money</i><span class="new badge red" data-badge-caption="Coin">${login.coin}</span>My Coin</a></li>
	  <li><div class="divider"></div></li>
	  <li><a class="subheader">코인 사용처</a></li>
	  <li><a class="waves-effect" href="#">코인 보내기</a></li>
  </ul>