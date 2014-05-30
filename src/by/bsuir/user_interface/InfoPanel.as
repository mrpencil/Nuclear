package by.bsuir.user_interface 
{
	import flash.display.DisplayObjectContainer;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.*;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author 
	 */
	public class InfoPanel extends Sprite
	{
		private const _colors:Array = [0x000000, 0x4C629E, 0x4C629E, 0x000000];
		private const _alphas:Array = [100, 100, 100, 100];
		private const _ratios:Array = [0, 126, 127, 255];
		
		private var _atomsLabel:TextField;
		private var _neitronsLabel:TextField;
		
		private var myFormat:TextFormat = new TextFormat();
		private const _matrix:Matrix = new Matrix();
		
		private var _w:Number = 100;
		private	var _h:Number = 40;
		
		private const  _defaultNeitronsTitle:String = "Нейтроны: ";
		private const  _defaultAtomsTitle:String = "Атомы: ";
		
		// Singleton for igor
		private static var _instance:InfoPanel = null;
		
		public static function instance():InfoPanel 
		{
			return  _instance;
		}
		
		public function InfoPanel(_canvas:DisplayObjectContainer, leftOffset:int) 
		{
			super();
			this.x = 0; this.y = 0;
			myFormat.align = "center";
			myFormat.font = "Tahoma";
			myFormat.size = 13;
			myFormat.color = 0xFFAD3B;	
 
			_w = _canvas.width - leftOffset;
			
			this.x = leftOffset;
			
			this.graphics.lineStyle(0, 0x6D7871, 60, true, "none", "square", "round");
			
			_matrix.createGradientBox(_w, _h, 90 / 180 * Math.PI);
			
			this.graphics.beginGradientFill(GradientType.RADIAL, _colors, _alphas, _ratios, _matrix);
 
			this.graphics.drawRect(0, 0, _w, _h);
			
			this.graphics.endFill();
			
			this.buttonMode = false;
			
			myFormat.color = 0xFFAD3B;
			
			var borderOffset:int = 30;
			
			_atomsLabel = new TextField();
			_atomsLabel.height = _h-10;
			_atomsLabel.y = 5;
			_atomsLabel.x = borderOffset;
			_atomsLabel.selectable = false;
			_atomsLabel.text = _defaultAtomsTitle;
			_atomsLabel.setTextFormat(myFormat);
			_atomsLabel.mouseEnabled = false;
			this.addChild(_atomsLabel);
			
			myFormat.color = 0x53FF55;	
			
			_neitronsLabel = new TextField();
			_neitronsLabel.height = _h - 10;
			_neitronsLabel.text = _defaultNeitronsTitle;
			_neitronsLabel.y = 5;
			_neitronsLabel.x = _w - borderOffset - _neitronsLabel.width;
			_neitronsLabel.selectable = false;
			_neitronsLabel.setTextFormat(myFormat);
			_neitronsLabel.mouseEnabled = false;
			this.addChild(_neitronsLabel);
			
			_canvas.addChild(this);
			_instance = this;
		}
		
		public function setNumberOfAtoms(count:int):void
		{
			myFormat.color = 0xFFAD3B;
			_atomsLabel.text = _defaultAtomsTitle + count;
			_atomsLabel.setTextFormat(myFormat);
		}
		
		public function setNumberOfNeitrons(count:int):void
		{
			myFormat.color = 0x53FF55;
			_neitronsLabel.text = _defaultNeitronsTitle + count;
			_neitronsLabel.setTextFormat(myFormat);
		}
		
	}
	


}