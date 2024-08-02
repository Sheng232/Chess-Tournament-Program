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
