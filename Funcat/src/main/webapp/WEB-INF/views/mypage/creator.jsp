<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
<style>
	#creator {
	  font-family: Arial, Helvetica, sans-serif;
	  width: 60%;
	  margin-top: 0px;
	  margin-left: auto;
	  margin-right: auto;
	}
	
	#creator td, #creator th {
	  border: 1px solid #ddd;
	  margin: 0px;
	  padding: 4px;
	}
	
	#creator tr:nth-child(even){background-color: #f2f2f2;}
	
	#creator tr:hover {background-color: #ddd;}
	
	#creator th {
	  padding-top: 10px;
	  padding-bottom: 10px;
	  text-align: center;
	  background-color: #F29661;
	  color: white;
	}
	
	#projectlist {
	  border-collapse: collapse;
	  width: 100%;
	}
	
	#projectlist th, #projectlist td {
	  text-align: left;
	  padding: 8px;
	}
	
	#projectlist tr:nth-child(even){background-color: #f2f2f2}
	
	#projectlist th {
	  background-color: #F29661;
	  color: white;
	}
	
	
	</style>
	<script src="/js/jquery-3.3.1.min.js"></script>
	<script>
		function deletecheck(project_num,member_id)
		{	
				 if (confirm("정말 삭제하시겠습니까??") == true){    //확인				
					 $.get( "del.do", { project_num: project_num, member_id: member_id } )
					  .done(function( data ) {
					   		if(data == "ok"){
					   			location.reload();
					   		}
					  });			
				 }else{   //취소				
				     return false;			
				 }	
		}
		
		function projectmodify(project_num)
		{	
				 if (confirm("수정하시겠습니까??") == true){    //확인	
					 
					 location.href="projectdetail.do?project_num="+project_num;			
				 }else{   //취소				
				     return false;			
				 }	
		}
	</script>
</head>


<body style="text-align:center">
 
<h2 style="color:#FF5E00;">Funcat Creator</h2>
	
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
			
		<!-- 버튼자리 -->
						  	
		<table id="creator">

		  <tr>
		    <th>구분</th>
		    <th>내용</th>
		  </tr>
		  <tr>
		    <td>크리에이터번호</td>
		    <td>${mypage.creator_num}</td>
		  </tr>
		  <tr>
		    <td>사업자구분</td>
		    <td>${mypage.creator_type}</td>
		  </tr>
		  <tr>
		    <td>연락처</td>
		    <td>${mypage.creator_phone}</td>
		  </tr>
		  <tr>
		    <td>개인정보 수집 동의 여부</td>
		    <td>${mypage.creator_check}</td>
		  </tr>
		  <tr>
		    <td>크리에이터 이름</td>
		    <td>${mypage.creator_name}</td>
		  </tr>
		
		</table>
		

	<br>
	<h2 style="color:#FF5E00;">My Project </h2> 
	<p>Check my project details : </p>
	
		<table id="projectlist">
			
			  <tr>
			    <th>제목</th>
			    <th>목표금액</th>
			    <th>후원금액</th>
			    <th>오픈일</th>
			    <th>종료일</th>
			    <th>수정일</th>
			    <th>단계</th>
			    <th></th>
			  </tr>
		 <c:forEach items="${projectlist}" var="projectlist">
			  <tr>	
			  
			    <td>${projectlist.project_sub}</a></td>
			    <td>${projectlist.project_goal}</td>
			    <td>${projectlist.project_price}</td>
			    <td>${projectlist.project_open}</td>
			    <td>${projectlist.project_close}</td> 
			    <td>${projectlist.project_mdate}</td> 
			    <td>${projectlist.project_level}</td> 
			    <td><button onclick= "projectmodify('${projectlist.project_num}');">수정</button> <button onclick= "deletecheck('${projectlist.project_num}','${projectlist.member_id}');">삭제</button></td> 
			  </tr>
		</c:forEach>
		</table>
		
		
				
	</body>
</html>