package settings
{
   import com.halcyon.layout.common.HalcyonHGroup;
   import com.halcyon.layout.common.HalcyonLabel;
   import com.halcyon.layout.common.HalcyonSliderSwitch;
   import com.halcyon.layout.common.HalcyonTextInput;
   import com.halcyon.layout.common.HalcyonVGroup;
   import com.halcyon.layout.common.LabelUpdater;
   import com.halcyon.layout.common.Utils;
   import com.soma.ui.layouts.VBoxUI;
   
   import common.HalcyonAbstractForm;
   
   import flash.display.Sprite;
   
   import mx.utils.StringUtil;
   
   import vo.User;
   
   public class SMSOrEmailMessagesForm extends HalcyonAbstractForm implements LabelUpdater
   {
      private var _label1:HalcyonLabel;
      private var _labelEnableSms:HalcyonLabel;
      private var _enableSmsButton:HalcyonSliderSwitch;
      private var _labelEnableEmail:HalcyonLabel;
      private var _enableEmailButton:HalcyonSliderSwitch;
      private var _labelMobileNumber:HalcyonLabel;
      private var _mobileNumberTextField:HalcyonTextInput;
      private var _labelEmailAddress:HalcyonLabel;
      private var _emailAddressTextField:HalcyonTextInput;
      private var _labelInfoMsg:HalcyonLabel;
      private var _labelKeyword:HalcyonLabel;
      private var _keyword1TextField:HalcyonTextInput;
      private var _keyword2TextField:HalcyonTextInput;
      private var _keyword3TextField:HalcyonTextInput;
      private var _labelCustomMessage:HalcyonLabel;
      private var _customMessage1TextField:HalcyonTextInput;
      private var _customMessage2TextField:HalcyonTextInput;
      private var _customMessage3TextField:HalcyonTextInput;
      
      public function updateLabel():void 
      {
         var smsOrEmailMessagesFormNode:Object = Utils.resourcesXml.settings.smsOrEmailMessagesForm;
         _label1.label = smsOrEmailMessagesFormNode.label1.text;
         _labelEnableSms.label = smsOrEmailMessagesFormNode.labelEnableSms.text;
         _labelEnableEmail.label = smsOrEmailMessagesFormNode.labelEnableEmail.text;
         _labelEmailAddress.label = smsOrEmailMessagesFormNode.labelEmailAddress.text;
         _labelMobileNumber.label = smsOrEmailMessagesFormNode.labelMobileNumber.text;
         _labelInfoMsg.label = smsOrEmailMessagesFormNode.labelInfoMsg.text;
         _labelKeyword.label = smsOrEmailMessagesFormNode.labelKeyword.text;
         _labelCustomMessage.label = smsOrEmailMessagesFormNode.labelCustomMessage.text;
      }
      
      public function SMSOrEmailMessagesForm()
      {
         super();
         var vGroup:HalcyonVGroup = new HalcyonVGroup(this);
         vGroup.verticalGap = 25;
         _label1 = new HalcyonLabel();
         vGroup.addChild(_label1);
         _labelEnableSms = new HalcyonLabel();
         vGroup.addChild(_labelEnableSms);
         
         var vgroup2:HalcyonVGroup = new HalcyonVGroup(this);
         vgroup2.childrenAlign = VBoxUI.ALIGN_TOP_RIGHT;
         vgroup2.verticalGap = 20;
         vgroup2.top = 27;
         vgroup2.left = 160;
         _enableSmsButton = new HalcyonSliderSwitch("static", "yes", "no");
         vgroup2.addChild(_enableSmsButton.content);
         _mobileNumberTextField = new HalcyonTextInput(100);
         vgroup2.addChild(_mobileNumberTextField.content);
         this.addChild(vgroup2);
         
         var vGroup3:HalcyonVGroup = new HalcyonVGroup(this);
         vGroup3.verticalGap = 25;
         vGroup3.top = 29;
         vGroup3.left = 190;
         _labelEnableEmail = new HalcyonLabel();
         vGroup3.addChild(_labelEnableEmail);
         _labelEmailAddress = new HalcyonLabel();
         vGroup3.addChild(_labelEmailAddress);
         this.addChild(vGroup3);
         
         var vgroup4:HalcyonVGroup = new HalcyonVGroup(this);
         vgroup4.childrenAlign = VBoxUI.ALIGN_TOP_RIGHT;
         vgroup4.verticalGap = 20;
         vgroup4.top = 27;
         vgroup4.left = 345;
         _enableEmailButton = new HalcyonSliderSwitch("static", "yes", "no");
         vgroup4.addChild(_enableEmailButton.content);
         _emailAddressTextField = new HalcyonTextInput(100);
         vgroup4.addChild(_emailAddressTextField.content);
         this.addChild(vgroup4);
                  
         _labelMobileNumber = new HalcyonLabel();
         vGroup.addChild(_labelMobileNumber);
         _labelInfoMsg = new HalcyonLabel();
         vGroup.addChild(_labelInfoMsg);
         
         var hGroup:HalcyonHGroup = new HalcyonHGroup(vGroup);
         hGroup.horizontalgap = 75;
         var keywordVGroup:HalcyonVGroup = new HalcyonVGroup(hGroup);
         keywordVGroup.verticalGap = 10;
         _labelKeyword = new HalcyonLabel();
         keywordVGroup.addChild(_labelKeyword);
         var keywordEmptySprite:Sprite = new Sprite();
         keywordVGroup.addChild(keywordEmptySprite);
         _keyword1TextField = new HalcyonTextInput(60);
         keywordVGroup.addChild(_keyword1TextField.content);
         _keyword2TextField = new HalcyonTextInput(60);
         keywordVGroup.addChild(_keyword2TextField.content);
         _keyword3TextField = new HalcyonTextInput(60);
         keywordVGroup.addChild(_keyword3TextField.content);
         hGroup.addChild(keywordVGroup);
         
         var customMessageVGroup:HalcyonVGroup = new HalcyonVGroup(hGroup);
         customMessageVGroup.verticalGap = 10;
         _labelCustomMessage = new HalcyonLabel();
         customMessageVGroup.addChild(_labelCustomMessage);
         var customMessageEmptySprite:Sprite = new Sprite();
         customMessageVGroup.addChild(customMessageEmptySprite);
         _customMessage1TextField = new HalcyonTextInput(270);
         customMessageVGroup.addChild(_customMessage1TextField.content);
         _customMessage2TextField = new HalcyonTextInput(270);
         customMessageVGroup.addChild(_customMessage2TextField.content);
         _customMessage3TextField = new HalcyonTextInput(270);
         customMessageVGroup.addChild(_customMessage3TextField.content);
         hGroup.addChild(customMessageVGroup);
         
         _enableSmsButton.addEventListener("sliderStateChange", onValueChange, false, 0, true);
         _enableEmailButton.addEventListener("sliderStateChange", onValueChange, false, 0, true);
         _mobileNumberTextField.addEventListener("textChange", onValueChange, false, 0, true);
         _emailAddressTextField.addEventListener("textChange", onValueChange, false, 0, true);
         _keyword1TextField.addEventListener("textChange", onValueChange, false, 0, true);
         _keyword2TextField.addEventListener("textChange", onValueChange, false, 0, true);
         _keyword3TextField.addEventListener("textChange", onValueChange, false, 0, true);
         _customMessage1TextField.addEventListener("textChange", onValueChange, false, 0, true);
         _customMessage2TextField.addEventListener("textChange", onValueChange, false, 0, true);
         _customMessage3TextField.addEventListener("textChange", onValueChange, false, 0, true);
         
         vGroup.addChild(hGroup);
         this.addChild(vGroup);
      }
      
      override public function updateUI(argUser:User):void 
      {
         _user = argUser;
         _enableSmsButton.selected = _user.enableSms;//using dummy field
         _enableEmailButton.selected = _user.enableEmail;//using dummy field
         _mobileNumberTextField.text = _user.mobileNumberForNotification;//using dummy field
         _emailAddressTextField.text = _user.emailForNotification;//using dummy field
         _keyword1TextField.text = _user.keywrod1;//using dummy field
         _keyword2TextField.text = _user.keywrod2;//using dummy field
         _keyword3TextField.text = _user.keywrod3;//using dummy field
         _customMessage1TextField.text = _user.customMessage1;//using dummy field
         _customMessage2TextField.text = _user.customMessage2;//using dummy field
         _customMessage3TextField.text = _user.customMessage3;//using dummy field
      }
      
      override public function getUpdate():User 
      {
         if(isModified == false) return _user;
         _user.enableSms = _enableSmsButton.selected;//using dummy field
         _user.enableEmail = _enableEmailButton.selected;//using dummy field
         _user.mobileNumberForNotification = StringUtil.trim(_mobileNumberTextField.text);//using dummy field
         _user.emailForNotification = StringUtil.trim(_emailAddressTextField.text);//using dummy field
         _user.keywrod1 = StringUtil.trim(_keyword1TextField.text);//using dummy field
         _user.keywrod2 = StringUtil.trim(_keyword2TextField.text);//using dummy field
         _user.keywrod3 = StringUtil.trim(_keyword3TextField.text);//using dummy field
         _user.customMessage1 = StringUtil.trim(_customMessage1TextField.text);//using dummy field
         _user.customMessage2 = StringUtil.trim(_customMessage2TextField.text);//using dummy field
         _user.customMessage3 = StringUtil.trim(_customMessage3TextField.text);//using dummy field
         return _user;
      }
   }
}