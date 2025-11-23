package org.example.serverdemo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
    private static final String INSERT = "INSERT INTO BOARD(title, writer, content) VALUES(?,?,?)";
    private static final String LIST = "SELECT id, title, writer, content, regdate, cnt FROM BOARD ORDER BY id DESC";
    private static final String GET = "SELECT id, title, writer, content, regdate, cnt FROM BOARD WHERE id=?";
    private static final String UPDATE = "UPDATE BOARD SET title=?, content=? WHERE id=?";
    private static final String DELETE = "DELETE FROM BOARD WHERE id=?";

    public int insertBoard(BoardVO vo) {
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT)) {
            ps.setString(1, vo.getTitle());
            ps.setString(2, vo.getWriter());
            ps.setString(3, vo.getContent());
            return ps.executeUpdate();
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

    public BoardVO getBoard(int id) {
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(GET)) {
            ps.setInt(1, id);
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
            ps.setInt(3, vo.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("updateBoard 실패", e);
        }
    }

    public void deleteBoard(int id) {
        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(DELETE)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("deleteBoard 실패", e);
        }
    }

    private BoardVO mapRow(ResultSet rs) throws SQLException {
        BoardVO vo = new BoardVO();
        vo.setId(rs.getInt("id"));
        vo.setTitle(rs.getString("title"));
        vo.setWriter(rs.getString("writer"));
        vo.setContent(rs.getString("content"));
        vo.setRegDate(rs.getTimestamp("regdate"));
        vo.setCnt(rs.getInt("cnt"));
        return vo;
    }
}
