
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
