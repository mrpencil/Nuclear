package by.bsuir.entity 
{
	import by.bsuir.helper.PropertiesHelper;
	/**
	 * ...
	 * @author ...
	 */
	public class Neitrino extends Corpuscule 
	{
		
		public function Neitrino() {
			super();
			this.identifier = NEITRON_IDENTIFIER;
			this.setWeight(PropertiesHelper.NEITRON_WEIGHT);
			this.setCharge(PropertiesHelper.NEITRON_CHARGE);
		}
		
		public override function getString():String
		{
			return "Тип: Нейтрон \n" + super.getString();
		}
		
	}

}