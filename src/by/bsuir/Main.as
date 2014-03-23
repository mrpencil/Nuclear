package by.bsuir
{
	import by.bsuir.entity.Agregate.Atom;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import by.bsuir.helper.AtomsCreator;
		
	/**
	 * ...
	 * @author igor
	 */
		 
	public class Main extends Sprite 
	{
			
		public function Main():void 
		{
			var atom:Atom = AtomsCreator.createElement(AtomsCreator.Sr_90);
			trace(atom.getTitle());
			
			var tf:TextField = new TextField();
			tf.x = 50;
			tf.y = 20;
			tf.text = "Step 0";
			addChild(tf);
			
			var btn1:SimpleButton = new SquareButton();
			btn1.x = 50;
			btn1.y = 100;
			addChild(btn1);
			
// Igor lock
			var btn2:SimpleButton = new SquareButton();
			btn2.x = 150;
			btn2.y = 100;
			addChild(btn2);
			
			var message1:String = "Step 1";
			var message2:String = "Step 2";
			
			btn1.addEventListener(MouseEvent.CLICK, function():void {
				tf.text = "Step 1";
				btn1.removeEventListener(MouseEvent.CLICK, arguments.callee);
				btn2.addEventListener(MouseEvent.CLICK, function():void {
					tf.text = "Step 2";
					btn2.removeEventListener(MouseEvent.CLICK, arguments.callee);
				});
			});
		}
	}
}
import flash.display.SimpleButton;

internal class SquareButton extends SimpleButton {
    private var upColor:uint   = 0xFFCC00;
    private var overColor:uint = 0xCCFF00;
    private var downColor:uint = 0x00CCFF;
    private var size:uint      = 80;

    public function SquareButton() {
        downState      = new ButtonDisplayState(downColor, size);
        overState      = new ButtonDisplayState(overColor, size);
        upState        = new ButtonDisplayState(upColor, size);
        hitTestState   = new ButtonDisplayState(upColor, size);        
        useHandCursor  = true;
    }
}

internal class ButtonDisplayState extends flash.display.Shape {
    private var bgColor:uint;
    private var size:uint;

    public function ButtonDisplayState(bgColor:uint, size:uint) {
        this.bgColor = bgColor;
        this.size    = size;
        draw();
    }

    private function draw():void {
        graphics.beginFill(bgColor);
        graphics.drawRect(0, 0, size, size);
        graphics.endFill();
    }
	
}