package by.bsuir.animation
{
	import by.bsuir.animation.container.AnimateAtomContainer;
	import by.bsuir.animation.container.AnimateNeitrinoContainer;
	import by.bsuir.animation.entity.AnimateAtom;
	import by.bsuir.animation.entity.AnimateCorpuscule;
	import by.bsuir.animation.entity.AnimateNeitrino;
	import by.bsuir.entity.Electron;
	import by.bsuir.entity.Agregate.Atom;
	import by.bsuir.entity.Neitrino;
	import by.bsuir.helper.AtomsCreator;
	import flash.accessibility.Accessibility;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author igor
	 */
	public class Scene
	{
		public var bitMap:Bitmap;
		public static var renderer:BitmapData;
		private var physics:Physics;
		
		public static var currentTime:Number;
		
		private var atoms:Array;
		private var neitrinos:Array;
		private var trashAtoms:Array;
		private var animAC:AnimateAtomContainer;
		private var animNC:AnimateNeitrinoContainer;
		
		
		
		public function Scene(canvas:DisplayObjectContainer)
		{
			trace("Scene created");
			currentTime = getTimer();
			renderer = new BitmapData(800, 600, false, 0x000000);
			bitMap = new Bitmap(renderer);
			canvas.addChild(bitMap);
			physics = new Physics(canvas);
			physics.createCorpuscules();
			physics.enable();
			
			//atoms = new Array();
			//neitrinos = new Array();
			//trashAtoms = new Array();
			//animAC = new AnimateAtomContainer();
			//animNC = new AnimateNeitrinoContainer();
			/*for (var i:int = 0; i < 10; i++)
				neitrinos.push(
					new AnimateNeitrino(
						null,
						Math.random() * 10, 
						Math.random() * 20, Math.random() * 50,
						2)
					);
			for (i = 0; i < 10; i++)
				atoms.push(
					new AnimateAtom(	
						AtomsCreator.createElement(AtomsCreator.U_235), 
						Math.random() * 10, 
						Math.random() * 10, 
						Math.random() * 30,
						50)
					);*/
		}
		
		
		public function Render():void
		{
			/*renderer.lock();
			renderer.fillRect(new Rectangle(0, 0, renderer.width, renderer.height), 0x000000);
			for (var i:int = 0; i < neitrinos.length; i++)
				neitrinos[i].Render();
			for (i = 0; i < atoms.length; i++)
				atoms[i].Render();
			for (i = 0; i < trashAtoms.length; i++)
				trashAtoms[i].Render();
			renderer.unlock();*/
			//AnimateAtom(animAC.getChildAt(0)).Render();
		}
		
		public function Update():void
		{
			/*currentTime = getTimer();
			
			for (var i:int = 0; i < neitrinos.length; i++)
			{
				neitrinos[i].Update();
				var atomReaction:int = -1;
				for (var j:int; j < atoms.length; j++)
				{
					if (neitrinos[i].CheckIfInNonRotatedRect(atoms[j]))
					{
						atomReaction = j;
					}
				}
				if (atomReaction != -1)
				{
					Reaction(atomReaction);
				}
			}
			for (i = 0; i < atoms.length; i++){
				atoms[i].Update();
			}
			for (i = 0; i < trashAtoms.length; i++) {
				trashAtoms[i].Update();
			}*/
			//AnimateAtom(animAC.getChildAt(0)).Update();
		}
		
		public function Reaction(atomReaction:int):void
		{
			trashAtoms.push(
				new AnimateAtom(
					AtomsCreator.createElement(AtomsCreator.Xe_143), 
					Math.random() * 10, 
					Math.random() * 10, 
					Math.random() * 30,
					50)
			);
			trashAtoms.push(
				new AnimateAtom(
					AtomsCreator.createElement(AtomsCreator.Xe_143), 
					Math.random() * 10, 
					Math.random() * 10, 
					Math.random() * 30,
					20)
			);
			for (var i:int = 0; i < 3; i++)
				neitrinos.push(
					new AnimateNeitrino(
						null,
						Math.random() * 10, 
						Math.random() * 20, Math.random() * 50,
						2)
				);
			atoms.splice(atomReaction, 1);
			/*for (i = 0; i < atoms.length; i++)
				trace(atoms[i]);*/
		}
	}

}