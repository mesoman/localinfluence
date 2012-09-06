package  
{
	import com.bit101.components.Component;
	import com.bit101.components.Label;
	import com.bit101.components.PushButton;
	import com.bit101.utils.MinimalConfigurator;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Meso Man
	 */
	public class MinConfigTest extends Sprite 
	{
		public var myLabel:Label;
		public var myButn:PushButton;
         
        public function MinConfigTest(stage:Stage)
        {
			
            Component.initStage(stage);
             
            var xml:XML = <comps>
                            <Label id="myLabel" x="10" y="10" text="waiting..."/>
                            <PushButton id="myButn" x="10" y="40" label="click me" event="click:onClick"/>
                          </comps>;
             
            var config:MinimalConfigurator = new MinimalConfigurator(this);
            config.parseXML(xml);
			
             
        }
         
        public function onClick(event:MouseEvent):void
        {
            myLabel.text = "You did it";
			myButn.label = "clicked";
        }
		
		
	}

}