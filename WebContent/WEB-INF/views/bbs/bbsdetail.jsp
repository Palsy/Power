<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>


<!-- 
<input type="hidden" name="seq"   value="${bbs.seq}"/>
<c:if test="${bbs.id eq login.id}">
<a href="#none" id="_btnUpdate" title="글수정하기"><img src="image/bupdate.png" alt="수정하기" /></a>
</c:if>
<a href="#none" id="_btnReply" title="답글달기"><img src="image/breply.png" alt="답글달기" /></a>
-->

<div class="container">
	<h2>Title : ${bbs.title}</h2>
	<blockquote>
		<c:if test="${empty bbs.idfilename}"> 
			<img style="width:30px; height:30px;" class="circle" src="./image/blank-person.jpg"/>
		</c:if>
		<c:if test="${not empty bbs.idfilename}"> 
			<img style="width:30px; height:30px;" class="circle" src="./upload/${bbs.idfilename}"/>
		</c:if>
    </blockquote>
    <div class="divder"></div>
    <div class="divder"></div>
    <div class="divder"></div>
    <div class="divder"></div>
	
	
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
	
	<ul class="collection">
	<c:forEach items="${bbslist}" var="candidate" varStatus="vs">
	<c:if test="${candidate.parent eq bbs.seq}">
		    <li class="collection-item avatar">
				<c:if test="${empty bbs.idfilename}"> 
					<img class="circle" src="./image/blank-person.jpg"/>
				</c:if>
				<c:if test="${not empty bbs.idfilename}"> 
					<img class="circle" src="./upload/${bbs.idfilename}"/>
				</c:if>
				<p>ID : ${candidate.id} </p>
		      <span class="title"><b>${candidate.title}</b></span>
		      
		      <p>Contents : ${candidate.content} </p>
		      <p>date : ${candidate.wdate} </p>
		      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
		    </li>
 	</c:if>
	</c:forEach>
	</ul>
	
</div>


<script type="text/javascript">
$("#_btnUpdate").click(function() {	
	alert('글수정하기');	
	//submitContents($("#_frmForm"),'bbsupdate.do');
	$("#_frmForm").attr({ "target":"_self", "action":"bbsupdate.do" }).submit();
});
$("#_btnReply").click(function() {	
	alert('답글달기');	
	//submitContents($("#_frmForm"),'bbsreply.do');
	$("#_frmForm").attr({ "target":"_self", "action":"bbsreply.do" }).submit();
});
//'저장' 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
   // 에디터의 내용이 textarea에 적용된다.
   oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
 
   // 에디터에 입력된 내용의 검증은 이곳에서
   // document.getElementById("ir1").value 값을 이용해서 처리한다.
   //alert(ares+'------------------------');
   try{
       // 이 라인은 현재 사용 중인 폼에 따라 달라질 수 있다.
       //elClickedObj.action.value=ares;
       elClickedObj.submit();
   }catch(e){}
}

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "_content",
    sSkinURI: "./se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});
</script>
