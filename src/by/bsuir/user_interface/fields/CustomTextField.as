package by.bsuir.user_interface.fields 
{
	import flash.display.Sprite;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author 
	 */
	public class CustomTextField extends Sprite
	{
		private var _label:TextField;
		private var textField:TextField;
		private var myFormat:TextFormat = new TextFormat();
		
		private var _w:Number = 100;
		private	var _h:Number = 20;
		
		private var preValue:String;
		
		public function CustomTextField() 
		{
			myFormat.align = "center";
			myFormat.font = "Tahoma";
			myFormat.size = 13;
			myFormat.color = 0xFFFFFF;	
			
			_label = new TextField();
			_label.setTextFormat(myFormat);
			
			_label.width = _w * 1,5;
			_label.height = _h;
			_label.y = 0;
			_label.x = 0;
			_label.selectable = false;
			_label.text = "Число атомов";
			_label.setTextFormat(myFormat);
 
			
			//спрайт Button в режиме кнопки
			this.buttonMode = false;
 
			//запрещаем для текстового поля с меткой перехват мыши - чтобы курсор-указатель не пропадал
			_label.mouseEnabled = false;
			
			textField = new TextField();
			textField.height = _h;
			textField.width = _w /2;
			textField.background = true;
			textField.backgroundColor = 0xFFFFFF;
			textField.type = TextFieldType.INPUT;
			textField.restrict = "0-9";
			textField.x = (_w - textField.width) / 2;
			textField.y = _label.height + _label.y + 10;
			textField.setTextFormat(myFormat);
			textField.backgroundColor = 0xFFFFFF;
			
			
			textField.addEventListener(TextEvent.TEXT_INPUT, this.textAdded);
			
			this.addChild(_label);
			this.addChild(textField);
		}
		
		public function textAdded(event:TextEvent):void 
		{
			if (textField.length < 6)
			{
				preValue = textField.text;
			}
			else
			{
				textField.text = preValue;
			}
		}
		
		public function get getValue():Number
		{
			return Number(textField.text);
		}
		
	}

}