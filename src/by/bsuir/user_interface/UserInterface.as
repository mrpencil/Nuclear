package by.bsuir.user_interface
{
import by.bsuir.user_interface.sliders.SliderDemo;
import flash.display.DisplayObjectContainer;
import flash.display.SimpleButton;
import flash.events.MouseEvent;
import by.bsuir.user_interface.buttons.Button
	/**
	 * ...
	 * @author ...
	 */
	public class UserInterface 
	{
		
		public function UserInterface() 
		{
			
		}
		
		public static function createUserInterface(_canvas:DisplayObjectContainer) {
			new ControlPanel(_canvas);
		}
		
	}

}