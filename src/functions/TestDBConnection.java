package functions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestDBConnection {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/HorseRacing";
        String user = "root";
        String password = "1234";

        try {
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connected to the database!");
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
