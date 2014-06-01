package by.bsuir.user_interface.sliders 
{
	import fl.events.*;
	import fl.controls.*;
	import flash.display.*;
	import flash.text.*;
	import by.bsuir.animation.Physics;
	
	public class SliderDemo extends Sprite
	{
		public var slider:Slider,
		positionTxt:TextField;
		
		private const xCoof:int = 5;

		public function SliderDemo() 
		{
			addChild(slider = new Slider);
			slider.x = slider.y = 0;
			slider.liveDragging = true;
			slider.setSize(200,10);
			slider.rotation = 90;
			slider.maximum = 100;
			slider.minimum = 0;
			slider.tickInterval = 5;


			positionTxt = new TextField();
			positionTxt.textColor = 0xFFFFFF;
			addChild(positionTxt);
	
			positionTxt.autoSize = TextFieldAutoSize.LEFT;
			positionTxt.x = -12;
			positionTxt.y = -22;
			positionTxt.text = Physics.getVelocityCoof + " x";
			positionTxt.mouseEnabled = false;
			
			slider.addEventListener(SliderEvent.CHANGE, announceChange);
		}

		function announceChange(e:SliderEvent):void {
			Physics.setVelocityCoof = (slider.value * xCoof) / slider.maximum + 1;
			positionTxt.text = Physics.getVelocityCoof + " x";
		}
		
	}

}