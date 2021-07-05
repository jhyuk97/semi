<%@page import="java.util.Map"%>
<%@page import="dto.Certification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/layout/bootHeader.jsp" %>
<%@ include file="/WEB-INF/views/layout/bootNavigation.jsp" %>

<% 
List<Member> memberlist = new ArrayList<>(); 
List<Certification> certificationList = new ArrayList<>();
Map<String, Object> map = (Map<String, Object>)request.getAttribute("result");

memberlist = (List)map.get("memberList");
certificationList = (List)map.get("certificationList");

%>
<style type="text/css">
.container{
width:900px;
}


th{
background-color: #A8201A;
}

#move:hover tbody tr:hover td{
background:#143642;
color:#FFFFFF;
}

#btnTitle{
background-color: #143642;
color: white;
border-radius: 4px;
}

.right{

margin:0px 3px 5px 3px;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	//리스트
	$("#btnList").click(function(){
		$(location).attr("href","/user/challenge/view?chNo=<%=(Integer)session.getAttribute("chNo")%>");
		
	})
	$("#btnEnd").click(function(){
		if(confirm("정말로 챌린지를 종료하시겠습니까?")){
			$(location).attr("href","/founder/challenge/end");
		}	
	})
	
})
</script>


<div class="container">
<div>
	<div class="left" style="font-size:30px; font-weight:bold;">참가자 인증 목록 </div>
	<div><span>&nbsp</span></div>	
	<div><span>&nbsp</span></div>
	<div><hr></div>
</div>


<table class="table table-striped table-hover table-condensed text-center">
<tr>
	<th style="width: 20%; text-align:center;">인증번호</th>
	<th style="width: 20%; text-align:center;">아이디</th>
	<th style="width: 20%; text-align:center;">이름</th>
	<th style="width: 20%; text-align:center;">닉네임</th>
	<th style="width: 20%; text-align:center;">인증</th>
</tr>
<%	for(int i=0; i<memberlist.size(); i++) { %>
<tr>
	<td><%=certificationList.get(i).getCeNo() %></td>
	<td><%=memberlist.get(i).getUid() %></td>
	<td><%=memberlist.get(i).getUsername() %></td>
	<td><%=memberlist.get(i).getNick() %></td>
	<%if("W".equals(certificationList.get(i).getCeIsSuccess())){ %>
		<td><a href="/founder/certification/view?ceNo=<%=certificationList.get(i).getCeNo() %>" style="color:black;">대기</a></td>
	<%}else if("Y".equals(certificationList.get(i).getCeIsSuccess())){ %>
		<td><a href="/founder/certification/view?ceNo=<%=certificationList.get(i).getCeNo() %>" style="color:blue;">성공</a><td>
	<%}else if("N".equals(certificationList.get(i).getCeIsSuccess())){ %>
		<td><a href="/founder/certification/view?ceNo=<%=certificationList.get(i).getCeNo() %>" style="color:red;">실패</a></td>
	<%} %>
</tr>
<%	} %>
</table>
<div>	
	<button type="button" id="btnEnd" class="btn btn-info" style="float:left;">챌린지 종료</button>
	<button type="button" id="btnList" class="btn btn-info" style="float:right;">돌아가기</button>
</div>

</div>

<%@ include file="/WEB-INF/views/userFounderCertification/founderCertificationPaging.jsp" %>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>