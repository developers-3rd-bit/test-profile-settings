package common
{
   import com.halcyon.layout.common.HalcyonCanvas;
   
   import flash.display.DisplayObjectContainer;
   import flash.display.GradientType;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class IconOnlyButton extends HalcyonCanvas
   {
      private var _icon:Sprite;
      private var _defaultWidth:Number = 24;
      private var _defaultHeight:Number = 24;
      
      public function IconOnlyButton(reference:DisplayObjectContainer)
      {
         super(reference, _defaultWidth, _defaultHeight);
         
         drawBackground([0xff0000, 0x000000]);
         
         this.buttonMode = true;
         
         this.addEventListener(MouseEvent.ROLL_OVER, onMouseOver);
         this.addEventListener(MouseEvent.ROLL_OUT, onMouseOut);
      }
      
      override public function set width(value:Number):void {}
      
      override public function set height(value:Number):void {}
      
      public function set buttonWidth(value:Number):void
      {
         if(value < 1) return;
         super.width = value;
         drawBackground([0xff0000, 0x000000]);
         this.prepareElementAndPosition(_icon, 3, 3, 3, 3);
      }
      
      public function set buttonHeight(value:Number):void
      {
         if(value < 1) return;
         super.height = value;
         drawBackground([0xff0000, 0x000000]);
         this.prepareElementAndPosition(_icon, 3, 3, 3, 3);
      }
      
      public function set icon(clz:Class):void 
      {
         if(clz == null) return;
         _icon = new clz();
         this.prepareElementAndPosition(_icon, 3, 3, 3, 3);
      }
      
      private function onMouseOver(event:Event):void 
      {
         drawBackground([0xffffff, 0x7ba02b]);
      }
      
      private function onMouseOut(event:Event):void 
      {
         drawBackground([0xff0000, 0x000000]);
      }
      
      private function drawBackground(colors:Array):void
      {
         graphics.clear();
         graphics.beginGradientFill(GradientType.LINEAR, colors, [1, .8], [0, 128]);
         graphics.drawRoundRect(0, 0, width, height, 5, 5);
         graphics.endFill();
      }
   }
}