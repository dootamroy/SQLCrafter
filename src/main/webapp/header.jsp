<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Crafter.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    try {
    	System.out.println("INSIDE header.JSP");
    	
        // Retrieve the user from the request attribute
        HttpSession crafterSession1 = request.getSession();
        UserModel userCrafter = (UserModel) crafterSession1.getAttribute("user");
		
        String strUser = "";
        boolean sessionExistFlag=false;
        // Check if the user is authenticated
        if (userCrafter == null) {
            //response.sendRedirect("login.jsp");
            //return;
        	strUser="Invalid User";
            
        }
        else{
        	System.out.println("Inside header.jsp User::: "+ userCrafter.getUsername());
        	strUser=userCrafter.getUsername();
        	sessionExistFlag=true;
        }
        
        
%>
<!-- Bootstrap Header -->
<nav class="navbar navbar-expand-lg navbar-light sticky-top">
    <div class="container">
        <a class="navbar-brand text-white" href="http://localhost:8080/SQLCrafter/home.jsp">SQL Crafter</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link text-white" href="${pageContext.request.contextPath}/account">Welcome, <%= strUser %></a>
                </li>
                <%if(sessionExistFlag){ %>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/logout" method="post" class="d-inline">
                        <input type="submit" class="btn btn-link text-white nav-link" value="Logout">
                    </form>
                </li>
                <%}else{ %>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/login" method="post" class="d-inline">
                        <input type="submit" class="btn btn-link text-white nav-link" value="Login">
                    </form>
                </li>
                <%} %>
            </ul>
        </div>
    </div>
</nav>

<%
    } catch (Exception e) {
        // Handle exceptions (e.g., logging, redirecting to an error page)
        System.out.println("INSIDE header.JSP Excp");
        e.printStackTrace(System.out);
        // You may want to redirect to an error page here
        response.sendRedirect("error.jsp");
    }
%>
