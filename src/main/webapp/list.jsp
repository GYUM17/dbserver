<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.example.serverdemo.BoardDAO,org.example.serverdemo.BoardVO,java.util.List,java.text.SimpleDateFormat" %>
<%
    request.setCharacterEncoding("UTF-8");
    String q = request.getParameter("q");
    BoardDAO dao = new BoardDAO();
    List<BoardVO> boards = dao.getBoardList(q);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<jsp:include page="top.jsp" />
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-3 gap-2">
        <div>
            <h1 class="h4 mb-1">게시판 목록</h1>
            <div class="text-muted">총 게시글 수: <%= boards.size() %></div>
        </div>
        <a href="write.jsp" class="btn btn-primary">새 글 작성</a>
    </div>

    <div class="card shadow-sm mb-3">
        <div class="card-body">
            <form class="row g-2 align-items-center" method="get" action="list.jsp">
                <div class="col-sm-8 col-md-6">
                    <input type="text" class="form-control" name="q" placeholder="제목/내용/작성자 검색" value="<%= q != null ? q : "" %>">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-outline-primary">검색</button>
                    <a href="list.jsp" class="btn btn-light">초기화</a>
                </div>
            </form>
        </div>
    </div>

    <div class="card shadow-sm">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover align-middle text-center">
                    <thead class="table-light">
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">조회수</th>
                        <th scope="col">작성일</th>
                        <th scope="col">액션</th>
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
                        <td class="text-start"><a href="view.jsp?id=<%= b.getId() %>" class="text-decoration-none"><%= b.getTitle() %></a></td>
                        <td><%= b.getWriter() %></td>
                        <td><%= b.getCnt() %></td>
                        <td><%= b.getRegDate() != null ? sdf.format(b.getRegDate()) : "" %></td>
                        <td class="d-flex justify-content-center gap-2">
                            <a href="view.jsp?id=<%= b.getId() %>" class="btn btn-outline-success btn-sm">보기</a>
                            <a href="edit.jsp?id=<%= b.getId() %>" class="btn btn-outline-primary btn-sm">수정</a>
                            <a href="delete.jsp?id=<%= b.getId() %>" class="btn btn-outline-danger btn-sm" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
                        </td>
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
<jsp:include page="bottom.jsp" />
