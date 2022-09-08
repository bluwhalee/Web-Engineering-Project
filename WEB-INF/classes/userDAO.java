import java.sql.*;


public class userDAO {
    Connection con = null;
    private static userDAO ud = new userDAO();
    private userDAO(){
        try{
            con = conmake.getConnection();
        }
        catch (Exception ex) 
        {
            System.out.println(ex);
        }
    }
    public static userDAO getUD(){
        return ud;
    }

    public int userLogin(String username, String pass){

        try{
            String query1 = "select * from profile where username=? and password=? and usertype=?";
            PreparedStatement ps = con.prepareStatement(query1);
            ps.setString(1,username);
            ps.setString(2,pass);
            ps.setString(3,"customer");
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                return 1;
            }
            
        }
        catch(Exception e)
            {
                System.out.println(e);
            }
        return 0;

    }
    public int adminLogin(String username, String pass){

        try{
            String query1 = "select * from profile where username=? and password=? and usertype=?";
            PreparedStatement ps = con.prepareStatement(query1);
            ps.setString(1,username);
            ps.setString(2,pass);
            ps.setString(3,"admin");
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                return 1;
            }
            
        }
        catch(Exception e)
            {
                System.out.println(e);
            }
        return 0;

    }
    public int userSignup(String username, String pass,String name){

        try{
            String query1 = "INSERT into profile (username, password, usertype, name) VALUES (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query1);
            ps.setString(1,username);
            ps.setString(2,pass);
            ps.setString(3,"customer");
            ps.setString(4,name);
            ps.executeUpdate();
            return 1;
            
            
        }
        catch(Exception e)
            {
                System.out.println(e);
            }
        return 0;

    }
    
    
}