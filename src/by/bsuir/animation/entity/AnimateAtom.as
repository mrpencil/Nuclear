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
	public class AnimateAtom extends AnimateCorpuscule
	{
		
		public function AnimateAtom(corpuscule:Corpuscule = null, angle:Number = 0, x:int = 0, y:int = 0, radius:int = 0) 
		{
			super(AtomsCreator.createElement(AtomsCreator.U_235),angle, x, y,radius);
			super.image_sprite.graphics.drawCircle(radius, radius, radius);
			//radius = 10;
			super.velocity = new Point(
				-NuclearProcesses.SLOW_NEITRON_VELOCITY * Math.cos(angle),
				-NuclearProcesses.SLOW_NEITRON_VELOCITY * Math.sin(angle)
			);
		}
		
	}

}