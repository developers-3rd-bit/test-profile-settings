package editProfile
{
   import com.halcyon.layout.common.HalcyonHGroup;
   import com.halcyon.layout.common.HalcyonLabel;
   import com.halcyon.layout.common.HalcyonTextInput;
   import com.halcyon.layout.common.HalcyonVGroup;
   import com.halcyon.layout.common.LabelUpdater;
   import com.halcyon.layout.common.Utils;
   
   import common.HalcyonAbstractForm;
   import common.LabelOnlyButton;
   
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   import mx.utils.StringUtil;
   
   import vo.User;
   
   public class ProfileForm extends HalcyonAbstractForm implements LabelUpdater
   {
      private var _label:HalcyonLabel;
      private var _label2:HalcyonLabel;
      private var _firstNameLabel:HalcyonLabel;
      private var _firstNameTextField:HalcyonTextInput;
      private var _lastNameLabel:HalcyonLabel;
      private var _lastNameTextField:HalcyonTextInput;
      private var _emailLabel:HalcyonLabel;
      private var _emailTextField:TextField;
      private var _editButton:LabelOnlyButton;
      private var _label3:HalcyonLabel;
      
      public function ProfileForm()
      {
         super();
         var vGroup:HalcyonVGroup = new HalcyonVGroup(this);
         vGroup.verticalGap = 5;
         _label = new HalcyonLabel();
         _label.bold = true;
         vGroup.addChild(_label);
         _label2 = new HalcyonLabel();
         vGroup.addChild(_label2);
         
         var labelVGroup:HalcyonVGroup = new HalcyonVGroup(this);
         labelVGroup.top = 40;
         labelVGroup.verticalGap = 25;
         _firstNameLabel = new HalcyonLabel();
         labelVGroup.addChild(_firstNameLabel);
         _lastNameLabel = new HalcyonLabel();
         labelVGroup.addChild(_lastNameLabel);
         _emailLabel = new HalcyonLabel();
         labelVGroup.addChild(_emailLabel);
         _label3 = new HalcyonLabel();
         labelVGroup.addChild(_label3);
         
         var actionVGroup:HalcyonVGroup = new HalcyonVGroup(this);
         actionVGroup.top = 47;
         actionVGroup.left = 70;
         actionVGroup.verticalGap = 8;
         _firstNameTextField = new HalcyonTextInput(180);
         actionVGroup.addChild(_firstNameTextField.content);
         _lastNameTextField = new HalcyonTextInput(180);
         actionVGroup.addChild(_lastNameTextField.content);
         
         var hGroup:HalcyonHGroup = new HalcyonHGroup(this);
         hGroup.top = 95;
         hGroup.left = 68;
         _emailTextField = new TextField();
         _emailTextField.width = 145;
         _emailTextField.height = 18;
         hGroup.addChild(_emailTextField);
         _editButton = new LabelOnlyButton(hGroup);
         _editButton.fontSize = 9;
         _editButton.addEventListener(MouseEvent.CLICK, onEditButtonClick, false, 0, true);
         hGroup.addChild(_editButton);
         
         _firstNameTextField.addEventListener("textChange", onValueChange, false, 0, true);
         _lastNameTextField.addEventListener("textChange", onValueChange, false, 0, true);
         _emailTextField.addEventListener("textChange", onValueChange, false, 0, true);
         
         actionVGroup.addChild(hGroup);
         vGroup.addChild(actionVGroup);
         vGroup.addChild(labelVGroup);
         this.addChild(vGroup);
      }
      
      public function updateLabel():void
      {
         var profileFormNode:Object = Utils.resourcesXml.editProfile.profileForm;
         _label.label = profileFormNode.label.text;
         _label2.label = profileFormNode.label2.text;
         _firstNameLabel.label = profileFormNode.firstNameLabel.text;
         _lastNameLabel.label = profileFormNode.lastNameLabel.text;
         _emailLabel.label = profileFormNode.emailLabel.text;
         _editButton.label = profileFormNode.editButton.label;
         _label3.label = profileFormNode.label3.text;
      }
      
      private function onEditButtonClick(event:Event):void 
      {
         _emailTextField.type = TextFieldType.INPUT;
      }
      
      override public function updateUI(argUser:User):void 
      {
         _user = argUser;
         _firstNameTextField.text = _user.getFirstName();
         _lastNameTextField.text = _user.getLastName();
         _emailTextField.text = _user.getEmail();
      }
      
      override public function getUpdate():User 
      {
         if(isModified == false) return _user;
         _user.setFirstName(StringUtil.trim(_firstNameTextField.text));
         _user.setLastName(StringUtil.trim(_lastNameTextField.text));
         _user.setEmail(StringUtil.trim(_emailTextField.text));
         return _user;
      }
   }
}