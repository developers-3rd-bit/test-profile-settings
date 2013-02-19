package editProfile
{
   import com.halcyon.layout.common.HalcyonHGroup;
   import com.halcyon.layout.common.HalcyonLabel;
   import com.halcyon.layout.common.HalcyonSliderSwitch;
   import com.halcyon.layout.common.LabelUpdater;
   import com.halcyon.layout.common.Utils;
   
   import common.HalcyonAbstractForm;
   
   import vo.User;
   
   public class PrivacyForm extends HalcyonAbstractForm implements LabelUpdater
   {
      private var _downloadContactDetailsLabel:HalcyonLabel;
      private var _downloadContactDetailsButton:HalcyonSliderSwitch;
      private var _hGroup:HalcyonHGroup;
      
      public function PrivacyForm()
      {
         super();
         _hGroup = new HalcyonHGroup(this);
         _hGroup.horizontalgap = 15;
         _downloadContactDetailsLabel = new HalcyonLabel();
         _hGroup.addChild(_downloadContactDetailsLabel);
         _downloadContactDetailsButton = new HalcyonSliderSwitch("static", "yes", "no");
         _hGroup.addChild(_downloadContactDetailsButton.content);
         
         _downloadContactDetailsButton.addEventListener("sliderStateChange", onValueChange, false, 0, true);
         
         this.addChild(_hGroup);
      }
      
      public function updateLabel():void 
      {
         var privacyFormNode:Object = Utils.resourcesXml.editProfile.privacyForm;
         _downloadContactDetailsLabel.label = privacyFormNode.downloadContactDetailsLabel.text.part1 + "\n" + privacyFormNode.downloadContactDetailsLabel.text.part2;
         _hGroup.refresh();
      }
      
      override public function updateUI(argUser:User):void 
      {
         _user = argUser;
         _downloadContactDetailsButton.selected = _user.getShowVcard();
      }
      
      override public function getUpdate():User 
      {
         if(isModified == false) return _user;
         _user.setShowVCard(_downloadContactDetailsButton.selected);
         return _user;
      }
   }
}