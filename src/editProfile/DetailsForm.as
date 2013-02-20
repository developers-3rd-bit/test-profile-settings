package editProfile
{
   import com.halcyon.layout.common.HalcyonHGroup;
   import com.halcyon.layout.common.HalcyonLabel;
   import com.halcyon.layout.common.HalcyonTextInput;
   import com.halcyon.layout.common.HalcyonVGroup;
   import com.halcyon.layout.common.LabelUpdater;
   import com.halcyon.layout.common.Utils;
   import com.soma.ui.layouts.HBoxUI;
   
   import common.HalcyonAbstractForm;
   
   import fl.controls.Button;
   import fl.controls.CheckBox;
   import fl.controls.ComboBox;
   
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   import mx.utils.StringUtil;
   
   import vo.User;
   
   public class DetailsForm extends HalcyonAbstractForm implements LabelUpdater
   {
      private var _jobTitleLabel:HalcyonLabel;
      private var _jobTitleTextField:HalcyonTextInput;
      private var _companyNameLabel:HalcyonLabel;
      private var _companyNameTextField:HalcyonTextInput;
      private var _primaryPhoneLabel:HalcyonLabel;
      private var _primaryPhoneDropDown:ComboBox;
      private var _addPrimaryPhoneButton:Button;
      private var _primaryPhoneInfoLabel:HalcyonLabel;
      private var _locationLabel:HalcyonLabel;
      private var _locationCheckBox:CheckBox;
      private var _findMyLocationInfoLabel:HalcyonLabel;
      private var _actionVGroup:HalcyonVGroup;
      private var _locationHGroup:HalcyonHGroup;
      
      public function DetailsForm()
      {
         super();
         var vGroup:HalcyonVGroup = new HalcyonVGroup(this);
         vGroup.verticalGap = 25;
         _jobTitleLabel = new HalcyonLabel();
         vGroup.addChild(_jobTitleLabel);
         _companyNameLabel = new HalcyonLabel();
         vGroup.addChild(_companyNameLabel);
         _primaryPhoneLabel = new HalcyonLabel();
         vGroup.addChild(_primaryPhoneLabel);
         
         _actionVGroup = new HalcyonVGroup(this);
         _actionVGroup.top = 7;
         _actionVGroup.verticalGap = 8;
         _jobTitleTextField = new HalcyonTextInput(180);
         _actionVGroup.addChild(_jobTitleTextField.content);
         _companyNameTextField = new HalcyonTextInput(180);
         _actionVGroup.addChild(_companyNameTextField.content);
         
         var primaryPhoneVGroup:HalcyonVGroup = new HalcyonVGroup(_actionVGroup);
         primaryPhoneVGroup.verticalGap = -5;
         var hGroup:HalcyonHGroup = new HalcyonHGroup(primaryPhoneVGroup);
         hGroup.horizontalgap = 5;
         hGroup.top = -10;
         _primaryPhoneDropDown = new ComboBox();
         _primaryPhoneDropDown.width = 155;
         hGroup.addChild(_primaryPhoneDropDown);
         _addPrimaryPhoneButton = new Button(); //It should be McPlusButton
         _addPrimaryPhoneButton.label = "+";
         _addPrimaryPhoneButton.useHandCursor = true;
         _addPrimaryPhoneButton.height = 20;
         _addPrimaryPhoneButton.width = 20;
         _addPrimaryPhoneButton.addEventListener(MouseEvent.CLICK, onAddButtonClick, false, 0, true);
         hGroup.addChild(_addPrimaryPhoneButton);
         primaryPhoneVGroup.addChild(hGroup);
         
         _primaryPhoneInfoLabel = new HalcyonLabel();
         _primaryPhoneInfoLabel.fontSize = 8;
         primaryPhoneVGroup.addChild(_primaryPhoneInfoLabel);
         _actionVGroup.addChild(primaryPhoneVGroup);
         
         _locationHGroup = new HalcyonHGroup(vGroup);
         _locationHGroup.childrenAlign = HBoxUI.ALIGN_BOTTOM_LEFT;
         _locationHGroup.horizontalgap = 30;
         _locationHGroup.top = 90;
         _locationLabel = new HalcyonLabel();
         _locationHGroup.addChild(_locationLabel);
         var locationLabelVgroup:HalcyonVGroup = new HalcyonVGroup(_locationHGroup);
         locationLabelVgroup.paddingTop = -3;
         locationLabelVgroup.verticalGap = 0;
         _locationCheckBox = new CheckBox();
         _locationCheckBox.width = 180;
         locationLabelVgroup.addChild(_locationCheckBox);
         _findMyLocationInfoLabel = new HalcyonLabel();
         locationLabelVgroup.addChild(_findMyLocationInfoLabel);
         _locationHGroup.addChild(locationLabelVgroup);
         _actionVGroup.addChild(_locationHGroup);
         
         _jobTitleTextField.addEventListener("textChange", onValueChange, false, 0, true);
         _companyNameTextField.addEventListener("textChange", onValueChange, false, 0, true);
         _primaryPhoneDropDown.addEventListener(Event.CHANGE, onValueChange, false, 0, true);
         _locationCheckBox.addEventListener(MouseEvent.CLICK, onLocationTickBoxClick, false, 0, true);
         
         this.addChild(vGroup);
         this.addChild(_actionVGroup);
      }
      
      public function updateLabel():void 
      {
         var detailsFormNode:Object = Utils.resourcesXml.editProfile.detailsForm;
         _jobTitleLabel.label = detailsFormNode.jobTitleLabel.text;
         _companyNameLabel.label = detailsFormNode.companyNameLabel.text;
         _primaryPhoneLabel.label = detailsFormNode.primaryPhoneLabel.text;
         _primaryPhoneDropDown.prompt = detailsFormNode.primaryPhoneDropDown.prompt;
         _primaryPhoneInfoLabel.label = detailsFormNode.primaryPhoneInfoLabel.text;
         _locationLabel.label = detailsFormNode.locationLabel.text;
         _locationCheckBox.label = detailsFormNode.locationTickBox.label;
         _locationHGroup.horizontalgap = detailsFormNode.locationHGroup.horizontalgap;
         _actionVGroup.left = detailsFormNode.actionVGroup.left;
         _actionVGroup.refresh();
      }
      
      private function onLocationTickBoxClick(event:Event):void 
      {
         _findMyLocationInfoLabel.visible = _locationCheckBox.selected;
         onValueChange(event);
      }
      
      private function onAddButtonClick(event:Event):void 
      {
         
      }
      
      override public function updateUI(argUser:User):void 
      {
         _user = argUser;
         _jobTitleTextField.text = _user.getTitle();
         _companyNameTextField.text = _user.getCompany();
         _primaryPhoneDropDown.selectedItem = _user.primaryPhone;
         _locationCheckBox.selected = _user.enableLocationDetection;
         if(_locationCheckBox.selected)
            _findMyLocationInfoLabel.label = _user.getLocation();
      }
      
      override public function getUpdate():User 
      {
         if(isModified == false) return _user;
         _user.setTitle(StringUtil.trim(_jobTitleTextField.text));
         _user.setCompany(StringUtil.trim(_companyNameTextField.text));
         _user.primaryPhone = _primaryPhoneDropDown.selectedItem as String;
         _user.enableLocationDetection = _locationCheckBox.selected;
         if(_locationCheckBox.selected)
            _user.setLocation(_findMyLocationInfoLabel.label);
         return _user;
      }
   }
}