package spotify;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class DataBase {

	private Connection connection = null;
	private Statement statement = null;
	private ResultSet resultset = null;
	
	public void connect() {
		
		String servidor = "jdbc:mysql://localhost:3306/spotify - fbd" + 
		"?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		
		String user = "root";
		String password = "123456";
		String driver = "com.mysql.cj.jdbc.Driver";
		
		try {
			Class.forName(driver);
			this.connection = DriverManager.getConnection(servidor, user, password);
			this.statement = this.connection.createStatement();
		} catch (Exception e) {
			System.out.println("Erro: " + e.getMessage());
		}
	}
	
	public boolean isConnected() {
		if(this.connection != null)
			return true;
		else
			return false;
	}
	
	public void getSongs() {
		try {
			String query = "select nomeMidia from Midia;";
			this.resultset = this.statement.executeQuery(query);
			//this.statement = this.connection.createStatement();
			while(this.resultset.next())
				System.out.println("nome da midia: " + this.resultset.getString("nomeMidia"));
			System.out.println("\n\n");
;		} catch (Exception e) {
			System.out.println("Erro: " + e.getMessage());
		}
	}
	
	public void playlistInfo() {
		try {
			String query = "select nomePlaylist,count(*) as numeroDeMusicas, sum(duracaoMinutosMidia)from playlist natural join playListMusica natural join midia group by nomePlaylist;";
			this.resultset = this.statement.executeQuery(query);
			//this.statement = this.connection.createStatement();
			while(this.resultset.next())
				System.out.println("Nome da playlist: " + this.resultset.getString("nomePlaylist") + 
									"\nNumero de musicas: " + this.resultset.getString("numeroDeMusicas") + 
									"\nDuracao da playlist: " + this.resultset.getString("sum(duracaoMinutosMidia)") + '\n');
			System.out.println();
			System.out.println();
;		} catch (Exception e) {
			System.out.println("Erro: " + e.getMessage());
		}
	}
	
	
	
	
}
