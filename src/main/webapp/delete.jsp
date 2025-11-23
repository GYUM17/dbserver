<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.serverdemo.BoardDAO" %>
<%
    request.setCharacterEncoding("UTF-8");
    String idParam = request.getParameter("id");
    boolean success = false;
    String msg;
    if (idParam == null || idParam.isEmpty()) {
        msg = "삭제할 글의 id가 없습니다.";
    } else {
        try {
            int id = Integer.parseInt(idParam);
            BoardDAO dao = new BoardDAO();
            dao.deleteBoard(id);
            success = true;
            msg = "글이 삭제되었습니다.";
        } catch (NumberFormatException e) {
            msg = "id 파라미터가 올바르지 않습니다.";
        } catch (Exception e) {
            msg = "삭제 중 오류가 발생했습니다: " + e.getMessage();
        }
    }
%>
<jsp:include page="top.jsp" />
    <div class="card shadow-sm mx-auto" style="max-width: 520px;">
        <div class="card-body text-center">
            <h1 class="h5 mb-3">글 삭제</h1>
            <p class="text-secondary mb-4"><%= msg %></p>
            <div class="d-flex justify-content-center gap-2">
                <a href="list.jsp" class="btn btn-primary">목록으로</a>
            </div>
        </div>
    </div>
<jsp:include page="bottom.jsp" />
