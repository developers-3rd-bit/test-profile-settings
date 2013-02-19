package settings
{
   import com.halcyon.layout.common.HalcyonButton;
   import com.halcyon.layout.common.HalcyonCanvas;
   import com.halcyon.layout.common.HalcyonHGroup;
   import com.halcyon.layout.common.HalcyonLabel;
   import com.halcyon.layout.common.HalcyonTextInput;
   import com.halcyon.layout.common.HalcyonTickBox;
   import com.halcyon.layout.common.HalcyonVGroup;
   import com.halcyon.layout.common.LabelUpdater;
   import com.halcyon.layout.common.Utils;
   import com.soma.ui.ElementUI;
   
   import common.HalcyonAbstractForm;
   import common.LabelOnlyButton;
   
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   import mx.utils.StringUtil;
   
   import vo.User;
   
   public class RoomKeyAndUrlForm extends HalcyonAbstractForm implements LabelUpdater
   {
      private var _label1:HalcyonLabel;
      private var _roomKeyLabel:HalcyonLabel;
      private var _roomKeyTextField:HalcyonTextInput;
      private var _doorTickBox:HalcyonTickBox;
      private var _label2:HalcyonLabel;
      private var _label3:HalcyonLabel;
      private var _iMeetRoomAddressTextField:TextField;
      private var _changeButton:LabelOnlyButton;
      private var _hGroup:HalcyonHGroup;
      private var _doorTickBoxElement:ElementUI;
      
      public function RoomKeyAndUrlForm()
      {
         super();
         var vGroup:HalcyonVGroup = new HalcyonVGroup(this);
         vGroup.verticalGap = 25;
         
         _label1 = new HalcyonLabel();
         vGroup.addChild(_label1);
         
         _hGroup = new HalcyonHGroup(vGroup);
         _hGroup.paddingTop = 10;
         _hGroup.horizontalgap = 45;
         _roomKeyLabel = new HalcyonLabel();
         _hGroup.addChild(_roomKeyLabel);
         var vGroup1:HalcyonVGroup = new HalcyonVGroup(_hGroup);
         vGroup1.paddingTop = 7;
         vGroup1.verticalGap = 3;
         _roomKeyTextField = new HalcyonTextInput(180);
         vGroup1.addChild(_roomKeyTextField.content);
         _doorTickBox = new HalcyonTickBox();
         _doorTickBox.addEventListener("tickBoxStateChange", onValueChange, false, 0, true);
         _doorTickBoxElement = new HalcyonCanvas(this).add(_doorTickBox.content);
         vGroup1.addChild(_doorTickBoxElement.object);
         _hGroup.addChild(vGroup1);
         _hGroup.height = 45;
         vGroup.addChild(_hGroup);
         
         var vGroup3:HalcyonVGroup = new HalcyonVGroup(vGroup);
         vGroup3.verticalGap = 7;
         _label2 = new HalcyonLabel();
         vGroup3.addChild(_label2);
         _label3 = new HalcyonLabel();
         _label3.fontColor = 0xff0000;
         vGroup3.addChild(_label3);
         vGroup.addChild(vGroup3);
         
         var hGroup2:HalcyonHGroup = new HalcyonHGroup(this);
         hGroup2.horizontalgap = 3;
         _iMeetRoomAddressTextField = new TextField();
         _iMeetRoomAddressTextField.width = 200;
         _iMeetRoomAddressTextField.height = 18;
         hGroup2.addChild(_iMeetRoomAddressTextField);
         _changeButton = new LabelOnlyButton(hGroup2);
         _changeButton.fontSize = 8;
         hGroup2.addChild(_changeButton);
         vGroup.addChild(hGroup2);
         
         _roomKeyTextField.addEventListener("textChange", onValueChange, false, 0, true);
         _iMeetRoomAddressTextField.addEventListener("textChange", onValueChange, false, 0, true);
         _changeButton.addEventListener(MouseEvent.CLICK, onChangeButtonClick, false, 0, true);
         _doorTickBox.addEventListener("tickBoxStateChange", onDoorTickBoxClick, false, 0, true);
         
         this.addChild(vGroup);
      }
      
      public function updateLabel():void 
      {
         var roomKeyAndUrlFormNode:Object = Utils.resourcesXml.settings.roomKeyAndUrlForm;
         _label1.label = roomKeyAndUrlFormNode.label1.text.part1 + "\n" + roomKeyAndUrlFormNode.label1.text.part2;
         _roomKeyLabel.label = roomKeyAndUrlFormNode.roomKeyLabel.text;
         _doorTickBox.label = roomKeyAndUrlFormNode.doorTickBox.label;
         _label2.label = roomKeyAndUrlFormNode.label2.text;
         _label3.label = roomKeyAndUrlFormNode.label3.text;
         _changeButton.label = roomKeyAndUrlFormNode.changeButton.label;
         _hGroup.horizontalgap = roomKeyAndUrlFormNode.hGroup.horizontalgap;
         _hGroup.refresh();
         _doorTickBoxElement.top = 160;
         _doorTickBoxElement.left = roomKeyAndUrlFormNode.doorTickBoxElement.left;
         _doorTickBoxElement.refresh();
      }
      
      private function onDoorTickBoxClick(event:Event):void 
      {
         if(_doorTickBox.selected) 
            _roomKeyTextField.text = "";
         onValueChange(event);
      }
      
      private function onChangeButtonClick(event:Event):void 
      {
         _iMeetRoomAddressTextField.type = TextFieldType.INPUT;
      }
      
      override public function updateUI(argUser:User):void 
      {
         _user = argUser;
         _roomKeyTextField.text = _user.roomKey;//using dummy field
         _iMeetRoomAddressTextField.text = _user.iMeetRoomAddress;//using dummy field
         _doorTickBox.selected = _user.isRoomOpen;//using dummy field
      }
      
      override public function getUpdate():User
      {
         if(isModified == false) return _user;
         _user.roomKey = StringUtil.trim(_roomKeyTextField.text);//using dummy field
         _user.iMeetRoomAddress = StringUtil.trim(_iMeetRoomAddressTextField.text);//using dummy field
         _user.isRoomOpen = _doorTickBox.selected;//using dummy field
         return _user;
      }
   }
}