import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 300;
  Debug.print(debug_show(currentValue));

  let id = 98234598054;

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));
  
  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdrawl(amount: Float) {
    let tempValue: Float = currentValue - amount; 
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("The amount is too large.");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapseNanoSec = currentTime - startTime;
    let timeElapseSec = timeElapseNanoSec / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapseSec));
    startTime := currentTime;
  }

  

  // topUp();
}