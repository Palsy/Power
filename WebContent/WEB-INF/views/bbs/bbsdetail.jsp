<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />


<form id="_frmForm">
	<input type="hidden" name="seq"   value="${bbs.seq}"/>
	<c:if test="${bbs.id eq login.id}">
	<a href="#none" id="_btnUpdate" title="글수정하기"><img src="image/bupdate.png" alt="수정하기" /></a>
	</c:if>
	<c:if test="${bbs.id ne login.id}">
		<a href="#none" id="_btnReply" title="답글달기"><img src="image/breply.png" alt="답글달기" /></a>
	</c:if>
</form>

<div class="container">

	<!--  
    <c:if test="${empty bbs.idfilename}"> 
			<img style="width:30px; height:30px;" class="circle" src="./image/blank-person.jpg"/>
		</c:if>
		<c:if test="${not empty bbs.idfilename}"> 
			<img style="width:30px; height:30px;" class="circle" src="./upload/${bbs.idfilename}"/>
		</c:if>
	
	 <div class="row">
	  <form class="col s12">
	    <div class="row">
	      <div class="input-field col s12">
	        <i class="material-icons prefix">mode_edit</i>
	        <textarea id="icon_prefix2" class="materialize-textarea">${bbs.id}</textarea>
	        <label for="icon_prefix2">First Name</label>
	      </div>
	      <div class="input-field col s12">
	        <i class="material-icons prefix">mode_edit</i>
	        <textarea id="icon_prefix2" class="materialize-textarea">${bbs.title}</textarea>
	        <label for="icon_prefix2">First Name</label>
	      </div>
	      <div class="input-field col s12">
	        <i class="material-icons prefix">mode_edit</i>
	        <textarea id="icon_prefix2" class="materialize-textarea">${bbs.content}</textarea>
	        <label for="icon_prefix2">First Name</label>
	      </div>
	      <div class="input-field col s12">
	        <i class="material-icons prefix">mode_edit</i>
	        <textarea id="icon_prefix2" class="materialize-textarea">${bbs.wdate}</textarea>
	        <label for="icon_prefix2">First Name</label>
	      </div>
	    </div>
	  </form>
	</div>
	-->

	<div class="row">
		<div class="col s12 m12">
			<div class="card blue-grey darken-1">
				<div class="card-content white-text">
					<h3>
					<span class="card-title">
						
							<i class="small material-icons" style="margin-right: 10px;">question_answer</i>${bbs.title}
					</span>
					</h3>
					<p>${bbs.content}</p>
				</div>
				<div class="card-action">
					<c:if test="${empty bbs.idfilename}">
						<img style="width: 30px; height: 30px;" class="circle"
							src="./image/blank-person.jpg" />
					</c:if>
					<c:if test="${not empty bbs.idfilename}">
						<img style="width: 30px; height: 30px;" class="circle"
							src="./upload/${bbs.idfilename}" />
					</c:if>
					<a href="#">This is a link</a> <a href="#">This is a link</a>
				</div>
			</div>
		</div>
	</div>

	<ul class="collapsible">
		<li class="active">
			<div class="collapsible-header">
				<div class="row">
					<div class="col s12">
						<blockquote></blockquote>
					</div>
					<div class="col s12">
						<c:if test="${empty bbs.idfilename}">
							<img style="width: 30px; height: 30px;" class="circle"
								src="./image/blank-person.jpg" />
						</c:if>
						<c:if test="${not empty bbs.idfilename}">
							<img style="width: 30px; height: 30px;" class="circle"
								src="./upload/${bbs.idfilename}" />
						</c:if>
						${bbs.id} ${bbs.wdate}
					</div>
				</div>
			</div>
			<div class="collapsible-body">
				<span>${bbs.content}</span>
			</div>
		</li>
	</ul>


	<ul class="collapsible popout">
		<c:forEach items="${bbslist}" var="candidate" varStatus="vs">
			<c:if test="${candidate.parent eq bbs.seq}">
				<li><c:if test="${empty candidate.idfilename}">
						<div class="collapsible-header">
							<img style="width: 30px; height: 30px;" class="circle"
								src="./image/blank-person.jpg" />by ${candidate.id} <p style="font-size:20px"> ${candidate.title}</p></div>
					</c:if> <c:if test="${not empty candidate.idfilename}">
						<div class="collapsible-header">
							<img style="width: 30px; height: 30px;" class="circle"
								src="./upload/${candidate.idfilename}" />${candidate.title}</div>
					</c:if>
					<div class="collapsible-body">
						<span>${candidate.content}</span> <a id="voting" href="voting.do?seq=${bbs.seq}&update_id=${candidate.seq}"><i class="small material-icons" style="margin-right: 10px;">thumb_up</i><p>${candidate.vote}</p></a>
					</div></li>

			</c:if>
		</c:forEach>
	</ul>
	<c:if test="${bbs.id eq login.id}">
		<a href="votingEnd.do?seq=${bbs.seq}"> 투표종료</a>
	</c:if>
</div>


<script type="text/javascript">
	var elem = document.querySelector('.collapsible');
	var instance = M.Collapsible.init(elem, 'Accordion');
	// Or with jQuery

	$(document).ready(function() {
		$('.collapsible').collapsible();
	});
	
	$("#voteEnd").click(function() {
		alert("click vote end");
		$(location).attr('href',"bbsdetail.do?id="+${bbs.id});
		return false; 
	});
	
	$("#_btnUpdate").click(function() {
		alert('글수정하기');
		//submitContents($("#_frmForm"),'bbsupdate.do');
		$("#_frmForm").attr({
			"target" : "_self",
			"action" : "bbsupdate.do"
		}).submit();
	});
	$("#_btnReply").click(function() {
		alert('답글달기');
		//submitContents($("#_frmForm"),'bbsreply.do');
		$("#_frmForm").attr({
			"target" : "_self",
			"action" : "bbsreply.do"
		}).submit();
	});
	//'저장' 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	function submitContents(elClickedObj) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);

		// 에디터에 입력된 내용의 검증은 이곳에서
		// document.getElementById("ir1").value 값을 이용해서 처리한다.
		//alert(ares+'------------------------');
		try {
			// 이 라인은 현재 사용 중인 폼에 따라 달라질 수 있다.
			//elClickedObj.action.value=ares;
			elClickedObj.submit();
		} catch (e) {
		}
	}

	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "_content",
		sSkinURI : "./se2/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
	});
</script>
