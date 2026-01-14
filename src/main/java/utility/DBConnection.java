package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
  // 1) The single DBConnection instance
  private static DBConnection instance;
  // 2) The actual JDBC Connection
  private Connection con;

  // 3) Private constructor prevents external instantiation
  private DBConnection() throws SQLException, ClassNotFoundException {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(
      "jdbc:mysql://localhost:3306/online_laundry_management?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
      "root",
      "anusara"
    );
  }

  // 4) Public accessor for the singleton DBConnection
  public static synchronized DBConnection getInstance()
      throws SQLException, ClassNotFoundException {
    if (instance == null || instance.con.isClosed()) {
      instance = new DBConnection();
    }
    return instance;
  }

  // 5) Expose the JDBC Connection
  public Connection getConnection() {
    return con;
  }
}
