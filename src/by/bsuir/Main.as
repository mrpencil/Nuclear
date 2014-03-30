package by.bsuir
{
	import by.bsuir.animation.entity.AnimateCorpuscule;
	import by.bsuir.entity.Agregate.Atom;
	import by.bsuir.animation.Scene;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.*;
	import by.bsuir.helper.AtomsCreator;
	import by.bsuir.entity.Corpuscule;
	
	/**
	 * ...
	 * @author igor
	 */
	
	public class Main extends MovieClip
	{
		private var scene:Scene;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			scene = new Scene(this);
			addEventListener(Event.ENTER_FRAME, Run);
		}
		
		public function Run(e:Event):void
		{
			scene.Update();
			scene.Render();
		}
	}
}