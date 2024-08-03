public class TextField {
  private String inputText;
  private boolean isActive;
  private int x, y, w, h;
  private boolean enteredName;
  private boolean enteredRating;
  private String storedName;
  private String storedRating;
  
  
  TextField(int xCoord, int yCoord, int tWidth, int tHeight) {
    x = xCoord;
    y = yCoord;
    w = tWidth;
    h = tHeight;
    inputText = "";
    isActive = false;
    enteredName = false;
    enteredRating = false;
    storedName = "";
    storedRating = "";
  }
  
  public String getText() {
    return inputText;
  }
  
  public void setActive() {
    isActive = true;
  }
  
  public boolean getActive() {
    return isActive;
  }
  public boolean nameEntered(){
    return enteredName;
  }
  public String getStoredName(){
    return storedName;
  }
  public boolean getEnteredName(){
    return enteredName;
  }
  public boolean getEnteredRating(){
    return enteredRating;
  }
  public String getStoredRating(){
    return storedRating;
  }
  public void drawTextField() {
    textAlign(LEFT);
    fill(255);
    rect(x,y,w,h);
    if(isActive == true && enteredName == false && enteredRating == false){
      fill(200);
      rect(x, y, w, h);
      fill(0);
      textSize(16);
      text(inputText, x + 5, y + 15);
      text("Name?", x + 5, y + 35);
    }
    else if(isActive == true && enteredName == true && enteredRating == false){
      fill(200);
      rect(x, y, w, h);
      fill(0);
      textSize(16);
      text(inputText, x + 5, y + 15);
      text("Rating?", x + 5, y + 35);
    }
    else {
      fill(255);
    }
     if(enteredName == true && enteredRating == true){
      inputText = "";
      enteredName = false;
      enteredRating = false;
      isActive = false;
    }
  }
  public void mousePressed(){
    if(mouseX>x && mouseX < x+w && mouseY > y && mouseY < y+h) {
      isActive = true;
      }
    else isActive = false;
    
  }
  public void keyPressed(){
    if(isActive){
      if(keyCode == BACKSPACE && inputText.length() > 0){
        inputText = inputText.substring(0,inputText.length() - 1);
      }
      else if(key >= ' ' && key <= '~'){
      inputText += key;
      }
      else if(keyCode == ENTER && enteredName == false && enteredRating == false){
        storedName = inputText;
        enteredName = true;
        inputText = "";
      }
     else if(keyCode == ENTER && enteredName == true && enteredRating == false){
        storedRating = inputText;
        enteredRating = true;
      }
    }
  }
}
