package 
{
	import com.soma.ui.BaseUI;
	import com.soma.ui.ElementUI;
	import com.soma.ui.events.EventUI;
	import com.soma.ui.layouts.LayoutUI;
	import com.soma.ui.layouts.VBoxUI;
	import com.soma.ui.vo.GapUI;
	import com.soma.ui.vo.PaddingUI;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import li.ui.Button;
	import li.ui.CustomButton;
	
	/**
	 * ...
	 * @author Meso Man
	 */
	[SWF(width = "1280", height = "720", backgroundColor = "#ffffff")]
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			//var butn:Button = new Button();
			//
			//trace("width from main: " + butn.width);
			//butn.height = 20;
			//butn.gWidth = 100;
			//butn.gHeight = 20;
			//butn.draw();
			//
			//
			//addChild(butn);
			/*var startingY:int = 0;
			for (var i:int = 0; i < 3; i++) 
			{
				var butn:CustomButton = new CustomButton("Replace", 150, 40, 0);
				butn.x = 0;
				butn.y = startingY;
				startingY += 50;
				addChild(butn);
			}*/
			
			var butn:CustomButton = new CustomButton("Import Background", 200, 50, 0);
			butn.x = stage.stageWidth / 2 - butn.width / 2;
			butn.y = stage.stageHeight / 2 - butn.height / 2;
			addChild(butn);
			
			
			
			
		}
		
	}
	
}