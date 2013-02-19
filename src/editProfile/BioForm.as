package editProfile
{
   import com.halcyon.layout.common.HalcyonLabel;
   import com.halcyon.layout.common.HalcyonTextArea;
   import com.halcyon.layout.common.HalcyonVGroup;
   import com.halcyon.layout.common.LabelUpdater;
   import com.halcyon.layout.common.Utils;
   
   import common.HalcyonAbstractForm;
   
   import mx.utils.StringUtil;
   
   import vo.User;
   
   public class BioForm extends HalcyonAbstractForm implements LabelUpdater
   {
      private var _bioTextArea:HalcyonTextArea;
      private var _label:HalcyonLabel;
      
      public function BioForm()
      {
         super();
         var vGroup:HalcyonVGroup = new HalcyonVGroup(this);
         vGroup.verticalGap = 10;
         _label = new HalcyonLabel();
         vGroup.addChild(_label);
         _bioTextArea = new HalcyonTextArea();
         _bioTextArea.width = 250;
         _bioTextArea.height = 150;
         _bioTextArea.addEventListener("textChange", onValueChange, false, 0, true);
         vGroup.addChild(_bioTextArea.content);
         this.addChild(vGroup);
      }
      
      public function updateLabel():void 
      {
         var bioFormNode:Object = Utils.resourcesXml.editProfile.bioForm;
         _label.label = bioFormNode.label.text;
      }
      
      override public function updateUI(argUser:User):void
      {
         _user = argUser;
         _bioTextArea.text = _user.getAbout();
      }
      
      override public function getUpdate():User 
      {
         if(isModified == false) return _user;
         _user.setAbout(StringUtil.trim(_bioTextArea.text));
         return _user;
      }
   }
}