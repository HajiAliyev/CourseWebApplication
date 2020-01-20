package az.lesson.course.dao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;

public class DBHelper {
    public static Connection getConnection() throws Exception{

        Context context = new InitialContext();
        DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Course");
        Connection c = dataSource.getConnection();
        return c;
    }


}
