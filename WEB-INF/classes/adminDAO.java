import java.sql.*;

public class adminDAO {
    Connection con = null;
    private static adminDAO ad = new adminDAO();

    private adminDAO() {
        try {
            con = conmake.getConnection();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public static adminDAO getAD() {
        return ad;
    }

    public ResultSet allorders() {
        ResultSet rs = null;

        try {
            String query1 = "SELECT * FROM orders";
            PreparedStatement ps = con.prepareStatement(query1);
            rs = ps.executeQuery();

        } catch (Exception e) {
            System.out.println(e);
        }

        return rs;
    }
    public ResultSet allparts() {
        ResultSet rs = null;

        try {
            String query1 = "SELECT * FROM parts";
            PreparedStatement ps = con.prepareStatement(query1);
            rs = ps.executeQuery();

        } catch (Exception e) {
            System.out.println(e);
        }

        return rs;
    }
    public ResultSet allusers() {
        ResultSet rs = null;

        try {
            String query1 = "SELECT * FROM profile";
            PreparedStatement ps = con.prepareStatement(query1);
            rs = ps.executeQuery();

        } catch (Exception e) {
            System.out.println(e);
        }

        return rs;
    }

   

}