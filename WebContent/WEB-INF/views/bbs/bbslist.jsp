<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!-- <head> -->
<!-- 	<link rel="stylesheet" href="./colorpicker/css/colorpicker.css" type="text/css" /> -->
<!--     <link rel="stylesheet" media="screen" type="text/css" href="./colorpicker/css/layout.css" /> -->
<!-- 	<script type="text/javascript" src="./colorpicker/js/jquery.js"></script> -->
<!-- 	<script type="text/javascript" src="./colorpicker/js/colorpicker.js"></script> -->
<!--     <script type="text/javascript" src="./colorpicker/js/eye.js"></script> -->
<!--     <script type="text/javascript" src="./colorpicker/js/utils.js"></script> -->
<!--     <script type="text/javascript" src="./colorpicker/js/layout.js?ver=1.0.2"></script> -->
<!-- </head> -->

<form name="frmForm1" id="_frmFormSearch" method="post" action="">

<!-- 
<table style="margin-left:auto; margin-right:auto; margin-top:3px; margin-bottom:3px; border:0; padding:0;">
<tr>
	<td>검색 : </td>
	<td style="padding-left:5px;">
	<select id="_s_category" name="s_category">
		<option value=""  <c:if test="${(s_category eq '') or empty s_category}"> selected="selected" </c:if>>선택</option>
		<option value="title" <c:if test="${s_category eq 'title'}"> selected="selected" </c:if>>제목</option>
		<option value="contents" <c:if test="${s_category eq 'contents'}"> selected="selected" </c:if>>내용</option>								
	</select>
</td>
<td style="padding-left:5px;"><input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/></td>
<td style="padding-left:5px;"><span class="button blue"><button type="button" id="_btnSearch"> 검색 </button></span></td>
		</tr>
	</table>
 -->
	<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>						
	</form>


<div class="container">
		<c:if test="${empty bbslist}">
			<div>
				작성된 글이 없습니다.
			</div>
		</c:if>
		
		<c:forEach items="${bbslist}" var="bbs" varStatus="vs">
			<c:if test="${bbs.step eq 0}">
				<div class="card">
				  <div class="card-content" style="padding-bottom: 10px;">
				  	<div class="row">
				  		<div class="col s2 m1">
				  		<c:if test="${empty bbs.idfilename}"> 
					  		<img class="circle" width="50px" height="50px" src="./image/blank-person.jpg"/>
					  	</c:if>
					  	<c:if test="${not empty bbs.idfilename}"> 
					  		<img class="circle" width="50px" height="50px" src="./upload/${bbs.idfilename}"/>
					    </c:if>
				  		</div>
				  		
				  		<div class="col s10 m11">
				  		<h4 style="margin-top: 10px;"><a href='bbsdetail.do?seq=${bbs.seq}' class="card-title activator grey-text text-darken-4">${bbs.title}</a></h4>
				  		</div>
				  		<!-- 
				  		<span class="new badge red" data-badge-caption="Hot"></span>
				  		 -->
				  		<div class="col s12">
				  		<p style="text-overflow: ellipsis;white-space: nowrap; overflow: hidden; margin-top: 10px;"><b>Q : </b> ${bbs.content}
				  		</p>
				  		</div>
				  	</div>
				  </div>
				</div>
			</c:if>
		</c:forEach>
</div>

<div class="fixed-action-btn">
  <a class="btn-floating btn-large red" href="bbswrite.do">
    <i class="large material-icons">mode_edit</i>
  </a>
</div>


<div id="paging_wrap">
<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
	<jsp:param value="${pageNumber}" name="pageNumber"/>
	<jsp:param value="${pageCountPerScreen}" name="pageCountPerScreen"/>
	<jsp:param value="${recordCountPerPage}" name="recordCountPerPage"/>
	<jsp:param value="${totalRecordCount}" name="totalRecordCount"/>							
</jsp:include>				
</div>
<form name="frmForm2" id="_frmForm" method="get" action="bbswrite.do">
</form>

<!-- <hr/> -->
<!-- <hr/> -->
<!-- <p><input type="text" maxlength="6" size="6" id="colorpickerField1" value="00ff00" /></p> -->
<!-- <p><input type="text" maxlength="6" size="6" id="colorpickerField3" value="0000ff" /></p> -->
<!-- <p><input type="text" maxlength="6" size="6" id="colorpickerField2" value="ff0000" /></p> -->

<script type="text/javascript">
$(document).ready(function() {
	$("._hover_tr").mouseover(function() {
		$(this).children().css("background-color","#F0F5FF");
	}).mouseout(function() {
		$(this).children().css("background-color","#FFFFFF");
	});
	
	
	
});


$("#_btnAdd").click(function() {	
	alert('글쓰기');	
	$("#_frmForm").attr({ "target":"_self", "action":"bbswrite.do" }).submit();
});
$("#_btnSearch").click(function() {
	//alert('search');						
	$("#_frmFormSearch").attr({ "target":"_self", "action":"bbslist.do" }).submit();
});
function goPage(pageNumber) {	
	$("#_pageNumber").val(pageNumber) ;
	$("#_frmFormSearch").attr("target","_self").attr("action","bbslist.do").submit();
}

var elem = document.querySelector('.fixed-action-btn');
var instance = M.FloatingActionButton.init(elem, {
  direction: 'left',
  hoverEnabled: false
});

</script>