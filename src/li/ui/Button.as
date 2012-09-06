package li.ui 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Button extends Sprite 
	{
		private var _gWidth:Number;
		private var _gHeight:Number;
		public function Button() 
		{
			super();
			
		}
		private function init():void {
			gWidth = 0;
			gHeight = 0;
		}
		public function draw():void {
			//this.graphics.lineStyle(1, 0xFF0000, 1);
			this.graphics.beginFill(0xd7d7d7, 1); 
			trace("width : " + this.gWidth);
			this.graphics.drawRect(0, 0, gWidth, gHeight);
			this.graphics.endFill(); 
			
		}
		
		public function get gHeight():Number 
		{
			return _gHeight;
		}
		
		public function set gHeight(value:Number):void 
		{
			_gHeight = value;
		}
		
		public function get gWidth():Number 
		{
			return _gWidth;
		}
		
		public function set gWidth(value:Number):void 
		{
			_gWidth = value;
		}
		
	}

}