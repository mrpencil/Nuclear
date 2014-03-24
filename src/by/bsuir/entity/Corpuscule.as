package by.bsuir.entity 
{
	
	/**
	 * ...
	 * @author ...
	 */
	public class Corpuscule 
	{			
		private var weight:Number;
		private var charge:int;
		
		public function Corpuscule(someWeight:Number = 0, someCharge:int = 0) {
			this.weight = someWeight;
			this.charge = someCharge;
		}
		
		public function getWeight ():Number { return weight; }
		public function getCharge ():int { return charge; }
		
		public function setWeight (value:Number):void 
		{
			this.weight = value;
		}
		
		public function setCharge (value:int):void 
		{
			this.charge = value;
		}
		
		
	}
	
}