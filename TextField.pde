public class TextField {
  String inputText;
  boolean isActive;
  int x, y, w, h;
  
  TextField(int xCoord, int yCoord, int tWidth, int tHeight) {
    x = xCoord;
    y = yCoord;
    w = tWidth;
    h = tHeight;
    inputText = "";
    isActive = false;
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
  
  public void drawTextField() {
    if(isActive){
    fill(200);
    rect(x, y, w, h);
    textSize(16);
    text(inputText, x+5, y + 20);
    }
    else {
      fill(255);
    }
    rect(x,y,w,h);
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
      else if(keyCode == ENTER){
        isActive = false;
        //store a variable
      }
      else if(key >= ' ')
      inputText += key;
      
    }
  }
}
