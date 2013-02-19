package settings
{
   import com.halcyon.layout.common.HalcyonLabel;
   import com.halcyon.layout.common.HalcyonSliderSwitch;
   import com.halcyon.layout.common.HalcyonTextInput;
   import com.halcyon.layout.common.HalcyonVGroup;
   import com.halcyon.layout.common.LabelUpdater;
   import com.halcyon.layout.common.Utils;
   import com.soma.ui.layouts.VBoxUI;
   
   import common.HalcyonAbstractForm;
   
   import mx.utils.StringUtil;
   
   import vo.User;
   
   public class DialingOptionsForm extends HalcyonAbstractForm implements LabelUpdater
   {
      private var _label:HalcyonLabel;
      private var _intlDialingLabel:HalcyonLabel;
      private var _intlDialingButton:HalcyonSliderSwitch;
      private var _label2:HalcyonLabel;
      private var _musicOnHoldLabel:HalcyonLabel;
      private var _musicOnHoldButton:HalcyonSliderSwitch;
      private var _label3:HalcyonLabel;
      private var _iMeetCallerIdLabel:HalcyonLabel;
      private var _iMeetCallerIdButton:HalcyonSliderSwitch;
      private var _iMeetCallerIdTextField:HalcyonTextInput;
      
      public function updateLabel():void 
      {
         var dialingOptionsFormNode:Object = Utils.resourcesXml.settings.dialingOptionsForm;
         _label.label = dialingOptionsFormNode.label.text;
         _intlDialingLabel.label = dialingOptionsFormNode.intlDialingLabel.text;
         _label2.label = dialingOptionsFormNode.label2.text.part1 + "\n" + dialingOptionsFormNode.label2.text.part2 + "\n" + dialingOptionsFormNode.label2.text.part3;
         _musicOnHoldLabel.label = dialingOptionsFormNode.musicOnHoldLabel.text;
         _label3.label = dialingOptionsFormNode.label3.text.part1 + "\n" + dialingOptionsFormNode.label3.text.part2 + "\n" + dialingOptionsFormNode.label3.text.part3;
         _iMeetCallerIdLabel.label = dialingOptionsFormNode.iMeetCallerIdLabel.text;
      }
      
      public function DialingOptionsForm()
      {
         super();
         var labelVGroup:HalcyonVGroup = new HalcyonVGroup(this);
         labelVGroup.verticalGap = 30;
         _label = new HalcyonLabel();
         _label.bold = true;
         labelVGroup.addChild(_label);
         _intlDialingLabel = new HalcyonLabel();
         labelVGroup.addChild(_intlDialingLabel);
         _label2 = new HalcyonLabel();
         _label2.bold = true;
         labelVGroup.addChild(_label2);
         _musicOnHoldLabel = new HalcyonLabel();
         labelVGroup.addChild(_musicOnHoldLabel);
         _label3 = new HalcyonLabel();
         _label3.bold = true;
         labelVGroup.addChild(_label3);
         _iMeetCallerIdLabel = new HalcyonLabel();
         labelVGroup.addChild(_iMeetCallerIdLabel);
         
         var actionVGroup:HalcyonVGroup = new HalcyonVGroup(this);
         actionVGroup.childrenAlign = VBoxUI.ALIGN_TOP_RIGHT;
         actionVGroup.top = 30;
         actionVGroup.verticalGap = 50;
         actionVGroup.left = 310;
         _intlDialingButton = new HalcyonSliderSwitch("static", "yes", "no");
         actionVGroup.addChild(_intlDialingButton.content);
         _musicOnHoldButton = new HalcyonSliderSwitch("static", "yes", "no");
         actionVGroup.addChild(_musicOnHoldButton.content);
         
         var callerIdVGroup:HalcyonVGroup = new HalcyonVGroup(actionVGroup);
         callerIdVGroup.childrenAlign = VBoxUI.ALIGN_TOP_RIGHT;
         callerIdVGroup.verticalGap = 20;
         _iMeetCallerIdButton = new HalcyonSliderSwitch("static", "yes", "no");
         callerIdVGroup.addChild(_iMeetCallerIdButton.content);
         _iMeetCallerIdTextField = new HalcyonTextInput(100);
         callerIdVGroup.addChild(_iMeetCallerIdTextField.content);
         actionVGroup.addChild(callerIdVGroup);
         
         _intlDialingButton.addEventListener("sliderStateChange", onValueChange, false, 0, true);
         _musicOnHoldButton.addEventListener("sliderStateChange", onValueChange, false, 0, true);
         _iMeetCallerIdButton.addEventListener("sliderStateChange", onValueChange, false, 0, true);
         
         this.addChild(labelVGroup);
         this.addChild(actionVGroup);
      }
      
      override public function updateUI(argUser:User):void 
      {
         _user = argUser;
         _intlDialingButton.selected = _user.enableIntlDialing;//using dummy field
         _musicOnHoldButton.selected = _user.enableMusicOnHold;//using dummy field
         _iMeetCallerIdButton.selected = _user.enableImeeetCallerId;//using dummy field
         _iMeetCallerIdTextField.text = _user.iMeetCallerId;//using dummy field
      }
      
      override public function getUpdate():User 
      {
         if(isModified == false) return _user;
         _user.enableIntlDialing = _intlDialingButton.selected;//using dummy field
         _user.enableMusicOnHold = _musicOnHoldButton.selected;//using dummy field
         _user.enableImeeetCallerId = _iMeetCallerIdButton.selected;//using dummy field
         _user.iMeetCallerId = StringUtil.trim(_iMeetCallerIdTextField.text);//using dummy field
         return _user;
      }
   }
}