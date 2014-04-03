package by.bsuir.animation
{
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
			
		}
	}

}