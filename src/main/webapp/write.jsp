<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="top.jsp" />
    <div class="card shadow-sm mx-auto" style="max-width: 720px;">
        <div class="card-body">
            <h1 class="h4 text-center mb-4">새 글 작성</h1>
            <form action="write_ok.jsp" method="post" class="needs-validation" novalidate>
                <div class="mb-3">
                    <label class="form-label">제목</label>
                    <input type="text" class="form-control" name="title" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">작성자</label>
                    <input type="text" class="form-control" name="writer" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">내용</label>
                    <textarea class="form-control" name="content" rows="8" required></textarea>
                </div>
                <div class="d-flex justify-content-center gap-2 pt-3">
                    <button type="submit" class="btn btn-primary px-4">저장</button>
                    <a href="list.jsp" class="btn btn-outline-secondary px-4">취소(목록)</a>
                </div>
            </form>
        </div>
    </div>
<jsp:include page="bottom.jsp" />
