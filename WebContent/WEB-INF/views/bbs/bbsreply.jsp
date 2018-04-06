<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/froala/css/froala_editor.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/froala/css/froala_style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/froala/css/plugins/code_view.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/froala/css/plugins/colors.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/froala/css/plugins/emoticons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/froala/css/plugins/image_manager.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/froala/css/plugins/image.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/froala/css/plugins/line_breaker.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/froala/css/plugins/table.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/froala/css/plugins/char_counter.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/froala/css/plugins/video.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/froala/css/plugins/fullscreen.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/froala/css/plugins/file.css">
<fmt:requestEncoding value="utf-8"/>

<style>
<!--
/* label color */
   .input-field label {
     color: #26a69a;
   }
   /* label focus color */
   .input-field input[type=text]:focus + label {
     color: #26a69a;
   }
   /* label underline focus color */
   .input-field input[type=text]:focus {
     border-bottom: 1px solid #26a69a;
     box-shadow: 0 1px 0 0 #26a69a;
   }
   /* valid color */
   .input-field input[type=text].valid {
     border-bottom: 1px solid #26a69a;
     box-shadow: 0 1px 0 0 #26a69a;
   }
   /* invalid color */
   .input-field input[type=text].invalid {
     border-bottom: 1px solid #26a69a;
     box-shadow: 0 1px 0 0 #26a69a;
   }
   /* icon prefix focus color */
   .input-field .prefix.active {
     color: #26a69a;
   }
-->
</style>

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


<form name="frmForm" id="_frmForm" method="post" action="">
<input type="hidden" name="id" readonly="readonly" value='${login.id}' size="60"/>
<input type="hidden" name="idfilename" value='${login.filename}' />
<input type="hidden" name="seq"   value="${bbs.seq}"/>
<input type="hidden" name='content' id="_content"/>




<div class="row">
     <div class="input-field col s12">
       <input id="icon_prefix" type="text" name="title" size="60"/>
       <label for="icon_prefix">제목</label>
     </div>
   </div>
   
<section id="editor" style="margin-bottom: 20px;">
	<div id='edit' style="margin-top: 30px;">
	</div>
</section>

<input id="_content" type="hidden" class="validate" name="content">



<a href="#none" id="_btnReply" class="btn btn-block">답글달기</a>

</form>

</div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/mode/xml/xml.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/froala_editor.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/align.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/code_beautifier.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/code_view.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/colors.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/draggable.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/emoticons.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/font_size.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/font_family.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/image.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/file.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/image_manager.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/line_breaker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/link.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/lists.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/paragraph_format.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/paragraph_style.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/video.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/table.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/url.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/entities.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/char_counter.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/inline_style.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/save.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/fullscreen.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/js/plugins/quote.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/froala/textversion.js"></script>

<script type="text/javascript">

$(function(){
    $('#edit').froalaEditor({
      theme: 'royal'
    });
  });


$("#_btnReply").click(function() {	
	alert('답글달기');	
	//submitContents($("#_frmForm"));
	
	var html = $('div#edit').froalaEditor('html.get');
	var text = createTextVersion(html);
	console.log(text);
	$("#_content").val(text);
	
	//$("#_frmForm").attr({ "target":"_self", "action":"bbsreplyAf.do" }).submit();
});

//'저장' 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
   // 에디터의 내용이 textarea에 적용된다.
   oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
 
   // 에디터에 입력된 내용의 검증은 이곳에서
   // document.getElementById("ir1").value 값을 이용해서 처리한다.
 
   try{
       // 이 라인은 현재 사용 중인 폼에 따라 달라질 수 있다.
       //elClickedObj.form.submit();
       elClickedObj.submit();
   }catch(e){}
}
</script>
