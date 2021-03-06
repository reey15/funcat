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
	  background-color: #FFA648;
	  color: white;
	}
	
	#orders {
	  border-collapse: collapse;
	  width: 100%;
	}
	
	#orders th, #orders td {
	  text-align: left;
	  padding: 8px;
	}
	
	#orders tr:nth-child(even){background-color: #f2f2f2}
	
	#orders th {
	  background-color: #FFA648;
	  color: white;
	}
	
	
	</style>
	<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script> 
	<script>
		function update(memeberId) {
			 location.href='update.do?member_id='+memeberId;
        }
		function creator(memeberId) {
			 location.href='creator.do?member_id='+memeberId;
        }
	</script>
</head>

<body style="text-align:center">
 
<h2 style="color:#FF5E00;">Funcat MyPage</h2>
	
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
			
			<button class="button button1" onclick="update('${mypage.member_id}');" input type='submit'>??? ?????? ????????????</button>
				
						  	
			<button class="button button2" onclick="creator('${mypage.member_id}');" input type='submit'>Creator?????? ??????</button>
				
		<table id="members">

		  <tr>
		    <th>??????</th>
		    <th>??????</th>
		  </tr>
		  <tr>
		    <td>?????????</td>
		    <td>${mypage.member_id}</td>
		  </tr>
		  <tr>
		    <td>?????????</td>
		    <td>${mypage.member_name}</td>
		  </tr>
		  <tr>
		    <td>?????????</td>
		    <td>${mypage.member_phone}</td>
		  </tr>
		  <tr>
		    <td>????????? ?????? ??????</td>
		    <td>${mypage.member_email_check}</td>
		  </tr>
		  <tr>
		    <td>????????????</td>
		    <td>${mypage.member_rdate}</td>
		  </tr>
		  <tr>
		    <td>??????????????? ??????</td>
		    <td>${mypage.member_check}</td>
		  </tr>
		
		</table>

	<br>
	<h2 style="color:#FF5E00;">My OrderList </h2> 
	<p>Check my order details : </p>
	
		<table id="orders">
			
			  <tr>
			    <th>????????????</th>
			    <th>???????????????</th>
			    <th>???????????????</th>
			    <th>?????????</th>
			    <th>?????????</th>
			    <th>????????????</th>
			    <th>????????????</th>
			    <th>????????????</th>
			    <th>????????????</th>
			    <th>????????????</th>
			  </tr>
  		 <c:forEach items="${orderList}" var="orderList">
			  <tr>
			    <td>${orderList.order_num}</td>
			    <td>${orderList.addr_num}</td>
			    <td>${orderList.reward_num}</td>
			    <td>${orderList.member_id}</td>
			    <td>${orderList.order_name}</td>
			    <td>${orderList.order_price}</td>
			    <td>${orderList.order_date}</td>
			    <td>${orderList.order_statement}</td>
			    <td>${orderList.order_option}</td>
			    <td>${orderList.order_delivery}</td> 
			  </tr>
		</c:forEach> 
		</table>
		
	</body>
</html>