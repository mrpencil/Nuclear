package by.bsuir.user_interface 
{
	/**
	 * ...
	 * @author 
	 */
	public class InfoPanel extends Sprite
	{
		private const _colors:Array = [0x000000, 0x4C629E, 0x4C629E, 0x000000];
		private const _alphas:Array = [100, 100, 100, 100];
		private const _ratios:Array = [0, 126, 127, 255];
		
		private var _percentageLabel:TextField;
		private var _atomsLabel:TextField;
		private var _neitronsLabel:TextField;
		
		private var myFormat:TextFormat = new TextFormat();
		private const _matrix:Matrix = new Matrix();
		
		private var _w:Number = 100;
		private	var _h:Number = 0;
		
		// Singleton for igor
		private static var _instance:InfoPanel = null;
		
		public static function instance():InfoPanel 
		{
			return (_instance == null) ? (_instance = new InfoPanel()) : _instance;
		}
		
		private function InfoPanel() 
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
			
			var slider:SliderDemo = new SliderDemo();
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
			
			slider.x = _w / 2;
			slider.y =  btn2.y + 70;
			this.addChild(slider);
			
			_canvas.addChild(this);
		}
		
	}

}