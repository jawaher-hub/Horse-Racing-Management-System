package functions;
import java.sql.*;
public class AdminFunctions {

    public static boolean addNewRace(String raceId, String raceName, String trackName,
                                     String raceDate, String raceTime) {
        try {
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/HorseRacing", "root", "1234");

            String sql = "INSERT INTO Race (raceId, raceName, trackName, raceDate, raceTime) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, raceId);
            pstmt.setString(2, raceName);
            pstmt.setString(3, trackName);
            pstmt.setString(4, raceDate);
            pstmt.setString(5, raceTime);

            int sts = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return sts > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static boolean deleteOwner(String ownerId) {
        try {
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/HorseRacing", "root", "1234");

            String sql = "CALL DeleteOwner(?)";
            CallableStatement cstmt = conn.prepareCall(sql);
            cstmt.setString(1, ownerId);
            cstmt.execute();
            cstmt.close();
            conn.close();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static boolean moveHorse(String horseId, String newStableId) {
        try {
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/HorseRacing", "root", "1234");

            String sql = "UPDATE Horse SET stableId = ? WHERE horseId = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, newStableId);
            pstmt.setString(2, horseId);

            int sts = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return sts > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean approveTrainer(String trainerId, String firstName, String lastName, String stableId) {
        try {
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/HorseRacing", "root", "1234");

            String sql = "INSERT INTO Trainer (trainerId, fname, lname, stableId) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, trainerId);
            pstmt.setString(2, firstName);
            pstmt.setString(3, lastName);
            pstmt.setString(4, stableId);
            int sts = pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            return sts > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean checkId(String tableName, String idColumn, String id) {
        try {
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/HorseRacing", "root", "1234");

            String sql = "SELECT COUNT(*) FROM " + tableName + " WHERE " + idColumn + " = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);

            ResultSet rs = pstmt.executeQuery();
            rs.next();
            int count = rs.getInt(1);

            rs.close();
            pstmt.close();
            conn.close();

            return count > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}