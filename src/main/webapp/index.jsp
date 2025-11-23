<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String redirectUrl = "list.jsp";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판으로 이동</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm mx-auto text-center" style="max-width: 520px;">
        <div class="card-body">
            <div class="spinner-border text-primary mb-3" role="status" aria-hidden="true"></div>
            <h1 class="h4 mb-2">게시판으로 이동합니다</h1>
            <p class="text-muted mb-3">잠시만 기다려주세요. 자동으로 목록 페이지로 이동합니다.</p>
            <a href="<%= redirectUrl %>" class="btn btn-primary">목록 바로가기</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    setTimeout(function () {
        window.location.href = '<%= redirectUrl %>';
    }, 800);
</script>
</body>
</html>
