<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,org.example.serverdemo.JDBCUtil" %>
<%
    String msg;
    try (Connection conn = JDBCUtil.getConnection()) {
        boolean ok = (conn != null && !conn.isClosed());
        msg = "DB 연결 " + (ok ? "성공" : "실패(커넥션이 null 또는 닫힘)");
    } catch (Exception e) {
        msg = "DB 연결 실패: " + e.getClass().getSimpleName() + " - " + e.getMessage();
        e.printStackTrace();
    }
    out.println(msg);
%>
