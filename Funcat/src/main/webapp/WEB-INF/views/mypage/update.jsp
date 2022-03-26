<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
<style>
	#memup {
	  font-family: Arial, Helvetica, sans-serif;
	  width: 60%;
	  margin-top: 0px;
	  margin-left: auto;
	  margin-right: auto;
	}
	
	#memup td, #memup th {
	  border: 1px solid #ddd;
	  margin: 0px;
	  padding: 4px;
	}
	
	#memup tr:nth-child(even){background-color: #f2f2f2;}
	
	#memup tr:hover {background-color: #ddd;}
	
	#memup th {
	  padding-top: 10px;
	  padding-bottom: 10px;
	  text-align: center;
	  background-color: #FFA648;
	  color: white;
	}
	</style>
</head>

<body style="text-align:center">

<h2 style="color:#FF5E00;">Funcat MyPage Modify</h2>
	
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
		
		.button1 {
		  background-color: white; 
		  color: black; 
		  border: 2px solid #F2CB61;
		}
		
		.button1:hover {
		  background-color: #F2CB61;
		  color: white;
}

	</style>
<form name='input' method='post' action='update.do' >
			
		<table id="memup">

 	<button class="button button1" onclick= "modifycheck();" input type='submit'>수정하기</button>
 			<script>
				 function modifycheck() {
				 alert("수정하시겠습니까?")
				        }
   			</script>
 
		  <tr>
		    <th>구분</th>
		    <th>내용</th>
		  </tr>
		  <tr>
		    <td>아이디</td>
		    <td><input name='member_id' readonly value='${mypage.member_id}'/></td>
		  </tr>
		  <tr>
		    <td>닉네임</td>
		    <td><textarea id='taname' style="resize: none;" name='member_name' rows='1' cols='20' >${mypage.member_name}</textarea></td>
		  </tr>
		  <tr>
		    <td>비밀번호</td>
		    <td><textarea id='tapw' style="resize: none;" name='member_pw' rows='1' cols='20' >${mypage.member_pw}</textarea></td>
		  </tr>
		  <tr>
		    <td>연락처</td>
		    <td><textarea id='taphone' style="resize: none;" name='member_phone' rows='1' cols='20'>${mypage.member_phone}</textarea></td>
		  </tr>
		  <tr>
		    <td>이메일 수신 여부</td>
		    <td>${mypage.member_email_check}</td>
		  </tr>
		  <tr>
		    <td>가입일자</td>
		    <td>${mypage.member_rdate}</td>
		  </tr>
		  <tr>
		    <td>크리에이터 여부</td>
		    <td>${mypage.member_check}</td>
		  </tr>
		  

		</table>
		
		
				
	</body>
</html>