<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Simple Board</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body { background: #f7f8fb; }
        .nav-brand { font-weight: 700; letter-spacing: -0.2px; }
        main { min-height: 70vh; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-white border-bottom shadow-sm-sm">
    <div class="container">
        <a class="navbar-brand nav-brand" href="list.jsp">Simple Board</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navMenu">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="list.jsp">목록</a></li>
                <li class="nav-item"><a class="nav-link" href="write.jsp">글쓰기</a></li>
            </ul>
            <div class="d-flex gap-2">
                <a class="btn btn-outline-primary btn-sm" href="dbtest.jsp">DB 테스트</a>
                <a class="btn btn-primary btn-sm" href="write.jsp">새 글</a>
            </div>
        </div>
    </div>
</nav>
<main class="container py-4">
