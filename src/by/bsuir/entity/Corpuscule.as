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
		
		private var velocity:Number;
		private var coordinate_X:int;
		private var coordinate_Y:int;
		
		public function Corpuscule() {
			this.setVelocity(0);
			this.setX(0);
			this.setY(0);
		}
		
		public function getX ():int { return coordinate_X; }
		public function getY ():int { return coordinate_Y; }
		public function getVelocity ():Number { return velocity; }
		public function getWeight ():Number { return weight; }
		public function getCharge ():int { return charge; }
		
		public function setX (value:int):void 
		{
			this.coordinate_X = value;
		}
		
		public function setY (value:int):void 
		{
			this.coordinate_Y = value;
		}
		
		public function setVelocity (value:Number):void 
		{
			this.velocity = value;
		}
		
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