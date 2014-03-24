package by.bsuir.entity 
{
	import by.bsuir.helper.PropertiesHelper;
	/**
	 * ...
	 * @author ...
	 */
	public class Proton extends Corpuscule 
	{
		
		public function Proton() {
			super();
			identifier = PROTON_IDENTIFIER;
			this.setWeight(PropertiesHelper.PROTON_WEIGHT);
			this.setCharge(PropertiesHelper.PROTON_CHARGE);
		}
		
	}

}