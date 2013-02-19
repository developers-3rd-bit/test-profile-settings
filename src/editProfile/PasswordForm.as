package editProfile
{
   import com.halcyon.layout.common.HalcyonLabel;
   import com.halcyon.layout.common.HalcyonTextInput;
   import com.halcyon.layout.common.HalcyonVGroup;
   import com.halcyon.layout.common.LabelUpdater;
   import com.halcyon.layout.common.Utils;
   import com.soma.ui.layouts.VBoxUI;
   
   import common.HalcyonAbstractForm;
   import common.LabelOnlyButton;
   
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   import vo.User;
   
   public class PasswordForm extends HalcyonAbstractForm implements LabelUpdater
   {
      private var _label:HalcyonLabel;
      private var _label2:HalcyonLabel;
      private var _currentPasswordLabel:HalcyonLabel;
      private var _currentPasswordTextField:HalcyonTextInput;
      private var _newPasswordLabel:HalcyonLabel;
      private var _newPasswordTextField:HalcyonTextInput;
      private var _confirmNewPasswordLabel:HalcyonLabel;
      private var _confirmNewPasswordTextField:HalcyonTextInput;
      private var _forgoPasswordLabel:HalcyonLabel;
      private var _saveButton:LabelOnlyButton;
      private var _actionVGroup:HalcyonVGroup;
      
      public function PasswordForm()
      {
         super();
         var labelVGroup:HalcyonVGroup = new HalcyonVGroup(this);
         labelVGroup.verticalGap = 23.5;
         _label = new HalcyonLabel();
         _label.bold = true;
         labelVGroup.addChild(_label);
         _label2 = new HalcyonLabel();
         labelVGroup.addChild(_label2);
         var emptySprite:Sprite = new Sprite();
         labelVGroup.addChild(emptySprite);
         _currentPasswordLabel = new HalcyonLabel();
         labelVGroup.addChild(_currentPasswordLabel);
         _newPasswordLabel = new HalcyonLabel();
         labelVGroup.addChild(_newPasswordLabel);
         _confirmNewPasswordLabel = new HalcyonLabel();
         labelVGroup.addChild(_confirmNewPasswordLabel);
         
         _actionVGroup = new HalcyonVGroup(this);
         _actionVGroup.verticalGap = 8;
         _actionVGroup.top = 84;
         _actionVGroup.left = 220;
         _actionVGroup.childrenAlign = VBoxUI.ALIGN_TOP_RIGHT;
         _currentPasswordTextField = new HalcyonTextInput(120);
         _currentPasswordTextField.displayAsPassword = true;
         _actionVGroup.addChild(_currentPasswordTextField.content);
         _newPasswordTextField = new HalcyonTextInput(120);
         _newPasswordTextField.displayAsPassword = true;
         _actionVGroup.addChild(_newPasswordTextField.content);
         _confirmNewPasswordTextField = new HalcyonTextInput(120);
         _confirmNewPasswordTextField.displayAsPassword = true;
         _actionVGroup.addChild(_confirmNewPasswordTextField.content);
         _forgoPasswordLabel = new HalcyonLabel();
         _forgoPasswordLabel.underline = true;
         _forgoPasswordLabel.buttonMode = true;
         _actionVGroup.addChild(_forgoPasswordLabel);
         _saveButton = new LabelOnlyButton(_actionVGroup);
         _saveButton.fontSize = 9;
         _saveButton.addEventListener(MouseEvent.CLICK, onSaveButtonClick, false, 0, true);
         _actionVGroup.addChild(_saveButton);
         
         _currentPasswordTextField.addEventListener("textChange", onValueChange, false, 0, true);
         _newPasswordTextField.addEventListener("textChange", onValueChange, false, 0, true);
         _confirmNewPasswordTextField.addEventListener("textChange", onValueChange, false, 0, true);
         
         this.addChild(labelVGroup);
         this.addChild(_actionVGroup);
      }
      
      public function updateLabel():void 
      {
         var passwordFormNode:Object = Utils.resourcesXml.editProfile.passwordForm;
         _label.label = passwordFormNode.label.text;
         _label2.label = passwordFormNode.label2.text.part1 + "\n" + passwordFormNode.label2.text.part2 + "\n" + passwordFormNode.label2.text.part3;
         _currentPasswordLabel.label = passwordFormNode.currentPasswordLabel.text;
         _newPasswordLabel.label = passwordFormNode.newPasswordLabel.text;
         _confirmNewPasswordLabel.label = passwordFormNode.confirmNewPasswordLabel.text;
         _forgoPasswordLabel.label = passwordFormNode.forgoPasswordLabel.text;
         _saveButton.label = passwordFormNode.saveButton.label;
         _actionVGroup.refresh();
      }
      
      private function onSaveButtonClick(event:Event):void 
      {
         getUpdate();
      }
      
      override public function updateUI(argUser:User):void
      {
         _user = argUser;
         _currentPasswordTextField.text = _user.password;
      }
      
      override public function getUpdate():User 
      {
         if(isModified == false) return _user;
         if(_newPasswordTextField.text == _confirmNewPasswordTextField.text) 
         {
            _user.password = _confirmNewPasswordTextField.text;
         } 
         else 
         {
            // Show warning message
         }
         return _user;
      }
   }
}