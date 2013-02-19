package settings
{
   import com.halcyon.layout.common.HalcyonHGroup;
   import com.halcyon.layout.common.HalcyonLine;
   import com.halcyon.layout.common.HalcyonTab;
   import com.halcyon.layout.common.LabelUpdater;
   import com.halcyon.layout.common.LayoutEvent;
   import com.halcyon.layout.common.Utils;
   import com.soma.ui.layouts.HBoxUI;
   
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class SettingsTab extends Sprite implements LabelUpdater
   {
      public static const TAB_INDEX_CHANGE:String = "tabIndexChange";
      
      private var _roomKeyAndUrl:HalcyonTab;
      private var _roomNameAndTheme:HalcyonTab;
      private var _smsOrEmailMessages:HalcyonTab;
      private var _dialingOptions:HalcyonTab;
      private var _leftHorizontalLine:HalcyonLine;
      private var _rightHorizontalLine:HalcyonLine;
      public var _hGroup:HalcyonHGroup;
      private var _selectedLabel:String;
      
      public function SettingsTab()
      {
         super();
         this.addEventListener(Event.ADDED_TO_STAGE, addedToStage, false, 0, true);
      }
      
      public function updateLabel():void 
      {
         var settingsTabNode:Object = Utils.resourcesXml.settings.settingsTab;
         _roomKeyAndUrl.label = settingsTabNode.roomKeyAndUrl.label;
         _roomKeyAndUrl.tabWidth = settingsTabNode.roomKeyAndUrl.width;
         _roomNameAndTheme.label = settingsTabNode.roomNameAndTheme.label;
         _roomNameAndTheme.tabWidth = settingsTabNode.roomNameAndTheme.width;
         _smsOrEmailMessages.label = settingsTabNode.smsOrEmailMessages.label;
         _smsOrEmailMessages.tabWidth = settingsTabNode.smsOrEmailMessages.width;
         _dialingOptions.label = settingsTabNode.dialingOptions.label;
         _dialingOptions.tabWidth = settingsTabNode.dialingOptions.width;
         _rightHorizontalLine.drawHorizontalLine(settingsTabNode.rightHorizontalLine.width);
         _hGroup.refresh()
      }
      
      private function addedToStage(event:Event):void 
      {
         this.removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
         _roomKeyAndUrl = new HalcyonTab();
         _roomNameAndTheme = new HalcyonTab();
         _smsOrEmailMessages = new HalcyonTab();
         _dialingOptions = new HalcyonTab();
         _roomKeyAndUrl.addEventListener(MouseEvent.CLICK, onClick);
         _roomNameAndTheme.addEventListener(MouseEvent.CLICK, onClick);
         _smsOrEmailMessages.addEventListener(MouseEvent.CLICK, onClick);
         _dialingOptions.addEventListener(MouseEvent.CLICK, onClick);
         _hGroup = new HalcyonHGroup(this);
         _hGroup.horizontalgap = -1;
         _hGroup.childrenAlign = HBoxUI.ALIGN_BOTTOM_LEFT;
         _leftHorizontalLine = new HalcyonLine();
         _leftHorizontalLine.drawHorizontalLine(15);
         _hGroup.addChild(_leftHorizontalLine);
         _hGroup.addChild(_roomKeyAndUrl);
         _hGroup.addChild(_roomNameAndTheme);
         _hGroup.addChild(_smsOrEmailMessages);
         _hGroup.addChild(_dialingOptions);
         _rightHorizontalLine = new HalcyonLine();
         _rightHorizontalLine.drawHorizontalLine(15);
         _hGroup.addChild(_rightHorizontalLine);
         this.addChild(_hGroup);
         _roomKeyAndUrl.active = _roomKeyAndUrl;
         _selectedLabel = _roomKeyAndUrl.label;
      }
      
      private function onClick(event:Event):void 
      {
         if(_selectedLabel == event.currentTarget.label) return;
         _selectedLabel = event.currentTarget.label;
         _roomKeyAndUrl.active = event.currentTarget;
         _roomNameAndTheme.active = event.currentTarget;
         _smsOrEmailMessages.active = event.currentTarget;
         _dialingOptions.active = event.currentTarget;
         this.dispatchEvent(new LayoutEvent(TAB_INDEX_CHANGE, false, false, event.currentTarget ));
      }
   }
   
}