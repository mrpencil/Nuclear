package by.bsuir.user_interface 
{
	import adobe.utils.CustomActions;
	import by.bsuir.user_interface.buttons.ImageButton;
	import by.bsuir.user_interface.fields.CustomTextField;
	import by.bsuir.user_interface.sliders.SliderDemo;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.*;
	import flash.text.*;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import by.bsuir.user_interface.buttons.Button
	/**
	 * ...
	 * @author 
	 */
	public class ControlPanel extends Sprite
	{
		private const _colors:Array = [0x000000, 0x4C629E, 0x4C629E, 0x000000];
		private const _alphas:Array = [100, 100, 100, 100];
		private const _ratios:Array = [0, 126, 127, 255];
		
		private var _label:TextField;
		private var myFormat:TextFormat = new TextFormat();
		private const _matrix:Matrix = new Matrix();
		
		private var _w:Number = 100;
		private	var _h:Number = 0;
		
		public function ControlPanel(_canvas:DisplayObjectContainer) 
		{
			super();
			this.x = 0; this.y = 0;
			myFormat.align = "center";
			myFormat.font = "Tahoma";
			myFormat.size = 13;
			myFormat.color = 0xFFAD3B;	
 
			this.graphics.lineStyle(0, 0x6D7871, 60, true, "none", "square", "round");
 
			_h = _canvas.height;
			
			_matrix.createGradientBox(_w, _h, 90 / 180 * Math.PI);
			
			this.graphics.beginGradientFill(GradientType.LINEAR, _colors, _alphas, _ratios, _matrix);
 
			this.graphics.drawRect(0, 0, _w, _h);
 
			this.graphics.endFill();
			
			_label = new TextField();
			_label.width = _w;
			_label.height = _h-5;
			_label.y = 5;
			_label.selectable = false;
			_label.text = "Панель \n управления";
			_label.setTextFormat(myFormat);
			
			this.buttonMode = false;
			
			_label.mouseEnabled = false;
			
			this.addChild(_label);
			
				//создаем кнопочки
			var btn1:Button = new Button();
			var btn2:Button = new Button();
			var btn3:ImageButton = new ImageButton();
			var field:CustomTextField = new CustomTextField();
			var slider:SliderDemo = new SliderDemo();
			
			var infoPanel:InfoPanel = new InfoPanel(_canvas, this.width);
			
			//добавляем первую кнопку, затем перемещаем её на требуемое место
			this.addChild(btn1);
			btn1.x = (_w - btn1.width) / 2; btn1.y = 70;
//назначаем текст
			btn1.label = "Старт";
		 //дальше - аналогично...
			this.addChild(btn2);
			btn2.x = (_w - btn2.width) / 2; btn2.y = btn1.y + 50;
			btn2.label = "Стоп";
 
			this.addChild(btn3);
			btn3.width = this.width / 3;
			btn3.x = (_w - btn3.width) / 2; btn3.y = this.height - slider.height;
			
			field.x = (_w - field.width) / 2;
			field.y = btn2.y + 70;
			this.addChild(field);
			
			slider.x = _w / 2;
			slider.y = field.y + field.height + 30;
			this.addChild(slider);
			
			_canvas.addChild(infoPanel);
			_canvas.addChild(this);
		}
		
	}

}