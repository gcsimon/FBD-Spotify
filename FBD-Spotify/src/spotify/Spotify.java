package spotify;

import java.util.Scanner;

public class Spotify {

	private static DataBase db = new DataBase();
	//db.connect();
	
	public static void main(String[] args) {
		int x = 1;
		 Scanner scan = new Scanner(System.in);
		
		db.connect();		
		while (x != 0) {			
			System.out.println("1 para listar todas as midias disponiveis ");
			System.out.println("2 duração em minutos de cada playlist e a quantidade de musicas na playlist ");
			System.out.println("3 para as musicas mais tocadas do Spotify ");
			System.out.println("4 para nome de shows,lugar do show e data de apresentacao para shows no brasil ");
			System.out.println("5 O nome dos artistas que fizeram nehum show que linkin park fez(nenhum festival onde o linkin park se apresentou) ");
			System.out.println("6  nome de todos os artistas que possuem album, com todas as musicas do album em ordem de faixa(crescente)   ");
			System.out.println("7  a ser implementado   ");
			System.out.println("0 para sair ");
			System.out.println("Digite o que voce quer fazer: ");
			x = scan.nextInt();
			
			if(db.isConnected()) {
				if (x ==1)
					db.getSongs();
				else if (x==2)
					db.playlistInfo();
				else if (x==3)
					db.topSongs();
				else if (x==4)
					db.nextShows();
				else if (x==5)	
					db.notLinkin();
				else if (x==6)
					db.albumsInfo();
				else if (x==7)
					System.out.println("not yet implemented");				
			}
			else {
				System.out.println("Não foi pessivel realizar a conexão ao BD. ");
		
		}		
	}
	}
}