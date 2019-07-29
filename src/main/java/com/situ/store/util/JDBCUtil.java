package com.situ.store.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

public class JDBCUtil {

    // private static String className = "com.mysql.jdbc.Driver";
    // private static String url =
    // "jdbc:mysql://127.0.0.1:3306/sql_study?useSSL=false&useUnicode=true&characterEncoding=utf8";
    // private static String user = "root";
    // private static String password = "root";
    private static ResourceBundle rb = ResourceBundle.getBundle("com.situ.jsp.util.jdbc");

    private static String className = rb.getString("driver");
    private static String url       = rb.getString("url");
    private static String user      = rb.getString("user");
    private static String password  = rb.getString("pass");

    static {
        try {
            Class.forName(className);// 1、加载驱动：Class.forName("");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获得链接对象
     * 
     * @return Connection
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }

    /**
     * 关闭连接
     * 
     * @param conn
     * @param st
     * @param rs
     */
    public static void close(Connection conn, Statement st, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
                rs = null;
            }
            if (st != null) {
                st.close();
                st = null;
            }
            if (conn != null) {
                conn.close();
                conn = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 关闭连接
     * 
     * @param connection
     * @param statement
     */
    public static void close(Connection connection, Statement statement) {
        close(connection, statement, null);
    }

    public static void main(String[] args) throws SQLException {
        Connection con = JDBCUtil.getConnection();
        System.out.println(con);
        JDBCUtil.close(con, null);
    }

    private JDBCUtil() {
    }

}
