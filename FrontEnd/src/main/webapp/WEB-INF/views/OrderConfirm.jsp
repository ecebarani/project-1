<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>

<title>YourOrder</title>
</head>
<body>
<%@include file="Headerpage.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container">
<table class="table table-bordered">

<tr>
  <td><center> your cart</center></td>
</tr>

<tr>
  <td>ProductImage</td>
  <td>Quantity</td>
  <td>Subtotal</td>
</tr>

<c:forEach items="${cartList}" var="cartItem">
 
 <tr> 
 <td><img src="<c:url value="/resources/images/${cartItem.productId}.jpg"/>" width="100" height="100"/></td>
 
 <td>${cartItem.quantity }</td>
 <td>${cartItem.subtotal}</td>
 </tr>
 </c:forEach>

<tr>
  
  <td colspan="2">Grand Total</td>
  <td>Rs.${grandTotal}/-</td>

</tr>
</table>

<form action="<c:url value="/PaymentConfirm"/>" method="get">

  <tr>
    <td>Payment Option</td>
  </tr>
  
  <tr>
    <td>
    <input type="radio" name="mode" value="card"/>CreditCard
    <input type="radio" name="mode" value="online"/>NetBanking 
    <input type="radio" name="mode" value="cash"/>Cash On Delivery
    </td>
  </tr>
  
  <tr>
    <td>Shipping Address</td> 
    <td><textarea name="ShippingAdress" ></textarea></td>
  </tr> 
  
  <tr>
    <td><input type="submit" value="Pay" /></td>
  </tr>  
  </form>
</table>
</form>
</div>
<%@include file="Footer.jsp" %>

</body>
</html>