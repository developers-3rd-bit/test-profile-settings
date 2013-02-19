package editProfile
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
   
   public class EditProfileTab extends Sprite implements LabelUpdater
   {
      public static const TAB_INDEX_CHANGE:String = "tabIndexChange";
      
      private var _profile:HalcyonTab;
      private var _details:HalcyonTab;
      private var _photo:HalcyonTab;
      private var _bio:HalcyonTab;
      private var _privacy:HalcyonTab;
      private var _password:HalcyonTab;
      private var _options:HalcyonTab;
      private var _leftHorizontalLine:HalcyonLine;
      private var _rightHorizontalLine:HalcyonLine;
      public var _hGroup:HalcyonHGroup;
      private var _selectedLabel:String;
      
      public function EditProfileTab()
      {
         super();
         this.addEventListener(Event.ADDED_TO_STAGE, addedToStage, false, 0, true);
      }
      
      public function updateLabel():void 
      {
         var editProfileTabNode:Object = Utils.resourcesXml.editProfile.editProfileTab;
         _profile.label = editProfileTabNode.profile.label;
         _profile.tabWidth = editProfileTabNode.profile.width;
         _details.label = editProfileTabNode.details.label;
         _details.tabWidth = editProfileTabNode.details.width;
         _photo.label = editProfileTabNode.photo.label;
         _photo.tabWidth = editProfileTabNode.photo.width;
         _bio.label = editProfileTabNode.bio.label;
         _bio.tabWidth = editProfileTabNode.bio.width;
         _privacy.label = editProfileTabNode.privacy.label;
         _privacy.tabWidth = editProfileTabNode.privacy.width;
         _password.label = editProfileTabNode.password.label;
         _password.tabWidth = editProfileTabNode.password.width;
         _options.label = editProfileTabNode.options.label;
         _options.tabWidth = editProfileTabNode.options.width;
         _rightHorizontalLine.drawHorizontalLine(editProfileTabNode.rightHorizontalLine.width);
         _hGroup.refresh()
      }
      
      private function addedToStage(event:Event):void 
      {
         this.removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
         _profile = new HalcyonTab();
         _details = new HalcyonTab();
         _photo = new HalcyonTab();
         _bio = new HalcyonTab();
         _privacy = new HalcyonTab();
         _password = new HalcyonTab();
         _options = new HalcyonTab();
         _profile.addEventListener(MouseEvent.CLICK, onClick);
         _details.addEventListener(MouseEvent.CLICK, onClick);
         _photo.addEventListener(MouseEvent.CLICK, onClick);
         _bio.addEventListener(MouseEvent.CLICK, onClick);
         _privacy.addEventListener(MouseEvent.CLICK, onClick);
         _password.addEventListener(MouseEvent.CLICK, onClick);
         _options.addEventListener(MouseEvent.CLICK, onClick);
         _hGroup = new HalcyonHGroup(this);
         _hGroup.horizontalgap = -1;
         _hGroup.childrenAlign = HBoxUI.ALIGN_BOTTOM_LEFT;
         _leftHorizontalLine = new HalcyonLine();
         _leftHorizontalLine.drawHorizontalLine(15);
         _hGroup.addChild(_leftHorizontalLine);
         _hGroup.addChild(_profile);
         _hGroup.addChild(_details);
         _hGroup.addChild(_photo);
         _hGroup.addChild(_bio);
         _hGroup.addChild(_privacy);
         _hGroup.addChild(_password);
         _hGroup.addChild(_options);
         _rightHorizontalLine = new HalcyonLine();
         _hGroup.addChild(_rightHorizontalLine);
         this.addChild(_hGroup);
         _profile.active = _profile;
         _selectedLabel = _profile.label;
      }
      
      private function onClick(event:Event):void 
      {
         if(_selectedLabel == event.currentTarget.label) return;
         _selectedLabel = event.currentTarget.label;
         _profile.active = event.currentTarget;
         _details.active = event.currentTarget;
         _photo.active = event.currentTarget;
         _bio.active = event.currentTarget;
         _privacy.active = event.currentTarget;
         _password.active = event.currentTarget;
         _options.active = event.currentTarget;
         this.dispatchEvent(new LayoutEvent(TAB_INDEX_CHANGE, false, false, event.currentTarget ));
      }
   }
}