package by.bsuir.animation.entity
{
	import by.bsuir.entity.Corpuscule;
	import by.bsuir.helper.AtomsCreator;
	import by.bsuir.entity.Agregate.Atom;
	import by.bsuir.logic.NuclearProcesses;
	import by.bsuir.animation.Scene;
	import by.bsuir.entity.Agregate.Atom;
	import flash.display.MovieClip;
	
	import flash.geom.Point;
	import flash.geom.Matrix;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class AnimateCorpuscule extends MovieClip
	{
		private var corpuscule:Corpuscule;
		public var radius:Number;
		private var radians:Number;
		private var angle:Number;
		private var speed:Number;
		public var mass:Number;
		public var velocity:Point;
		//protected var image:BitmapData;
		protected var image_sprite:Sprite;
		
		public function AnimateCorpuscule(corpuscule:Corpuscule = null, angle:Number = 0, x:int = 0, y:int = 0, radius:int = 0)
		{
			this.corpuscule = corpuscule;
			this.angle = angle;
			this.x = x;
			this.y = y;
			this.radius = radius;
			this.radians =  Math.floor(Math.random() * 360) * Math.PI / 180;
			this.speed = 0;
			this.mass = this.radius;
			this.velocity = new Point(0, 0);
			/*
			this.graphics.lineStyle(1);
			this.graphics.beginFill(0xCCCCCC);
			this.graphics.drawCircle(0, 0, radius);
			this.graphics.endFill();*/
		}
		
		public function updateVelocity(angle:Number)
		{
			
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