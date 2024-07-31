private TournamentRound rounds = new TournamentRound();
private ArrayList<Button> playerPlusButtons = new ArrayList<Button>();
private ArrayList<Button> playerMinusButtons = new ArrayList<Button>();
private boolean newRound = false;
private int buttonGap = 0;
private int buttonGap2 = 0;
public void setup() {
  rounds.scoreSort();
  rounds.ratingSort();
  for (int i = 0; i < rounds.getPlayers().size(); i++) {
    playerPlusButtons.add(new Button(20, 145 + buttonGap, 15, 15, rounds.getPlayers().get(i)));
    buttonGap += 25;
  }
  
  for (int i = 0; i < rounds.getPlayers().size(); i++) {
    playerMinusButtons.add(new Button(40, 145 + buttonGap2, 15, 15, rounds.getPlayers().get(i)));
    buttonGap2 += 25;
  }
  size(1000, 1000);
  textSize(10);
  textAlign(CENTER, CENTER);
}
public void draw() {
  fill(0);
  frameRate(10);
  //Standings
  background(152, 190, 100);
  fill(0);
  line(500, 0, 500, 1000);
  textSize(30);
  text("Tournament Standing:", 250, 50);
  text("Tournament Pairings: " + "round " + rounds.getRounds(), 750, 50);
  textSize(20);
  text("Name:", 100, 120);
  text("Rating:", 250, 120);
  text("Score:", 400, 120);
  textSize(25);
  text("Press Space to Start New Round", 750, 750);
  text("Press S to Sort Tournament Standing", 750, 850);
  textSize(20);
  //Pairings 
  text("White:", 600, 120);
  text("Black:", 800, 120);
  textSize(15); //Display Player Id 
  int gap4 = 0;
  for (int i = 1; i <= rounds.getPlayers().size(); i++) {
    text(i, 10, 150 + gap4);
    gap4 += 25;
  }
  //Display Player Name
  int gap = 0;
  for (int i = 0; i < rounds.getPlayers().size(); i++) {
    text(rounds.getPlayers().get(i).getPlayerName() + "(" + rounds.getPlayers().get(i).getId() + ")", 100, 150 + gap);
    gap += 25;
  } //Display Player Rating 
  int gap2 = 0;
  for (int i = 0; i < rounds.getPlayers().size(); i++) {
    text(rounds.getPlayers().get(i).getRating(), 250, 150 + gap2);
    gap2 += 25;
  }
  //Display Player Score
  int gap3 = 0;
  for (int m = 0; m < rounds.getPlayers().size(); m++) {
    rounds.getPlayers().get(m).playerScoreLimit();
    text((float)rounds.getPlayers().get(m).getPlayerScore(), 400, 150 + gap3);
    gap3 += 25;
  }
  
  //Display Pairings
  if (newRound == true) {
    rounds.pairings();
  }
  //Display Buttons
  for (int i = 0; i < rounds.getPlayers().size(); i++) {
    playerPlusButtons.get(i).drawPlusButton();
    playerPlusButtons.get(i).mousePlusPress();
    playerPlusButtons.get(i).updatePlusButtons();
  }
  for (int i = 0; i < rounds.getPlayers().size(); i++) {
    playerMinusButtons.get(i).drawMinusButton();
    playerMinusButtons.get(i).mouseMinusPress();
    playerMinusButtons.get(i).updateMinusButtons();
  }
}
public void keyPressed() {
  if (key == ' ') {
    newRound = true;
    rounds.incrementRounds();
  }
  if(key == 's'){
    rounds.scoreSort();
    rounds.ratingSort();
    newRound = false;
  }
}

public class Button{
  private int x, y, w, h;
  private Player associatedPlayer;
  public Button(int xCoord, int yCoord, int Bwidth, int Bheight, Player player){
    x = xCoord;
    y = yCoord;
    w = Bwidth;
    h = Bheight;
    associatedPlayer = player;
  }

  public void mousePlusPress(){
    if(mousePressed){
      if(mouseX>x && mouseX < x+w && mouseY > y && mouseY < y+h){
        associatedPlayer.incrementPlayerScore();
        fill(0);
        rect(x,y,w,h);
      }
    }
  }
  public void mouseMinusPress(){
    if(mousePressed){
      if(mouseX>x && mouseX < x+w && mouseY > y && mouseY < y+h){
        associatedPlayer.decrementPlayerScore();
        System.out.println("Button pressed for player: " + associatedPlayer.getPlayerName());
        System.out.println("New score: " + associatedPlayer.getPlayerScore());
        fill(0);
        rect(x,y,w,h);
      }
    }
  }
  
  public void drawPlusButton(){
    fill(255);
    rect(x,y,w,h);
    line(x+2, y + w/2, x + w - 2, y + w/2);
    line(x + w/2, y + 2, x + w/2, y + w - 2);
  }
    public void drawMinusButton(){
    fill(255);
    rect(x,y,w,h);
    line(x+2, y + w/2, x + w - 2, y + w/2);
  }
  
  public void setAssociatedPlayer(Player player) {
  this.associatedPlayer = player;
}
  
  public void updatePlusButtons() {
  for (int i = 0; i < rounds.getPlayers().size(); i++) {
    Player player = rounds.getPlayers().get(i);
    Button button = playerPlusButtons.get(i);
    button.setAssociatedPlayer(player);
  }
}
public void updateMinusButtons() {
  for (int i = 0; i < rounds.getPlayers().size(); i++) {
    Player player = rounds.getPlayers().get(i);
    Button button = playerMinusButtons.get(i);
    button.setAssociatedPlayer(player);
  }
}

}


public class Player {
  private String name;
  private int rating;
  private double score;
  private int id;
  
  public Player(String playerName, int playerRating, double playerScore, int playerID){
    this.name = playerName;
    this.rating = playerRating;
    this.score = playerScore;
    this.id = playerID;
  }
  
  
  public String getPlayerName(){
    return name;
  }
  
  public void setRating(int playerRating){
    rating = playerRating;
  }
  
  public int getRating(){
    return rating; 
  }
  public void incrementPlayerScore(){
    score = score + 0.5;
  }
  public void decrementPlayerScore(){
    score = score - 0.5;
  }
  public double getPlayerScore(){
    return score;
  }
  public int getId(){
    return id;
  }
  public void playerScoreLimit(){
    if(score < 0)
    score = 0;
  }
}
public class TournamentRound {
  private ArrayList <Player> players = new ArrayList <Player>();
  private int rounds;
  public TournamentRound() {
    //Place Holder Name
    for (int i = 1; i <= 16; i++) {
      players.add(new Player("player"+ i, i, 0, i));
    }
    //Place Holder Rating
    for (int j = 0; j < 16; j++) {
      players.get(j).setRating((int)(Math.random() * 2000));
    }
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
