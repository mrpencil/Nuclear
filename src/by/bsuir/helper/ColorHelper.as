package by.bsuir.helper 
{
	/**
	 * ...
	 * @author ...
	 */
	public class ColorHelper 
	{
		private static var helper:ColorHelper;
		
		public function ColorHelper() {
			
		}
		
		public static function getInstance():ColorHelper {
			if (helper == null) {
				helper = new ColorHelper();
			}
			return helper;
		}
		
		public function extractRed(c:uint):uint {
			return (( c >> 16 ) & 0xFF);
		}
		public function extractGreen(c:uint):uint {
			
			return ( (c >> 8) & 0xFF );
		}
		public function extractBlue(c:uint):uint {
			return ( c & 0xFF );
		}
		
		public function combineRGB(r:uint, g:uint, b:uint):uint {
			return ( ( r << 16 ) | ( g << 8 ) | b );
		}
		
		public function displayInHex(c:uint):String {
			var r:String=extractRed(c).toString(16).toUpperCase();
			var g:String=extractGreen(c).toString(16).toUpperCase();
			var b:String=extractBlue(c).toString(16).toUpperCase();
			var hs:String="";
			var zero:String="0";
			if(r.length==1){
			r=zero.concat(r);
			}
			if(g.length==1){
			g=zero.concat(g);
			}
			if(b.length==1){
			b=zero.concat(b);
			}
			hs=r+g+b;
			return hs;
		}
	}
}