import Debug "mo:base/Debug";
import FLoat "mo:base/Float";
import Time "mo:base/Time";
import Float "mo:base/FLoat";

actor DBank {
	stable var currentValue :Float = 300;

	stable var startTime = Time.now();

	public func topUp(amount: Float){
		currentValue += amount;
		Debug.print(debug_show(currentValue));
	};

	let id = 19;

	public func withdrawl(amount: Float){
		let tempValue: Float = currentValue - amount;
		if (tempValue >= 0){
			currentValue -= amount;
			Debug.print(debug_show(currentValue));
		}else {
			Debug.print("Amount is too large");
		}
	};

	public query func checkBalance(): async Float{
		return currentValue;
	};

	public func compound() {
		let currentTime = Time.now();
		let timeElapsed = currentTime - startTime;
		let timeElapsedS = timeElapsed/1000000000;
		currentValue := currentValue * (1.01 ** FLoat.fromInt(timeElapsedS));
		startTime := currentTime;
	}
}