class Timer 
{
 
  int savedTime; // When timer started
  int totalTime; // How long timer lasts
  Timer(int tempTotalTime) 
  {
    totalTime = tempTotalTime;
  }
  
  // Starts timer
  void start() 
  {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  //returns true after one run of the timer
  boolean isFinished() 
  { 
    int passedTime = millis() - savedTime;
    //checks if the time passed is greater than how long the timer should last
    if (passedTime > totalTime) 
    {
      return true;
    } 
    else 
    {
      return false;
    }
  }
}
