<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<form name="frmForm" id="_frmForm" method="post" action="">
<table class="list_table" style="width:85%;">
<div class="container">
	<ul class="collection">
    <li class="collection-item avatar">
		<c:if test="${empty bbs.idfilename}"> 
			<img class="circle" src="./image/blank-person.jpg"/>
		</c:if>
		<c:if test="${not empty bbs.idfilename}"> 
			<img class="circle" src="./upload/${bbs.idfilename}"/>
		</c:if>
      <span class="title">하루에 몇번씩 자위를 해야 건강한가요?</span>
      <p>First LineFirst LineFirst LineFirst LineFirst LineFirst LineFirst LineFirst LineFirst LineFirst LineFirst Line <br>
         Second LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond Line
         Second LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond Line
         Second LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond Line
         Second LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond Line
         Second LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond Line
         Second LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond Line
         Second LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond Line
         Second LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond Line
         Second LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond Line
         Second LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond Line
         Second LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond Line
         Second LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond LineSecond Line
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
    <li class="collection-item avatar">
      <i class="material-icons circle">folder</i>
      <span class="title">Title</span>
      <p>First Line <br>
         Second Line
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
    <li class="collection-item avatar">
      <i class="material-icons circle green">insert_chart</i>
      <span class="title">Title</span>
      <p>First Line <br>
         Second Line
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
    <li class="collection-item avatar">
      <i class="material-icons circle red">play_arrow</i>
      <span class="title">Title</span>
      <p>First Line <br>
         Second Line
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
  </ul>
</div>



<input type="hidden" name="seq"   value="${bbs.seq}"/>
<tbody>	
<tr class="id">
<th>아이디</th>
<td style="text-align: left">${bbs.id}</td>
<td style="text-align: left">${bbs.title}</td>
<th>작성일</th><td style="text-align: left">${bbs.wdate}</td>
<td style="text-align: left">${bbs.content}</td>
<td style="text-align: left">
	
</td>
</tr>
<tr>

<c:forEach items="${bbslist}" var="candidate" varStatus="vs">
 	<c:if test="${candidate.parent eq bbs.seq}">
 		<tr><td><a>${candidate.id}</a><br></td></tr>
 		<tr><td><a>${candidate.title}</a><br></td></tr>
 		<tr><td><a>${candidate.content}</a><br></td></tr>
 		<tr><td><a>				  	
 					<c:if test="${empty candidate.idfilename}"> 
				  		<img width="30px" height="30px" src="./image/blank-person.jpg"/>
				  	</c:if>
				  	<c:if test="${not empty candidate.idfilename}"> 
				  		<img width="30px" height="30px" src="./upload/${candidate.idfilename}"/>
				    </c:if>
		</a></td></tr>
 	</c:if>
 
</c:forEach>
<tr>
<td colspan="2" style="height:50px; text-align:center;">
<span>		

<c:if test="${bbs.id eq login.id}">
    <a href="#none" id="_btnUpdate" title="글수정하기"><img src="image/bupdate.png" alt="수정하기" /></a>
	</c:if>
	<a href="#none" id="_btnReply" title="답글달기"><img src="image/breply.png" alt="답글달기" /></a>
	
	
	
</span>
</td>
</tr>
</tbody>
</table>
</form>
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
