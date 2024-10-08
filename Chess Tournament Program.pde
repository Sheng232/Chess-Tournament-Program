private TournamentRound rounds = new TournamentRound();
private Button roundButton = new Button(740,740,50,30);
private Button sortButton = new Button(740,830,50,30);
private TextField testTextField = new TextField(10,80,100,20);
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

}
public void draw() {
  textAlign(CENTER, CENTER);
  fill(0);
  frameRate(10);
  //Standings
  background(152, 190, 100);
  fill(0);
  line(500, 0, 500, 1000);
  textSize(30);
  text("Tournament Standing:", 250, 50);
  text("Tournament Pairings: " + "round " + rounds.getRounds(), 750, 50);
  textSize(12);
  text("Add a new Player", 60,70);
  textSize(20);
  text("Name:", 100, 120);
  text("Rating:", 250, 120);
  text("Score:", 400, 120);
  textSize(25);
  text("Click Button to Start New Round", 750, 700);
  text("Click Button to Sort Tournament Standing", 750, 800);
  textSize(20);
  //Pairings 
  if(rounds.getRounds() % 2 == 0){
  text("White:", 600, 120);
  text("Black:", 800, 120);
  }
  else{
  text("White:", 800, 120);
  text("Black:", 600, 120);
  }
  textSize(15); 
  int gap4 = 0;
  for (int i = 1; i <= rounds.getPlayers().size(); i++) {
    text(i, 10, 150 + gap4);
    gap4 += 25;
  }
  //Display Player Name
  int gap = 0;
  for (int i = 0; i < rounds.getPlayers().size(); i++) {
    text(rounds.getPlayers().get(i).getPlayerName(), 100, 150 + gap);
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
  //Display increment/decrement Buttons
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
  //Display Round Button
  roundButton.drawRoundButton();
  roundButton.mouseRoundPress();
  
  //Display Sort Button
  sortButton.drawSortButton();
  sortButton.mouseSortPress();
  
  //Display textField
  testTextField.drawTextField();
}
public void mousePressed(){
  testTextField.mousePressed();
}

public void keyPressed(){
  testTextField.keyPressed();
  if(testTextField.getEnteredName() && testTextField.getEnteredRating()){
    rounds.getPlayers().add(new Player(testTextField.storedName, Integer.parseInt(testTextField.storedRating), 0, rounds.getPlayers().size() + 1));
    playerPlusButtons.add(new Button(20, 145 + buttonGap, 15, 15, rounds.getPlayers().get(rounds.getPlayers().size()-1)));
    playerMinusButtons.add(new Button(40, 145 + buttonGap2, 15, 15, rounds.getPlayers().get(rounds.getPlayers().size()-1)));
    buttonGap += 25;
    buttonGap2 += 25;
  }
}
