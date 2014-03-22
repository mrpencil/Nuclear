package by.bsuir.entity.Agregate 
{
	import by.bsuir.entity.Corpuscule;
	import by.bsuir.entity.Electron;
	import by.bsuir.entity.Neitrino;
	import by.bsuir.entity.Proton;
	import by.bsuir.helper.ColorHelper;
	/**
	 * ...
	 * @author ...
	 */
	public class Atom extends Corpuscule
	{
		
		private var neitrons_number:int;
		private var protonts_number:int;
		private var electrons_number:int;
		
		private static var ELECTRON:Electron = new Electron();
		private static var NEITRINO:Neitrino = new Neitrino();
		private static var PROTON:Proton = new Proton();
		
		private var element_title:String;
		private var element_color:uint;
		
		private var bound_energy:Number;
		
		public function Atom(numElectron:int=0, numProtons:int=0, numNeitrons:int=0, title:String="-", energy:uint=0, color:uint=0) {
			this.neitrons_number = numNeitrons;
			this.electrons_number = numElectron;
			this.protonts_number = numProtons;
			this.element_title = title;
			this.bound_energy = energy;
			this.element_color = color;
		}
		
		// weight of electrons not exists threre, be cause it not nesessary
	/*	override public function getWeight():Number
		{
			var weight:Number = 0;
			if (array_protons != null && array_protons.length != 0) {
				for each(var value:Proton in array_protons) {
					weight += value.getWeight();
				}
			}
			if (array_neitrons != null && array_neitrons.length != 0) {
				for each(var neitron:Neitrino in array_neitrons) {
					weight += neitron.getWeight();
				}
			}
			return weight;
		}  */
		
		public function getNeitronsNumber ():int { return neitrons_number; }
		public function getProtonsNumber():int { return protonts_number; }
		public function getElectronsNumber():int { return electrons_number; }
		public function getBoundEnergy():Number { return bound_energy; }
		public function getTitle ():String { return element_title; }
		public function getHexColor ():String {
			var helper:ColorHelper = ColorHelper.getInstance();
			return helper.displayInHex(element_color);
		}
		
		
		public function setNeitronsNumber(value:int):void {	this.neitrons_number = value;	}
		public function setProtonsNumber(value:int):void {	this.protonts_number = value;	}
		public function setElectronsNumber(value:int):void {this.electrons_number = value;	}
		public function setTittle (value:String):void {	this.element_title = value;	}
		public function setColor (value:uint):void 	{ this.element_color = value; }
		public function setBoundEnergy (value:Number):void { this.bound_energy = value; }
		
		
	}

}