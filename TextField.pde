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
    // Draw the text field
  if (isActive) {
    stroke(0);
    fill(200);
  } else {
    stroke(150);
    fill(255);
  }
  rect(x, y, w, h);
  
  // Draw the text inside the text field
  fill(0);
  textSize(16);
  text(inputText, x + 30, y + 10);
}

  public void textMousePressed() {
    // Check if mouse is within the text field
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      isActive = true;
    } else {
      isActive = false;
    }
  }

  public void textKeyPressed() {
    if (isActive) {
      if (keyCode == BACKSPACE) {
        if (inputText.length() > 0) {
          inputText = inputText.substring(0, inputText.length() - 1);
        }
      } else if (keyCode == ENTER) {
        isActive = false;
        //store variable implement later
      } else if (keyCode >= ' ' && keyCode <= '~') {
        inputText += key;
      }
    }
  }
}
