<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.serverdemo.BoardDAO,org.example.serverdemo.BoardVO,java.util.List,java.text.SimpleDateFormat" %>
<%
    BoardDAO dao = new BoardDAO();
    List<BoardVO> boards = dao.getBoardList();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow-sm">
        <div class="card-body">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-3 gap-2">
                <div>
                    <h1 class="h4 mb-1">게시판 목록</h1>
                    <div class="text-muted">총 게시글 수: <%= boards.size() %></div>
                </div>
                <a href="write.jsp" class="btn btn-primary">새 글 작성</a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-hover align-middle text-center">
                    <thead class="table-light">
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">조회수</th>
                        <th scope="col">작성일</th>
                        <th scope="col">상세보기</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        if (boards.isEmpty()) {
                    %>
                    <tr>
                        <td colspan="6" class="text-muted">등록된 게시글이 없습니다.</td>
                    </tr>
                    <%
                        } else {
                            for (BoardVO b : boards) {
                    %>
                    <tr>
                        <td><%= b.getId() %></td>
                        <td class="text-start"><%= b.getTitle() %></td>
                        <td><%= b.getWriter() %></td>
                        <td><%= b.getCnt() %></td>
                        <td><%= b.getRegDate() != null ? sdf.format(b.getRegDate()) : "" %></td>
                        <td><a href="view.jsp?id=<%= b.getId() %>" class="btn btn-outline-success btn-sm">보기</a></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
