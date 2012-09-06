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
	
	/**
	 * ...
	 * @author Meso Man
	 */
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

			var minconfig: MinConfigTest = new MinConfigTest(stage);
			addChild(minconfig);
			/*var baseUI:BaseUI = new BaseUI(stage);
			var mySprite:Sprite = new Sprite();
			var element:ElementUI = baseUI.add(mySprite);
			element.rect = new Rectangle( -50, -50, 100, 100);
			element.refresh();
			addChild(mySprite);
			
			var layout:LayoutUI = new LayoutUI(stage, 400, 300);
			layout.backgroundColor = 0xFF0000;
			layout.backgroundAlpha = 0.2;
			layout.bottom = 10;
			layout.right = 10;
			layout.refresh();
			addChild(layout);*/
			
			/*var mySprite:Sprite = new Sprite();
			var baseUI:BaseUI = new BaseUI(stage);
			var vbox:VBoxUI = new VBoxUI(stage, 400, 300);
			vbox.backgroundColor = 0xFF0000;
			vbox.backgroundAlpha = 0.2;
			vbox.ratio = ElementUI.RATIO_IN;
			vbox.childrenGap = new GapUI(5, 5);
			vbox.childrenPadding = new PaddingUI(5, 5, 5, 5);
			vbox.childrenAlign = VBoxUI.ALIGN_BOTTOM_RIGHT;
			addChild(vbox);
			 
			for (var i:int=0; i<8; ++i) {
			var sprite:Sprite = new Sprite();
			sprite.graphics.beginFill(0xFF0000, .5);
			sprite.graphics.drawRect(0, 0, 100, 100);
			vbox.addChild(sprite);
			}
			 
			vbox.refresh();*/
			// entry point
		}
		
	}
	
}