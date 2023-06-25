import Debug"mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";
actor Bank{
 stable var currentValue:Float=300; // stable keyword will keep the values entact the way they are if we make any changes in code 
stable var startTime=Time.now();
 Debug.print(debug_show(startTime));

 let id= 241822842965564;
 public func topUp(amount:Float ){
  currentValue += amount;
  Debug.print(debug_show(currentValue));
 };
 public func withdraw(amount:Float)
 {
  let tempValue:Float=currentValue-amount;
  if(tempValue>=0)
  {
  currentValue-=amount;
  Debug.print(debug_show (currentValue));
 }
 else{
  Debug.print("Amount too large to withdraw");
 }
 };
 public query func checkBalance(): async Float{
   return currentValue;
 };
 //topUp();
 public func compound(){
    let currentTime=Time.now();
    let timeElapsedNS =currentTime-startTime;
    let timeElapsedS =timeElapsedNS/1000000000;
    currentValue:=currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime:=currentTime;
 }
}