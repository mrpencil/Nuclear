package by.bsuir.animation.entity
{
	import by.bsuir.entity.Corpuscule;
	import by.bsuir.helper.AtomsCreator;
	import by.bsuir.entity.Agregate.Atom;
	import by.bsuir.logic.NuclearProcesses;
	import by.bsuir.animation.Scene;
	
	import flash.geom.Point;
	import flash.geom.Matrix;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author igor
	 */
	public class AnimateNeitrino extends AnimateCorpuscule
	{
		
		public function AnimateNeitrino(corpuscule:Corpuscule = null, angle:Number = 0, x:int = 0, y:int = 0, radius:int = 0)
		{
			super(corpuscule, angle, x, y, radius);
			super.velocity = new Point(
				-NuclearProcesses.SLOW_NEITRON_VELOCITY * Math.cos(angle),
				-NuclearProcesses.SLOW_NEITRON_VELOCITY * Math.sin(angle)
			);
		}
	
	}

}