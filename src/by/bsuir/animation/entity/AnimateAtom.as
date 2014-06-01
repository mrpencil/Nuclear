package by.bsuir.animation.entity 
{
	import by.bsuir.entity.Corpuscule;
	import by.bsuir.helper.AtomsCreator;
	import by.bsuir.entity.Agregate.Atom;
	import by.bsuir.logic.NuclearProcesses;
	import by.bsuir.animation.Scene;
	import by.bsuir.animation.helper.ImageResources;
	
	import flash.geom.Point;
	import flash.geom.Matrix;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import by.bsuir.animation.Physics;
	/**
	 * ...
	 * @author igor
	 */
	public class AnimateAtom extends AnimateCorpuscule
	{
		

		public function AnimateAtom(corpuscule:Corpuscule = null, angle:Number = 0, x:int = 0, y:int = 0, radius:int = 0) 
		{
			super(corpuscule,angle, x, y,radius);
			this.updateVelocity(angle);
			if (corpuscule is Atom)
			{
				
				var bitmap:Bitmap = ImageResources.getImageBitmap((corpuscule as Atom).getAtomIdentifier());
			}
			bitmap.width = bitmap.height = radius;
			
			this.addChild(bitmap);
		}
		public override function updateVelocity(angle:Number)
		{
			super.velocity = new Point(
				-NuclearProcesses.SLOW_NEITRON_VELOCITY * Math.cos(angle) * Physics.getVelocityCoof,
				-NuclearProcesses.SLOW_NEITRON_VELOCITY * Math.sin(angle) * Physics.getVelocityCoof
			);
		}
		
	}

}