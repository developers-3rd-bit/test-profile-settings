package common
{
   import com.halcyon.layout.common.HalcyonCanvas;
   
   import flash.display.DisplayObjectContainer;
   import flash.display.GradientType;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   import flashx.textLayout.formats.TextAlign;
   
   public class IconLabelVerticallyButton extends HalcyonCanvas
   {
      private var ICON_WIDTH_HEIGHT:int = 18;
      private var ICON_TO_LABEL_GAP:int = 2;
      private var _icon:Sprite;
      private var _labelField:TextField;
      private var _textFormat:TextFormat;
      private var _defaultWidth:Number = 60;
      private var _defaultHeight:Number = 44;
      private var _passedWidth:Number;
      private var _passedHeight:Number;
      
      public function IconLabelVerticallyButton(reference:DisplayObjectContainer)
      {
         super(reference, _defaultWidth, _defaultHeight);
         
         drawBackground([0xff0000, 0x000000]);
         
         _labelField = new TextField();
         _textFormat = new TextFormat();
         _textFormat.align = TextAlign.CENTER;
         _textFormat.color = 0xc4c4c4;
         _textFormat.bold = true;
         _labelField.setTextFormat(_textFormat);
         _labelField.mouseEnabled = false;
         _labelField.autoSize = TextFieldAutoSize.CENTER;
         
         this.prepareElementAndPosition(_labelField, height - ICON_WIDTH_HEIGHT - ICON_TO_LABEL_GAP, 0, 0, 0);
         
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
         _passedWidth = value;
         _labelField.width = value;
         drawBackground([0xff0000, 0x000000]);
      }
      
      public function set buttonHeight(value:Number):void
      {
         if(value < 1) return;
         super.height = value;
         _passedHeight = value;
         _labelField.height = value;
         drawBackground([0xff0000, 0x000000]);
      }
      
      public function get label():String 
      {
         return _labelField.text;
      }
      
      public function set label(value:String):void 
      {
         _labelField.text = value;
         _labelField.setTextFormat(_textFormat);
         var topValue:Number;
         if(isNaN(_passedHeight))
            topValue = (super.height - _labelField.height + ICON_WIDTH_HEIGHT) / 2 + 4;
         else
            topValue = (_passedHeight - _labelField.height + ICON_WIDTH_HEIGHT) / 2 + 4;
         this.prepareElementAndPosition(_labelField, topValue, NaN, 0, 0);
         if(isNaN(_passedWidth)) recalculateWidth();
         icon = _icon;
      }
      
      public function set icon(value:Sprite):void
      {
         if(value == null) return;
         _icon = value;
         _icon.width = ICON_WIDTH_HEIGHT;
         _icon.height = ICON_WIDTH_HEIGHT;
         this.prepareElementAndPosition(_icon, (super.height - ICON_WIDTH_HEIGHT - _labelField.height + ICON_TO_LABEL_GAP) / 2, NaN, (super.width - ICON_WIDTH_HEIGHT) / 2, NaN);
      }
      
      public function set fontSize(value:Number):void
      {
         if(value < 1) return;
         _textFormat.size = value;
         _labelField.setTextFormat(_textFormat);
         ICON_WIDTH_HEIGHT = value > ICON_WIDTH_HEIGHT ? value : ICON_WIDTH_HEIGHT;
         if(isNaN(_passedHeight)) 
            super.height = ICON_WIDTH_HEIGHT + value + 50;
         else 
         {
            _labelField.height = value + 2;
            this.prepareElementAndPosition(_labelField, (_passedHeight - _labelField.height + ICON_WIDTH_HEIGHT) / 2, NaN, 0, 0);
         }
         if(isNaN(_passedWidth)) recalculateWidth();
         icon = _icon;
         drawBackground([0xff0000, 0x000000]);
      }
      
      private function recalculateWidth():void
      {
         super.width = _labelField.width + 14;
         refresh();
         drawBackground([0xff0000, 0x000000]);
         icon = _icon;
      }
      
      private function onMouseOver(event:Event):void 
      {
         drawBackground([0xffffff, 0x7ba02b]);
         _textFormat.color = 0x000000;
         _labelField.setTextFormat(_textFormat);
      }
      
      private function onMouseOut(event:Event):void 
      {
         drawBackground([0xff0000, 0x000000]);
         _textFormat.color = 0xc4c4c4;
         _labelField.setTextFormat(_textFormat);
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