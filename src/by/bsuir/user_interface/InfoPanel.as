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
		private var _energyLabel:TextField;
		
		private var myFormat:TextFormat = new TextFormat();
		private const _matrix:Matrix = new Matrix();
		
		private static var _w:Number = 100;
		private	static var _h:Number = 40;
		
		private const  _defaultNeitronsTitle:String = "Нейтроны: ";
		private const  _defaultAtomsTitle:String = "Атомы: ";
		private const  _defaultEnergyTitle:String = "Энергия: ";
		
		public static function getTopOffset():Number
		{
			return _h;
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
			
			myFormat.color = 0xFA8072;	
			
			_energyLabel = new TextField();
			_energyLabel.height = _h - 10;
			_energyLabel.width = 112;
			_energyLabel.text = _defaultEnergyTitle;
			_energyLabel.y = 5;
			_energyLabel.x =( _w - borderOffset - _energyLabel.width)/ 2;
			_energyLabel.selectable = false;
			_energyLabel.setTextFormat(myFormat);
			_energyLabel.mouseEnabled = false;
			this.addChild(_energyLabel);
			
			_canvas.addChild(this);
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
		
		public function setEnergy(count:Number):void
		{
			myFormat.color = 0xFA8072;
			_energyLabel.text = _defaultEnergyTitle + count;
			_energyLabel.setTextFormat(myFormat);
		}
		
	}
	


}