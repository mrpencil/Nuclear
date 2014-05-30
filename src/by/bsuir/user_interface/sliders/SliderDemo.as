package by.bsuir.user_interface.sliders 
{
	import fl.events.*;
	import fl.controls.*;
	import flash.display.*;
	import flash.text.*;
	
	public class SliderDemo extends Sprite
	{
		public var slider:Slider,
		sliderLabel:TextField,
		myLabel:TextField,
		positionTxt:TextField;

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

			addChild(sliderLabel = new TextField);
			sliderLabel.textColor = 0xFFFFFF;
			sliderLabel.x=100;
			sliderLabel.y = 110;
			
			addChild(myLabel = new TextField);
			myLabel.textColor = 0xFFFFFF;
			myLabel.x=100;
			myLabel.y=130;

			positionTxt = new TextField();
			positionTxt.textColor = 0xFFFFFF;
			addChild(positionTxt);
	
			positionTxt.autoSize = TextFieldAutoSize.LEFT;
			positionTxt.x=100;
			positionTxt.y=150;
			
			slider.addEventListener(SliderEvent.CHANGE, analyzeSliderInput);
			slider.addEventListener(SliderEvent.THUMB_DRAG, analyzeSliderInput);

			slider.addEventListener(SliderEvent.CHANGE, announceChange);

			sliderLabel.autoSize = TextFieldAutoSize.LEFT;
			//sliderLabel.text = "Select and move slider with keyboard or mouse";
			myLabel.autoSize = TextFieldAutoSize.LEFT;
		//	myLabel.text = "Lorem ipsum lorem ipsum lorem ipsum.";
		}

		private function analyzeSliderInput(e:SliderEvent):void {
			switch (e.triggerEvent) {
				case InteractionInputType.MOUSE :
					sliderLabel.text = "Slider has been moved with mouse";
					break;
				case InteractionInputType.KEYBOARD :
					sliderLabel.text = "Slider has been moved with keyboard";
					break;
				default :
					break;
			}
		}

		function announceChange(e:SliderEvent):void {
			positionTxt.text = "Значение слайдера: " + e.target.value;
		}
		
	}

}