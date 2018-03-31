<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<title>Booki</title>		
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/materialize/css/materialize.css">
		
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery.cookie.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/materialize/js/materialize.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/go_url.js"></script>
		<!-- 
			 <script type="text/javascript" src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
		 -->

		 <script>
		 var elem = document.querySelector('.sidenav');
			var instance = M.Sidenav.init(elem, 'left');

		  // Or with jQuery

		  $(document).ready(function(){
		    $('.sidenav').sidenav();
		  });
		 </script>