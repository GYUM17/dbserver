package org.example.serverdemo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
    private static final String INSERT = "INSERT INTO board(title, writer, content) VALUES(?,?,?)";
    private static final String LIST = "SELECT seq, title, writer, content, regdate, cnt FROM board ORDER BY seq DESC";
    private static final String GET = "SELECT seq, title, writer, content, regdate, cnt FROM board WHERE seq=?";
    private static final String UPDATE = "UPDATE board SET title=?, content=? WHERE seq=?";
    private static final String DELETE = "DELETE FROM board WHERE seq=?";

    public void insertBoard(BoardVO vo) {
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT)) {
            ps.setString(1, vo.getTitle());
            ps.setString(2, vo.getWriter());
            ps.setString(3, vo.getContent());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("insertBoard 실패", e);
        }
    }

    public List<BoardVO> getBoardList() {
        List<BoardVO> list = new ArrayList<>();
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(LIST);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(mapRow(rs));
        } catch (SQLException e) {
            throw new RuntimeException("getBoardList 실패", e);
        }
        return list;
    }

    public BoardVO getBoard(int seq) {
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(GET)) {
            ps.setInt(1, seq);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapRow(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException("getBoard 실패", e);
        }
        return null;
    }

    public void updateBoard(BoardVO vo) {
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE)) {
            ps.setString(1, vo.getTitle());
            ps.setString(2, vo.getContent());
            ps.setInt(3, vo.getSeq());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("updateBoard 실패", e);
        }
    }

    public void deleteBoard(int seq) {
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(DELETE)) {
            ps.setInt(1, seq);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("deleteBoard 실패", e);
        }
    }

    private BoardVO mapRow(ResultSet rs) throws SQLException {
        BoardVO vo = new BoardVO();
        vo.setSeq(rs.getInt("seq"));
        vo.setTitle(rs.getString("title"));
        vo.setWriter(rs.getString("writer"));
        vo.setContent(rs.getString("content"));
        vo.setRegDate(rs.getTimestamp("regdate"));
        vo.setCnt(rs.getInt("cnt"));
        return vo;
    }
}
