package by.bsuir.animation.entity
{
	import by.bsuir.entity.Corpuscule;
	import by.bsuir.helper.AtomsCreator;
	import by.bsuir.entity.Agregate.Atom;
	import by.bsuir.logic.NuclearProcesses;
	import by.bsuir.animation.Scene;
	import by.bsuir.entity.Agregate.Atom;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	
	import flash.geom.Point;
	import flash.geom.Matrix;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import by.bsuir.user_interface.ControlPanel;
	import by.bsuir.user_interface.InfoPanel;
	import by.bsuir.animation.Physics;
	
	
	/**
	 * ...
	 * @author ...
	 */
	public class AnimateCorpuscule extends MovieClip
	{
		protected var corpusculeInfo:TextField;
		private static var myFormat:TextFormat = new TextFormat();
		
		private var corpuscule:Corpuscule;
		public var radius:Number;
		private var radians:Number;
		private var angle:Number;
		private var speed:Number;
		public var mass:Number;
		public var velocity:Point;
		protected var image_sprite:Sprite;
		
		public function AnimateCorpuscule(corpuscule:Corpuscule = null, angle:Number = 0, x:int = 0, y:int = 0, radius:int = 0)
		{
			this.corpusculeInfo = new TextField();
			this.corpuscule = corpuscule;
			this.angle = angle;
			this.x = x;
			this.y = y;
			this.radius = radius;
			this.radians =  Math.floor(Math.random() * 360) * Math.PI / 180;
			this.speed = 0;
			this.mass = this.radius;
			this.velocity = new Point(0, 0);
			
			myFormat.align = "center";
			myFormat.font = "Tahoma";
			myFormat.size = 13;
			myFormat.color = 0xFFFFFF;	
			
			corpusculeInfo = new TextField();
			corpusculeInfo.setTextFormat(myFormat);
			
		
			corpusculeInfo.height = 100;
			corpusculeInfo.width = 200;
			corpusculeInfo.selectable = false;
			corpusculeInfo.text = corpuscule.getString();
			corpusculeInfo.setTextFormat(myFormat);
			
			this.addEventListener(MouseEvent.MOUSE_OVER, mouseUpped);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseDropted);
			
		}
		
		public function mouseUpped(event:Event):void
		{
			if (this.x + corpusculeInfo.width + ControlPanel.getLeftOffset()> Physics.instance().CANVAS.width)
			{
				corpusculeInfo.x = this.x -  corpusculeInfo.width / 2;
			}
			else
			{
				corpusculeInfo.x = this.x + ControlPanel.getLeftOffset() + 15;
			}
			if (this.y + corpusculeInfo.height + InfoPanel.getTopOffset() > Physics.instance().CANVAS.height)
			{
				corpusculeInfo.y = this.y - corpusculeInfo.height / 2;
			}
			else
			{
				corpusculeInfo.y = this.y + InfoPanel.getTopOffset() + 15;
			}
				Physics.instance().MAIN_CANVAS.addChild(corpusculeInfo);
			
		}
		
		public function mouseDropted(event:Event):void
		{
			Physics.instance().MAIN_CANVAS.removeChild(corpusculeInfo);
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