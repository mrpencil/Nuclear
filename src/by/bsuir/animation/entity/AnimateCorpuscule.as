package by.bsuir.animation.entity 
{
 import by.bsuir.entity.Corpuscule;
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
  private var velocity:int;
  private var x:int;
  private var y:int;
  protected var image:BitmapData;
  protected var image_sprite:Sprite;
  
  public function AnimateCorpuscule(corpuscule:Corpuscule=null, angle:Number=0, x:int=0, y:int=0) 
  {
   this.corpuscule = corpuscule;
   this.angle = angle;
   this.x = x;
   this.y = y;
  }
  
  public function Update():void { }
  public function Render():void { }
  
  public function getCorpuscule ():Corpuscule { return corpuscule ; }
  public function getRadius ():int { return radius ; }
  public function getAngle ():Number { return angle ; }
  public function getVelocity ():int { return velocity ; }
  public function getX ():int { return x ; }
  public function getY ():int { return y ; }
  
  public function setX (value:int):void 
  {
	  this.x = value;
  }
  
  public function setY (value:int):void 
  {
	  this.y = value;
  }
  
  public function setAngle(value:Number):void
  {
	  this.angle = value;
  }
	  
  public function setVelocity(value:int):void
  {
	  this.velocity = value;
  }
  
  public function getCorpusculeType():int {
	  return corpuscule.getIdentifier();
  }
  
  public function isIdentifier(identifier:int):Boolean {
	  return (corpuscule.getIdentifier() == identifier);
  }
 }  
}