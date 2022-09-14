import java.sql.*;

public class orderDAO {
    Connection con = null;
    private static orderDAO oa = new orderDAO();

    private orderDAO() {
        try {
            con = conmake.getConnection();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public static orderDAO getOD() {
        return oa;
    }

    public int addorder(String package1, String model, String cpu, String gpu, String hdd, String ram, String body,
            String paint,
            String display, String wash,
            String status,
            String username, int total) {
        int rs = 1;

        try {
            String query1 = "INSERT INTO orders (package, model, cpu, gpu, hdd, ram, body, paint, display, wash, status, username, total)VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query1);
            ps.setString(1, package1);
            ps.setString(2, model);
            ps.setString(3, cpu);
            ps.setString(4, gpu);
            ps.setString(5, hdd);
            ps.setString(6, ram);
            ps.setString(7, body);
            ps.setString(8, paint);
            ps.setString(9, display);
            ps.setString(10, wash);
            ps.setString(11, status);
            ps.setString(12, username);
            ps.setInt(13, total);
            rs = ps.executeUpdate();

            // if (rs.next( ) ) {
            // String name = rs.getString("username");
            // String add = rs.getString("address");
            // String pNum = rs.getString("phone");
            // person = new PersonInfo(name, add, pNum);
            // }

        } catch (Exception e) {
            System.out.println(e);
        }

        return rs;
    }

    public int changeorderstatus(int orderid, String nstatus) {
        int rs = 0;

        try {

            String orderr = String.valueOf(orderid);

            String query1 = "update orders set status=? where orderid=?";
            PreparedStatement ps = con.prepareStatement(query1);
            ps.setString(1, nstatus);
            ps.setString(2, orderr);
            rs = ps.executeUpdate();

            rs = 1;

        } catch (Exception e) {
            System.out.println(e);
        }
        return rs;
    }
    public int completeorder(int orderid) {
        int rs = 0;

        try {

            

            String query1 = "update orders set status=? where orderid=?";
            PreparedStatement ps = con.prepareStatement(query1);
            ps.setString(1, "Completed");
            ps.setInt(2, orderid);
            ps.executeUpdate();
            query1 = "select * from orders where status=? and orderid=?";
            ps = con.prepareStatement(query1);
            ps.setString(1, "Completed");
            ps.setInt(2, orderid);
            ResultSet rset = ps.executeQuery();
            
            if(rset.next())
            {   
                query1 = "select * from parts";
                ps = con.prepareStatement(query1);
                ResultSet rset2 = ps.executeQuery();
                rset2.next();
                
                int cpu = rset2.getInt("cpu");
                int gpu = rset2.getInt("gpu");
                int hdd = rset2.getInt("hdd");
                int ram = rset2.getInt("ram");
                int body = rset2.getInt("body");
                int display = rset2.getInt("display");
                
                


                if((rset.getString("package")).equals("Complete Repair"))
                {   
                    
                    if(rset.getString("cpu") != null){
                        
                        if(cpu < 1){ return 0;}
                        cpu = cpu-1;
                        
                    }
                    if(rset.getString("gpu") != null)
                    {
                        if(gpu < 1){ return 0;}
                        gpu = gpu-1;
                    }
                    if(rset.getString("hdd") != null)
                    {
                        if(hdd < 1){ return 0;}
                         hdd = hdd-1;
                    }
                    if(rset.getString("ram") != null)
                    {
                        
                        if(ram < 1){ return 0;}
                        ram = ram -1;
                    }
                    
                }
                if(rset.getString("package").equals("Cosmic Repair"))
                {
                    rs = 5;
                    if(rset.getString("body") != null){
                        
                        if(body < 1){ return 0;}
                        body = body-1;
                    }
                    if(rset.getString("display") != null)
                    {
                        if(display < 1){ return 0;}
                        display = display-1;
                    }
                }
                
                query1 = "UPDATE parts SET cpu=?,gpu=?,hdd=?,ram=?,body=?,display=?";
                ps = con.prepareStatement(query1);
                ps.setInt(1,cpu);
                ps.setInt(2,gpu);
                ps.setInt(3,hdd);
                ps.setInt(4,ram);
                ps.setInt(5,body);
                ps.setInt(6,display);
                rs = ps.executeUpdate();
                rs = 1;
                
            }
        }
        
        catch (Exception e) 
        {
            System.out.println(e);
        }
        return rs;
    }

    public ResultSet searchuser(String userid) {
        ResultSet rs = null;

        try {

            String query1 = "select * from orders where username=?";
            PreparedStatement ps = con.prepareStatement(query1);
            ps.setString(1, userid);
            rs = ps.executeQuery();

        } catch (Exception e) {
            System.out.println(e);
        }
        return rs;
    }

    public int deleteorder(String orderid) {
        int rs = 0;
        try {
            String query1 = "";
            if(orderid.equals("*"))
            {
                query1 = "delete from orders";
            }
            else
            {
                int oid = Integer.parseInt(orderid);
                query1 = "DELETE  FROM orders WHERE orderid='" + oid + "'";
            }
            Statement s = con.createStatement();
            rs = s.executeUpdate(query1);

            rs = 1;

        } catch (Exception e) {
            System.out.println(e);
        }
        return rs;
    }

    public String dashmaker(String s) {
        if (s.equals("null")) {
            return "-";
        }
        return s;
    }

}