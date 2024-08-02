public class TournamentRound {
  private ArrayList <Player> players = new ArrayList <Player>();
  private int rounds;
  public TournamentRound() {
    //Place Holder Name
    //for (int i = 1; i <= 16; i++) {
    //  players.add(new Player("player"+ i, i, 0, i));
    //}
    ////Place Holder Rating
    //for (int j = 0; j < 16; j++) {
    //  players.get(j).setRating((int)(Math.random() * 2000));
    //}
   players.add(new Player("Vince", 1, 0, 1));
    players.add(new Player("Ean", 2, 0, 2));
    players.add(new Player("Charlotte", 3, 0, 3));
    players.add(new Player("Tomas", 4, 0, 4));
    players.add(new Player("Freddie", 5, 0, 5)); 
    players.add(new Player("Auden", 6, 0, 6));
    players.add(new Player("Matty", 7, 0, 7));
    players.add(new Player("Alex M", 8, 0, 8));
    players.add(new Player("Alex D", 9, 0, 9));
    players.add(new Player("Victor", 10, 0, 10));
    players.add(new Player("Mac", 11, 0, 11));
    players.add(new Player("Ian", 12, 0, 12));
    rounds = 0;
  }
  public int getRounds() {
    return rounds;
  }
  public void incrementRounds() {
    rounds++;
  }
  public ArrayList<Player> getPlayers() {
    return players;
  }
  public void scoreSort() {
    //Bubble Sort Base On Score
    for (int outer = 0; outer < players.size() - 1; outer++) {
      for (int inner = 0; inner < players.size() - 1; inner++) {
        if (players.get(inner).getPlayerScore() < players.get(inner + 1).getPlayerScore()) {
          //swap
          Player temp = new Player(players.get(inner).getPlayerName(), players.get(inner).getRating(), players.get(inner).getPlayerScore(), players.get(inner).getId());
          players.set(inner, players.get(inner+1));
          players.set(inner + 1, temp);
        }
      }
    }
  }


  public void ratingSort() {
    // Bubble Sort Based on Rating (Descending Order) within the same score
    for (int i = 0; i < players.size() - 1; i++) {
      int sameScoreCount = 1;

      while (i + sameScoreCount < players.size() &&
        players.get(i).getPlayerScore() == players.get(i + sameScoreCount).getPlayerScore()) {
        sameScoreCount++;
      }
      if (sameScoreCount > 1) {
        for (int j = i; j < i + sameScoreCount - 1; j++) {
          for (int k = j + 1; k < i + sameScoreCount; k++) {
            if (players.get(j).getRating() < players.get(k).getRating()) {
              // Swap based on rating
              Player temp = players.get(j);
              players.set(j, players.get(k));
              players.set(k, temp);
            }
          }
        }
      }
      i += sameScoreCount - 1;
    }
  }
  
  public void pairings(){
  int gap0 = 0;
  for (int i = 0; i < players.size()/2; i++) {
    text("vs", 700, 150 + gap0);
    gap0 += 25;
  }
  
    int gap = 0;
    //white Player
    for(int i = 0; i < players.size(); i+=2){
      text(players.get(i).getPlayerName() + "(" + players.get(i).getPlayerScore() + ")", 620, 150 + gap);
      text("(" + players.get(i).getRating() + ")", 550, 150 + gap);
      gap += 25;
    }
    int gap1 = 0;
    //Black Player
    for(int i = 1; i < players.size(); i+=2){
      text(players.get(i).getPlayerName() + "(" + players.get(i).getPlayerScore() + ")", 820, 150 + gap1);
      text("(" + players.get(i).getRating() + ")", 750, 150 + gap1);
      gap1 += 25;
    }
  }
}
