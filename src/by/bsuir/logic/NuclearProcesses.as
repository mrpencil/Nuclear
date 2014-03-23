package by.bsuir.logic 
{
	import by.bsuir.entity.Agregate.Atom;
	/**
	 * ...
	 * @author ...
	 */
	public class NuclearProcesses 
	{
		private static var SLOW_NEITRON_VELOCITY = 2;
		private static var FAST_NEITRON_VELOCITY = 10000;
		
		public function NuclearProcesses() 
		{
		}
		
		 public function alphaCoreDestroyExample(atom:Atom):Atom {
			 var currentProtons:int =  atom.getProtonsNumber() - 2;
			 var currentNeitrons:int = currentProtons;
			 atom.setNeitronsNumber(currentProtons);
			 atom.setNeitronsNumber(currentNeitrons);
		 }
		
	}

}