package spotify;

public class Spotify {

	private static DataBase db = new DataBase();
	//db.connect();
	
	public static void main(String[] args) {
		
		db.connect();
		if(db.isConnected()) {
			db.getSongs();
		}
		else {
			System.out.println("N�o foi pessivel realizar a conex�o ao BD. ");
		}		
	}
}