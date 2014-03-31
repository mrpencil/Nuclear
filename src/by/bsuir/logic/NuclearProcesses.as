package by.bsuir.logic
{
	import by.bsuir.entity.Agregate.Atom;
	import by.bsuir.entity.Neitrino;
	import by.bsuir.helper.AtomsCreator;
	
	/**
	 * ...
	 * @author ...
	 */
	public class NuclearProcesses
	{
		public static var SLOW_NEITRON_VELOCITY:int = 30;
		public static var FAST_NEITRON_VELOCITY:int = 10000;
		
		public static var ATOMS:String = "atoms";
		public static var NEITRONS:String = "neitrons";
		
		public function NuclearProcesses()
		{
		}
		
		public function decayNuclearCore(atom:Atom):Object
		{
			var resultAtomsArray:Array = new Array();
			var resultNeitronsArray:Array = new Array();
			
			var firstDecayResult:Atom = null;
			var secondDecayResult:Atom = null;
			var freeNeirons:uint = 0;
			
			if (atom.getAtomIdentifier() == AtomsCreator.U_235)
			{
				switch (Math.round(Math.random() * 10))
				{
					case 0: 
					case 2: 
					case 4: 
						firstDecayResult = AtomsCreator.createElement(AtomsCreator.Kr_94);
						secondDecayResult = AtomsCreator.createElement(AtomsCreator.Ba_139);
						freeNeirons = 2;
						break;
					case 1: 
					case 3: 
					case 5: 
					case 9: 
						firstDecayResult = AtomsCreator.createElement(AtomsCreator.Rb_90);
						secondDecayResult = AtomsCreator.createElement(AtomsCreator.Cs_144);
						freeNeirons = 1;
						break;
					case 6: 
					case 7: 
					case 8: 
						firstDecayResult = AtomsCreator.createElement(AtomsCreator.Sr_90);
						secondDecayResult = AtomsCreator.createElement(AtomsCreator.Xe_143);
						freeNeirons = 2;
						break;
				}
			}
			resultAtomsArray.push(firstDecayResult, secondDecayResult);
			for (var i:int; i < freeNeirons; i++)
			{
				resultNeitronsArray.push(new Neitrino());
			}
			var result:Object = {atoms: resultAtomsArray, neitrons: resultNeitronsArray};
			return result;
		}
	
	}

}