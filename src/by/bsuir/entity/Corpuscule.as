package by.bsuir.entity 
{
	
	/**
	 * ...
	 * @author ...
	 */
	public class Corpuscule 
	{	
		public static var ELECTRON_IDENTIFIER:int = 0;
		public static var NEITRON_IDENTIFIER:int = 1;
		public static var PROTON_IDENTIFIER:int = 2;
		public static var ATOM_IDENTIFIER:int = 3;
		
		
		protected var identifier:int;
		
		protected var weight:Number;
		protected var charge:int;
		
		public function Corpuscule(someWeight:Number = 0, someCharge:int = 0) {
			this.weight = someWeight;
			this.charge = someCharge;
		}
		
		public function getWeight ():Number { return weight; }
		public function getCharge ():int { return charge; }
		public function getIdentifier():int { return identifier; }
		
		public function setWeight (value:Number):void 
		{
			this.weight = value;
		}
		
		public function setCharge (value:int):void 
		{
			this.charge = value;
		}
		
		public function getString():String
		{
			return "Масса: " + this.getWeight() + "\n" + 
				   "Заряд: " + this.getCharge() + "\n";
		}
		
	}
	
}