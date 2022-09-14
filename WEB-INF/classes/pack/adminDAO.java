import java.sql.*;

public class adminDAO {

    static Connection con = null;

    static{
        try {
            con = conmake.getConnection();
        } catch (Exception ex) {
            System.out.println(ex);
        } 
    }
    private adminDAO() {
        
    }

    

    public static ResultSet allorders() {
        ResultSet rs = null;

        try {
            String url = "jdbc:mysql://127.0.0.1/rsm";
            String user = "root";
            String pass = "root";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(url, user, pass);
            }
            catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
            String query1 = "SELECT * FROM orders";
            PreparedStatement ps = con.prepareStatement(query1);
            rs = ps.executeQuery();

        } catch (Exception e) {
            System.out.println(e);
        }

        return rs;
    }

   

}