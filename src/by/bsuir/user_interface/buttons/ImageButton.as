package by.bsuir.user_interface.buttons 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author 
	 */
	public class ImageButton extends Sprite
	{

		private var _w:Number = 80;
		private	var _h:Number = 50;
		[Embed(source = "../../../../../img/buttons/Button-Delete-icon.png")]
		public var image:Class;
		
		public function ImageButton() 
		{
			super();
			this.buttonMode = true;
 
			var bitMap:Bitmap = new image();
			bitMap.width = bitMap.height = 30;
			this.addChild(bitMap);
		}
		
	}

}