package spotify;

public class Spotify {

	private static DataBase db = new DataBase();
	//db.connect();
	
	public static void main(String[] args) {
		db.connect();
	}
}