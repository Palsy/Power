<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="base.util.StringUtil"%>
<%
	int totalRecordCount	= StringUtil.stringToInt(request.getParameter("totalRecordCount"));
	int pageNumber			= StringUtil.stringToInt(request.getParameter("pageNumber"));
	int pageCountPerScreen	= StringUtil.stringToInt(request.getParameter("pageCountPerScreen"));
	int recordCountPerPage	= StringUtil.stringToInt(request.getParameter("recordCountPerPage"));
	
	int totalPageCount = totalRecordCount / recordCountPerPage;
	
	if ((totalRecordCount % recordCountPerPage) != 0) {
		totalPageCount++;
	}
	
	int screenStartPageIndex = ((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen;
	int screenEndPageIndex = (((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) + pageCountPerScreen;
	
	if (screenEndPageIndex > totalPageCount) screenEndPageIndex = totalPageCount;
	
	if (((pageNumber+1) % pageCountPerScreen) == 0)
	{
	    screenStartPageIndex = (((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) - pageCountPerScreen;
	    screenEndPageIndex = pageNumber+1;
	}
%>