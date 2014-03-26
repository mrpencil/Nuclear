package by.bsuir.animation.entity
{
	import by.bsuir.entity.Corpuscule;
	import by.bsuir.helper.AtomsCreator;
	import by.bsuir.entity.Agregate.Atom;
	import by.bsuir.logic.NuclearProcesses;
	import by.bsuir.animation.Scene;
	import by.bsuir.entity.Agregate.Atom;
	
	import flash.geom.Point;
	import flash.geom.Matrix;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class AnimateCorpuscule
	{
		private var corpuscule:Corpuscule;
		private var radius:int;
		private var angle:Number;
		public var velocity:Point;
		public var x:int;
		private var y:int;
		protected var image:BitmapData;
		protected var image_sprite:Sprite;
		private var directions:Array = [Math.PI / 4, 3 * Math.PI / 4, 5 * Math.PI / 4];
		
		public function AnimateCorpuscule(corpuscule:Corpuscule = null, angle:Number = 0, x:int = 0, y:int = 0, radius:int = 0)
		{
			this.corpuscule = corpuscule;
			this.angle = angle;
			this.x = x;
			this.y = y;
			this.radius = radius;
			image_sprite = new Sprite();
			image_sprite.graphics.lineStyle(1, 0xFFFFFF);
		}
		
		public function Render():void
		{
			
			var matrix:Matrix = new Matrix();
			matrix.translate(x, y);
			Scene.renderer.draw(image_sprite, matrix);
		}
		
		public function Update():void
		{
			x += velocity.x;
			y += velocity.y;
			
			if (x + radius <= 0)
				x = Scene.renderer.width - radius;
			else if (x >= Scene.renderer.width)
				velocity.x = -velocity.x;
			
			if (y + radius <= 0)
				y = Scene.renderer.height - radius;
			else if (y >= Scene.renderer.height)
				velocity.y = -velocity.y;
		}
		
		public function CheckIfInNonRotatedRect(animateCorpuscule:AnimateCorpuscule):Boolean
		{
			
			var intersecting:Boolean = false;
			
			var obj2:Atom = Atom(animateCorpuscule.getCorpuscule());
			if (obj2.getTitle() == "Уран 235/92")
			{
				
				if (x >= animateCorpuscule.x && x <= animateCorpuscule.x + animateCorpuscule.radius)
					if (y >= animateCorpuscule.y && y <= animateCorpuscule.y + animateCorpuscule.radius)
						return true;
				
				//now we'll check the top right point
				if (x + radius >= animateCorpuscule.x && x + radius <= animateCorpuscule.x + animateCorpuscule.radius)
					if (y >= animateCorpuscule.y && y <= animateCorpuscule.y + animateCorpuscule.radius)
						return true;
				
				//now we check the bottom right point
				if (x + radius >= animateCorpuscule.x && x + radius <= animateCorpuscule.x + animateCorpuscule.radius)
					if (y + radius >= animateCorpuscule.y && y + radius <= animateCorpuscule.y + animateCorpuscule.radius)
						return true;
				
				//And check the bottom left point
				if (x >= animateCorpuscule.x && x <= animateCorpuscule.x + animateCorpuscule.radius)
					if (y + radius >= animateCorpuscule.y && y + radius <= animateCorpuscule.y + animateCorpuscule.radius)
						return true;
			}
			return intersecting;
		}
		
		public function getCorpuscule():Corpuscule
		{
			return corpuscule;
		}
		
		public function getRadius():int
		{
			return radius;
		}
		
		public function getAngle():Number
		{
			return angle;
		}
		
		public function getVelocity():Point
		{
			return velocity;
		}
		
		public function getX():int
		{
			return x;
		}
		
		public function getY():int
		{
			return y;
		}
		
		public function setX(value:int):void
		{
			this.x = value;
		}
		
		public function setY(value:int):void
		{
			this.y = value;
		}
		
		public function setAngle(value:Number):void
		{
			this.angle = value;
		}
		
		public function setVelocity(value:Point):void
		{
			this.velocity = value;
		}
		
		public function getCorpusculeType():int
		{
			return corpuscule.getIdentifier();
		}
		
		public function isIdentifier(identifier:int):Boolean
		{
			return (corpuscule.getIdentifier() == identifier);
		}
	}
}