package by.bsuir.entity 
{
	import by.bsuir.helper.PropertiesHelper;
	/**
	 * ...
	 * @author ...
	 */
	public class Electron extends Corpuscule 
	{
		
		public function Electron() {
			super();
			this.identifier = ELECTRON_IDENTIFIER;
			this.setWeight(PropertiesHelper.ELECTRON_WEIGHT);
			this.setCharge(PropertiesHelper.ELECTRON_CHARGE);
		}
		
	}

}