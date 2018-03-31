<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<c:if test="${login.auth eq '3'}">
<div class="nav-content">
	<ul class="tabs tabs-transparent">
        <li class="tab"><a onclick="url_bbslist();" class="active" href="#">인기 질문</a></li>
        <li class="tab"><a href="#none" onclick="url_pdslist();" title=자료실>자료실</a></li>	
		<li class="tab"><a href="#none" onclick="url_polllist();" title="투표만들기">투표만들기</a></li>
		<li class="tab"><a href="#none" onclick="url_spfpcal();" title="일지">일지</a></li>
	</ul>
</div>
<!-- 
<li><a href="#none" onclick="url_bbslist();" title="답변형게시판">답변형게시판</a></li>							
<li><a href="#none" onclick="url_pdslist();" title=자료실>자료실</a></li>	
<li><a href="#none" onclick="url_calendar();" title="일정관리">일정관리</a></li>
<li><a href="#none" onclick="url_polllist();" title="투표하기">투표하기</a></li>	
<li><a href="#none" onclick="url_ajax();" title="ajax">ajax</a></li>
<li><a href="#none" onclick="url_yutube();" title="yutube">yutube</a></li>
 -->

</c:if>
<c:if test="${login.auth eq '1'}">
<div class="nav-content">
	<ul class="tabs tabs-transparent">
	  <li class="tab"><a href="#none" onclick="url_bbslist();">인기 질문</a></li>
	  <li class="tab"><a href="#">Item 2</a></li>
	  <li class="tab"><a href="#">Item 3</a></li>
	  <li class="tab"><a href="tab4.do">Item 4</a></li>
	</ul>
</div>
<!-- 
<li><a href="#none" onclick="url_bbslist();" title="답변형게시판">답변형게시판</a></li>							
<li><a href="#none" onclick="url_pdslist();" title=자료실>자료실</a></li>	
<li><a href="#none" onclick="url_polllist();" title="투표만들기">투표만들기</a></li>
<li><a href="#none" onclick="url_spfpcal();" title="일지">일지</a></li>						
 -->
</c:if>
		</ul>
	</div>
</div>