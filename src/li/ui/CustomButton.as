package li.ui 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class CustomButton extends Sprite
	{
		// ---- Properties -----

		//protected var __button:CustomSimpleButton;
		protected var __txtFormat:TextFormat;
		protected var __txtField:TextField;
		protected var __background:Shape;
		protected var __hitarea:Sprite;

		protected var _label:String = "";
		protected var _font:String = "Arial";
		protected var _fontSize:int = 14;
		protected var _fontColor:uint = 0x000000;
		protected var _upColor:uint = 0xd7d7d7;
		protected var _overColor:uint = 0xababab;
		protected var _downColor:uint = 0xababab;
		protected var _buttonWidth:int;
		protected var _buttonHeight:int;
		protected var _buttonStrokeColor:int = 0x000000;
		protected var _buttonStrokeThickness:int = 0;

		public function get label():String
		{
			return _label;
		}
		public function set label(value:String):void
		{
			_label = value;
			updateDisplayList();
		}

		public function get buttonStrokeColor():uint
		{
			return _buttonStrokeColor;
		}
		public function set buttonStrokeColor(value:uint):void
		{
			_buttonStrokeColor = value;
			updateDisplayList();
		}

		public function get font():String
		{
			return _font;
		}
		public function set font(value:String):void
		{
			_font = value;
			updateDisplayList();
		}

		public function get fontSize():int
		{
			return _fontSize;
		}
		public function set fontSize(value:int):void
		{
			_fontSize= value;
			updateDisplayList();
		}

		public function get fontColor():uint
		{
			return _fontColor;
		}
		public function set fontColor(value:uint):void
		{
			_fontColor= value;
			updateDisplayList();
		}

		public function get upColor():uint
		{
			return _upColor;
		}
		public function set upColor(value:uint):void
		{
			_upColor = value;
			updateDisplayList();
		}

		public function get overColor():uint
		{
			return _overColor;
		}
		public function set overColor(value:uint):void
		{
			_overColor = value;
		}

		public function get downColor():uint
		{
			return _downColor;
		}
		public function set downColor(value:uint):void
		{
			_downColor = value;
		}
		
		public function get buttonStrokeThickness():int 
		{
			return _buttonStrokeThickness;
		}
		
		public function set buttonStrokeThickness(value:int):void 
		{
			_buttonStrokeThickness = value;
		}

		// ---- Constructor -----

		public function CustomButton(label:String = "", w:int = 80, h:int = 22, border:int = 0)
		{
			super();

			if(label != "") this.label = label;

			this.addEventListener(Event.REMOVED_FROM_STAGE, destroy);

			_buttonWidth = w;
			_buttonHeight = h;
			
			buttonStrokeThickness = border;

			createChildren();
			updateDisplayList();
		}

		// ---- Public Methods -----

		public function destroy(event:Event = null):void
		{
			this.removeEventListener(Event.REMOVED_FROM_STAGE, destroy);

			if(__background) {
				__background.graphics.clear();
				__background = null;
			}

			if(__hitarea){
				__hitarea.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
				__hitarea.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
				__hitarea.removeEventListener(MouseEvent.MOUSE_UP, onMouseOver);
				__hitarea.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
				__hitarea.graphics.clear();
				__hitarea = null;
			}

			if(__txtField) {
				__txtField.text = "";
				__txtField = null;
				__txtFormat = null;
			}
		}

		// ---- Protected Methods -----

		protected function createChildren():void
		{
			if(!__background) {
				__background = new Shape();
				addChild(__background);
			}

			if(!__txtField) {
				__txtField = new TextField();
				__txtField.selectable = false
				addChild(__txtField);
			}

			if(!__hitarea) {
				__hitarea = new Sprite();
				__hitarea.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
				__hitarea.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
				__hitarea.addEventListener(MouseEvent.MOUSE_UP, onMouseOver);
				__hitarea.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
				addChild(__hitarea);
			}
		}

		protected function drawButtonBackground(color:uint):void
		{
			if(__background){
				__background.graphics.beginFill(color);
				if (buttonStrokeThickness > 0) {
				__background.graphics.lineStyle(buttonStrokeThickness, buttonStrokeColor);	
				}
				
				__background.graphics.drawRect(0, 0, _buttonWidth, _buttonHeight);
				__background.graphics.endFill();
			}
		}

		protected function updateDisplayList():void
		{
			if(__txtField){
				__txtFormat = new TextFormat(font, fontSize, fontColor, false, null, null, null, null, TextFormatAlign.CENTER);
				__txtField.width = _buttonWidth;
				__txtField.defaultTextFormat = __txtFormat;
				__txtField.text = _label;
				__txtField.y = (_buttonHeight - __txtField.textHeight)/2;
			}

			if(__background) {
				drawButtonBackground(upColor);
			}

			if(__hitarea){
				__hitarea.graphics.beginFill(0x000000, 0);
				__hitarea.graphics.drawRect(0, 0, _buttonWidth, _buttonHeight);
				__hitarea.graphics.endFill();
			}
		}

		protected function onMouseOver(e:Event):void
		{
			e.stopPropagation();
			drawButtonBackground(overColor);
		}

		protected function onMouseDown(e:Event):void
		{
			e.stopPropagation();
			drawButtonBackground(downColor);
		}

		protected function onMouseUp(e:Event):void
		{
			e.stopPropagation();
			drawButtonBackground(overColor);
		}

		protected function onMouseOut(e:Event):void
		{
			e.stopPropagation();
			drawButtonBackground(upColor);
		}
	}
}
