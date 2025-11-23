<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.serverdemo.BoardDAO,org.example.serverdemo.BoardVO" %>
<%
    request.setCharacterEncoding("UTF-8");
    BoardVO vo = new BoardVO();
    vo.setTitle(request.getParameter("title"));
    vo.setWriter(request.getParameter("writer"));
    vo.setContent(request.getParameter("content"));

    BoardDAO dao = new BoardDAO();
    int result = dao.insertBoard(vo);
    String msg = (result > 0) ? "글이 등록되었습니다." : "등록에 실패했습니다.";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글 작성 결과</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm mx-auto" style="max-width: 640px;">
        <div class="card-body text-center">
            <h1 class="h4 mb-3">글 작성 결과</h1>
            <p class="text-secondary"><%= msg %></p>
            <div class="d-flex justify-content-center gap-2 mt-3">
                <a href="list.jsp" class="btn btn-primary">목록으로</a>
                <a href="write.html" class="btn btn-outline-secondary">다시 작성</a>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    // 성공 시 자동 이동
    if (<%= result > 0 %>) {
        setTimeout(function () { window.location.href = 'list.jsp'; }, 600);
    }
</script>
</body>
</html>
