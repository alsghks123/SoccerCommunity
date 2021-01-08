<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<script type="text/javascript" src="resources/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">

var oEditors = [];
$(function(){
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
        //SmartEditor2Skin.html 파일이 존재하는 경로
        sSkinURI: "resources/SmartEditor2Skin.html",  
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,         
            fOnBeforeUnload : function(){
                 
            }
        }, 
        fOnAppLoad : function(){
            //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
            oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
        },
        fCreator: "createSEditor2"
    });
    
    //저장버튼 클릭시 form 전송
    $("#save").click(function(){
        oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
        $("#frm").submit();
    });    
});


  
 
</script>

<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<h1 align="center">공지사항 작성페이지</h1>
	<br><br>
	
	<form action="ninsert.do" method ="post" enctype="Multipart/form-data" id ="frm">
		<table align="center" border="1"  width="800">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" size ="50" name="nTitle">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="nWriter" value="${loginUser.id }" readonly>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
			 <textarea rows="10" cols="30" id="ir1" name="nContent" style="width:800px; height:350p"></textarea>





				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="nuploadFile">
				</td>	
			</tr>
			<tr>
				<td colspan="2" align="center">
				 <input type="button" id="save" value="저장"/>

					<input type="reset" value="등록 취소">
				</td>
			</tr>			
		</table>
	</form>
	<p align="center">
		<a href="home.do">시작페이지로 이동</a>
		<a href ="nlist.do">목록으로 이동</a>
	</p>


	
</body>
</html>