package by.bsuir.animation 
{
	import by.bsuir.animation.entity.AnimateCorpuscule;
	import by.bsuir.entity.Electron;
	import by.bsuir.entity.Agregate.Atom;
	import by.bsuir.entity.Neitrino;
	import by.bsuir.helper.AtomsCreator;
	import flash.accessibility.Accessibility;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
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
		
		public static var currentTime:Number;
		
		private var atoms:Array;
		private var neitrinos:Array;
		
		public function Scene(stageWidth:int, stageHeight:int)
		{
			trace("Scene created");
			currentTime = getTimer();
			renderer = new BitmapData(stageWidth, stageHeight, false, 0x000000);
			bitMap = new Bitmap(renderer);
			
			atoms = new Array();
			neitrinos = new Array();
			for (var i:int = 0; i < 1000;i++)
				neitrinos.push(new AnimateCorpuscule(new Neitrino(), Math.random() * 10, Math.random() * 20, Math.random() * 50));
			for (i = 0; i < 1000;i++)
				atoms.push(new AnimateCorpuscule(AtomsCreator.createElement(AtomsCreator.U_235),  Math.random() * 10, Math.random() * 10, Math.random() * 30));
		}
		
		public function Render():void
		{
			renderer.lock();
			renderer.fillRect(new Rectangle(0, 0, renderer.width, renderer.height), 0x000000);
			for (var i:int = 0; i < neitrinos.length; i++)
			{
				neitrinos[i].Render();
			}
			for (i = 0; i < atoms.length; i++)
				atoms[i].Render();
			renderer.unlock();
		}
		
		public function Update():void
		{
			currentTime = getTimer();
			
			for (var i:int = 0; i < neitrinos.length; i++)
				neitrinos[i].Update();
			for (i = 0; i < atoms.length; i++)
				atoms[i].Update();
		}
	}

}