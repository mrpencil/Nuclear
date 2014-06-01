package by.bsuir.animation.helper 
{
	import flash.display.Bitmap;
	import by.bsuir.helper.AtomsCreator;
	/**
	 * ...
	 * @author 
	 */
	public class ImageResources 
	{
		[Embed(source = "../../../../../img/atom_texture_u.png")]
		public static var image_u:Class;
		[Embed(source = "../../../../../img/atom_texture_barii.png")]
		public static var image_barii:Class;
		[Embed(source = "../../../../../img/atom_texture_cesii.png")]
		public static var image_cesii:Class;
		[Embed(source = "../../../../../img/atom_texture_kripton.png")]
		public static var image_kripton:Class;
		[Embed(source = "../../../../../img/atom_texture_rubidii.png")]
		public static var image_rubidii:Class;
		[Embed(source = "../../../../../img/atom_texture_stroncii.png")]
		public static var image_stroncii:Class;
		[Embed(source = "../../../../../img/atom_texture_torii.png")]
		public static var image_torii:Class;
		[Embed(source = "../../../../../img/atom_texture_torii.png")]
		public static var image_xenon:Class;
		
		[Embed(source = "../../../../../img/neitron.png")]
		public static var image_neitron:Class;
		
		public static function getImageBitmap(elemIdetifier:String="neitron"):Bitmap
		{
			var result:Bitmap = null;
			switch(elemIdetifier)
			{
				case AtomsCreator.Ba_139:
					result = new image_barii();
					break;
				case AtomsCreator.Cs_144:
					result = new image_cesii();
					break;
				case AtomsCreator.Kr_94:
					result = new image_kripton();
					break;
				case AtomsCreator.Rb_90:
					result = new image_rubidii();
					break;
				case AtomsCreator.Sr_90:
					result = new image_stroncii()
					break;
				case AtomsCreator.Th_231:
					result = new image_torii();
					break;
				case AtomsCreator.U_235:
					result = new image_u();
					break;
				case AtomsCreator.Xe_143:
					result = new image_xenon();
					break;
				default:
					result = new image_neitron();
			}
			return result;
		}
		
		public function ImageResources() 
		{
			
		}
		
	}

}