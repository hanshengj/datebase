import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import javax.sql.DataSource;
import java.sql.*;

/**
 * Crtated with IntelliJ IDEA.
 * Destcription:
 * User: hp
 * Date: 2021-03-16
 * Time: 22:16
 */
public class TestDemo {
    public static void main1(String[] args) throws ClassNotFoundException, SQLException {

        //1、加载驱动
        Class.forName("com.mysql.jdbc.Driver");

        //2、获取连接
        String url = "jdbc:mysql://127.0.0.1:3306/textd?useSSL=false";
        //127.0.0.1为主机号，确定在哪一台服务器上,本机的默认ID为127.0.0.1
        // 3306为端口号，确定服务器上的哪个程序，MySQL默认为3306
        // textd自己的一个数据库名
        String username = "root";//数据库的名称
        String password = "zhwsjj";//数据库的密码
        Connection connection =
                DriverManager.getConnection(url, username, password);

        //3.执行SQL语句
        String sql = "select * from user ";//user是自己数据库下的一个表
        //String sql = "select * from user where name = 'bit' and password='123' ";

        Statement statement = connection.createStatement();

        //结果集
        ResultSet resultSet = statement.executeQuery(sql);

//        //只能读一条记录
//        if(resultSet.next()) {
//            //查询的下表是从1开始的不是从0开始的
//            System.out.println(resultSet.getInt(1));
//            System.out.println(resultSet.getString(2));
//            System.out.println(resultSet.getString(3));
//        }


        User user = new User();
        //能读多条记录，下面的也一样
        while (resultSet.next()) {
            user.setId(resultSet.getInt(1));
            user.setName(resultSet.getString(2));
            user.setPassword(resultSet.getString(3));
            System.out.println(user);
        }


//        while (resultSet.next()) {
//            int id = resultSet.getInt("id");
//            String name = resultSet.getString("name");
//            String password1 = resultSet.getString("password");
//            System.out.println(String.format("user: id=%d, sn=%s, name=%s", id, name, password));
//
//        }


        //下面的命令都是用来释放资源（关闭结果集，命令，连接）
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
//关闭命令
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
//关闭连接命令
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    //查询
    public static void main2(String[] args) throws ClassNotFoundException, SQLException {

        //2、获取连接
        String url = "jdbc:mysql://127.0.0.1:3306/textd?useSSL=false";
        String username = "root";//数据库的名称
        String password = "zhwsjj";//数据库的密码

        DataSource dataSource = new MysqlDataSource();//获取数据源，向上转型
        //MysqlDataSource没有连接池，DataSource有连接池，在这里向上转型是为了
        //DataSource以后去实例化其他的连接池，不需要重新创建

        //若不需要连接池，就不需要向上转型了
        //MysqlDataSource mysqlDataSource = new MysqlDataSource();
        ((MysqlDataSource) dataSource).setUrl(url);
        ((MysqlDataSource) dataSource).setUser(username);
        ((MysqlDataSource) dataSource).setPassword(password);

        Connection connection = dataSource.getConnection();


        //3.执行SQL语句
        String uname = "bit";
        String upass = " 1' or '1' = '1  ";

        //String sql = "select * from user where name = ' "+uname+" ' and password=' "+upass+"' ";
        //占位符进行操作
        String sql = "select * from user where name = ? and password = ?";

        //PreparedStatement可以预防SQL注入，加了“\”
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        //下面是给占位符确定值
        preparedStatement.setString(1, uname);
        preparedStatement.setString(2, upass);

        System.out.println("sql:" + preparedStatement.toString());

        //结果集
        ResultSet resultSet = preparedStatement.executeQuery();//一定要是无参的

        User user = new User();
        while (resultSet.next()) {
            user.setId(resultSet.getInt(1));
            user.setName(resultSet.getString(2));
            user.setPassword(resultSet.getString(3));
        }
        System.out.println("查询到的数据是：" + user);
        resultSet.close();//关闭的顺序不能错
        preparedStatement.close();
        connection.close();
    }


    //插入
    public static void main3(String[] args) throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://127.0.0.1:3306/textd?useSSL=false";
        String username = "root";//数据库的名称
        String password = "zhwsjj";//数据库的密码

        DataSource dataSource = new MysqlDataSource();//获取数据源
        ((MysqlDataSource) dataSource).setUrl(url);
        ((MysqlDataSource) dataSource).setUser(username);
        ((MysqlDataSource) dataSource).setPassword(password);
        Connection connection = dataSource.getConnection();

        //3.执行SQL语句
        String uname = "gasdobo";
        String upass = "000";
        String sql = "insert into user (id,name,password) values (?,?,?)";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, 2);
        preparedStatement.setString(2, uname);
        preparedStatement.setString(3, upass);

        System.out.println("sql:" + preparedStatement.toString());

        //结果集
        int ret = preparedStatement.executeUpdate();
        //ret返回的是改变的行数，若改变的行数为0，则失败
        if (ret != 0) {
            System.out.println("插入成功！");
        }

        preparedStatement.close();
        connection.close();
    }


    //更新
    public static void main5(String[] args) throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://127.0.0.1:3306/textd?useSSL=false";
        String username = "root";//数据库的名称
        String password = "zhwsjj";//数据库的密码

        DataSource dataSource = new MysqlDataSource();//获取数据源
        ((MysqlDataSource) dataSource).setUrl(url);
        ((MysqlDataSource) dataSource).setUser(username);
        ((MysqlDataSource) dataSource).setPassword(password);
        Connection connection = dataSource.getConnection();

        //3.执行SQL语句
        String uname = "gaobo2";
        String upass = "000";

        String sql = "update user set name = ? where id = ?";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, uname);
        preparedStatement.setInt(2, 2);


        //结果集
        int ret = preparedStatement.executeUpdate();
        if (ret != 0) {
            System.out.println("更新成功！");
        }

        preparedStatement.close();
        connection.close();
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://127.0.0.1:3306/textd?useSSL=false";
        String username = "root";//数据库的名称
        String password = "zhwsjj";//数据库的密码

        DataSource dataSource = new MysqlDataSource();//获取数据源
        ((MysqlDataSource) dataSource).setUrl(url);
        ((MysqlDataSource) dataSource).setUser(username);
        ((MysqlDataSource) dataSource).setPassword(password);
        Connection connection = dataSource.getConnection();

        //3.执行SQL语句
        String sql = "delete from user where id=?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, 2);

        //结果集
        int ret = preparedStatement.executeUpdate();
        if (ret != 0) {
            System.out.println("删除成功！");
        }

        preparedStatement.close();
        connection.close();
    }

}

