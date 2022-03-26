<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
<style>
	#members {
	  font-family: Arial, Helvetica, sans-serif;
	  width: 60%;
	  margin-top: 0px;
	  margin-left: auto;
	  margin-right: auto;
	}
	
	#members td, #members th {
	  border: 1px solid #ddd;
	  margin: 0px;
	  padding: 4px;
	}
	
	#members tr:nth-child(even){background-color: #f2f2f2;}
	
	#members tr:hover {background-color: #ddd;}
	
	#members th {
	  padding-top: 10px;
	  padding-bottom: 10px;
	  text-align: center;
	  background-color: #F29661;
	  color: white;
	}

	</style>
	
	<script src="/js/jquery-3.3.1.min.js"></script>
	<script>
		function modifycheck(memberId)
		{	
				if (confirm("수정하시겠습니까??") == true){    //확인				
					 $.post( "projectdetailupdate.do", { 
						 project_num: ${mypage.project_num},
						 project_sub: document.getElementById('taname').value
						 } )
					  .done(function( data ) {
					   		if(data == "ok"){
					   			location.href='creator.do?member_id='+ memberId;
					   		}
					  });			
				 }else{   //취소				
				     return false;			
				 }	
		}
		
	</script>
</head>

<body style="text-align:center">
 
		<style>
		.button {
		  background-color: #FFCD12;
		  border: none;
		  color: white;
		  padding: 5px 15px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 15px;
		  margin: 4px 2px;
		  transition-duration: 0.4s;
		  cursor: pointer;
		}
		
		.button2 {
		  background-color: white; 
		  color: black; 
		  border: 2px solid #F29661;
		}
		
		.button2:hover {
		  background-color: #F29661;
		  color: white;
}
			
	</style>

	<h2 style="color:#FF5E00;">Funcat My Project Modify </h2> 
	<p>Check my project modify : </p>
	<button class="button button2" onclick= "modifycheck('${mypage.member_id}');"">정보 수정하기</button>
		<table id="members">

		  <tr>
		    <th>구분</th>
		    <th>내용</th>
		  </tr>
		  <tr>
		    <td>프로젝트 번호</td>
		    <td>${mypage.project_num}</td>
		  </tr>
		  <tr>
		    <td>프로젝트 제목</td>
		    <td><textarea id='taname' style="resize: none;" name='member_name' rows='1' cols='20' >${mypage.project_sub}</textarea></td>
		  </tr>
		  <tr>
		    <td>목표금액</td>
		    <td>${mypage.project_goal}</td>
		  </tr>
		  <tr>
		    <td>요약</td>
		    <td>${mypage.project_comment}</td>
		  </tr>
		  <tr>
		    <td>스토리</td>
		    <td>${mypage.project_detail}</td>
		  </tr>
		  <tr>
		    <td>후원금액</td>
		    <td>${mypage.project_price}</td>
		  </tr>
		  <tr>
		    <td>프로젝트 오픈일</td>
		    <td>${mypage.project_open}</td>
		  </tr>
		  <tr>
		    <td>프로젝트 종료일</td>
		    <td>${mypage.project_close}</td>
		  </tr>
		  <tr>
		    <td>작성일</td>
		    <td>${mypage.project_date}</td>
		  </tr>
		  <tr>
		    <td>수정일</td>
		    <td>${mypage.project_mdate}</td>
		  </tr>
		  <tr>
		    <td>프로젝트 단계</td>
		    <td>${mypage.project_level}</td>
		  </tr>
		  
		</table>
				
	</body>
</html>