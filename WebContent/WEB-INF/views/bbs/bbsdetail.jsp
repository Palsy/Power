<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />

<div class="container">

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
				<div class="card-action" style="padding-bottom: 1px;">
					<c:if test="${empty bbs.idfilename}">
						<img style="width: 30px; height: 30px;" class="circle"
							src="./image/blank-person.jpg" />
					</c:if>
					<c:if test="${not empty bbs.idfilename}">
						<div class="row">
						<div class="col s3 m1">
							<img style="width: 50px; height: 50px;" class="circle"src="./upload/${bbs.idfilename}" />
						</div>
						<div class="col s9 m11">
							<h5 style="color:white;"> by ${bbs.id} - ${bbs.wdate}</h5>
						</div>
						</div>
					</c:if>
					
				</div>
			</div>
		</div>
	</div>
	
	<ul class="collapsible popout">
		<c:forEach items="${bbslist}" var="candidate" varStatus="vs">
			<c:if test="${candidate.parent eq bbs.seq}">
				<li><c:if test="${empty candidate.idfilename}">
						<div class="collapsible-header">
							<img style="width: 50px; height: 50px; margin-right: 10px;" class="circle"
								src="./image/blank-person.jpg" /><h5>${candidate.title}</h5></div>
					</c:if> <c:if test="${not empty candidate.idfilename}">
						<div class="collapsible-header">
							<img style="width: 50px; height: 50px; margin-right: 10px;" class="circle"
								src="./upload/${candidate.idfilename}" /><h5>${candidate.title}</h5></div>
					</c:if>
					<div class="collapsible-body" style="display: block;background-color: white;">
						<span>${candidate.content}</span>
					</div>
					
					<div class="row" style="background-color: white;">
						<div class="col s6 m6">
							<a id="voting" class="btn btn-block" href="voting.do?seq=${bbs.seq}&update_id=${candidate.seq}"><i class="small material-icons" style="margin-right: 10px;">thumb_up</i>${candidate.vote}</a>
						</div>
						<div class="col s6 m6">
						<a id="voting2" class="btn btn-block" href="#" style="background-color: #ee6e73;"><i class="small material-icons" style="margin-right: 10px;">thumb_down</i>0</a>
						</div>
					</div>
				</li>
			</c:if>
		</c:forEach>
	</ul>
		
	<form id="_frmForm">
		<input type="hidden" name="seq"   value="${bbs.seq}"/>
		
		<c:if test="${bbs.id eq login.id}">
			<a class="btn btn-block" href="#" id="_btnUpdate" title="글수정하기">수정</a>
		</c:if>
		<c:if test="${bbs.id ne login.id}">
			<a class="btn btn-block" href="#" id="_btnReply" title="답글달기"><i class="small material-icons" style="margin-right: 10px;">question_answer</i>답글</a>
		</c:if>
		<c:if test="${bbs.id eq login.id}">
			<a class= "btn btn-block" href="votingEnd.do?seq=${bbs.seq}"> 투표종료</a>
		</c:if>
	</form>
</div>


<script type="text/javascript">
	var elem = document.querySelector('.collapsible');
	var instance = M.Collapsible.init(elem, 'Accordion');
	// Or with jQuery

	$(document).ready(function() {
		$('.collapsible').collapsible();
	});
	
	$("#voteEnd").click(function() {
		$(location).attr('href',"bbsdetail.do?id="+${bbs.id});
		return false; 
	});
	
	$("#_btnUpdate").click(function() {
		//submitContents($("#_frmForm"),'bbsupdate.do');
		$("#_frmForm").attr({
			"target" : "_self",
			"action" : "bbsupdate.do"
		}).submit();
	});
	$("#_btnReply").click(function() {
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

</script>
