package by.bsuir.helper 
{
	import by.bsuir.entity.Agregate.Atom;
	/**
	 * ...
	 * @author ...
	 */
	public class AtomsCreator 
	{	
		public static var U_235:String = "U_235";
		public static var Th_231:String = "Th_231";
		public static var Kr_94:String = "Kr_94";
		public static var Ba_139:String = "Ba_139";
		public static var Rb_90:String = "Rb_90";
		public static var Cs_144:String = "Cs_144";
		public static var Sr_90:String = "Sr_90";
		public static var Xe_143:String = "Xe_143";
		public static var He_4:String = "He_4";
		
		private static var elements:Object = 
		{
		U_235: new Atom(92, 92, 143, "Уран 235/92", 7591, 0),
		Th_231: new Atom(90, 90, 141, "Торий 231/90", 1760, 0),
		Kr_94: new Atom(36, 36, 58, "Криптон 94/36", 792, 0),
		Ba_139: new Atom(56, 56, 83, "Барий 139/56", 1163, 0),
		Rb_90:new Atom(37, 37, 53, "Рубидий 90/37", 777, 0),
		Cs_144:new Atom(55, 55, 89, "Цезий 144/55", 1183, 0),
		Sr_90:new Atom(38, 38, 52, "Стронций 90/38", 783, 0),
		Xe_143:new Atom(54, 54, 89, "Ксенон 143/54", 1172, 0),
		He_4:new Atom(2,2,2, "Гелий 4/2", 28, 0)	
		};
		
		public function AtomsCreator() { }
		
		
		public static function createElement(type:String):Atom {
			var atom:Atom;
			try {
				atom = elements[type];
			}
			catch (error:Error) {
				atom = null;
			}
			return atom;
		}		
	}

}