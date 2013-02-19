package editProfile
{
   import com.halcyon.layout.common.LabelUpdater;
   
   import common.HalcyonAbstractForm;
   
   import flash.display.Sprite;
   
   import vo.User;
   
   public class EditProfileMain extends Sprite implements LabelUpdater
   {
      private var _profileForm:ProfileForm;
      private var _detailsForm:DetailsForm;
      private var _photoForm:PhotoForm;
      private var _bioForm:BioForm;
      private var _privacyForm:PrivacyForm;
      private var _passwordForm:PasswordForm;
      private var _optionsForm:OptionsForm;
      private var _selectedForm:Sprite;
      
      public function EditProfileMain()
      {
         super();
         _profileForm = new ProfileForm();
         _detailsForm = new DetailsForm();
         _photoForm = new PhotoForm();
         _bioForm = new BioForm();
         _privacyForm = new PrivacyForm();
         _passwordForm = new PasswordForm();
         _optionsForm = new OptionsForm();
         _detailsForm.visible = false;
         _photoForm.visible = false;
         _bioForm.visible = false;
         _privacyForm.visible = false;
         _passwordForm.visible = false;
         _optionsForm.visible = false;
         _selectedForm = _profileForm;
         this.addChild(_profileForm);
         this.addChild(_detailsForm);
         this.addChild(_photoForm);
         this.addChild(_bioForm);
         this.addChild(_privacyForm);
         this.addChild(_passwordForm);
         this.addChild(_optionsForm);
      }
      
      public function updateLabel():void 
      {
         for(var i:int=0;i<this.numChildren;i++) 
         {
            var child:LabelUpdater = this.getChildAt(i) as LabelUpdater;
            if(child == null) continue;
            child.updateLabel();
         }
      }
      
      public function get selectedIndex():int 
      {
         return this.getChildIndex(_selectedForm);
      }
      
      public function set selectedIndex(value:int):void 
      {
         if(value < 0) return;
         _selectedForm.visible = false;
         _selectedForm = this.getChildAt(value) as Sprite;
         _selectedForm.visible = true;
      }
      
      public function updateUI(argUser:User):void 
      {
         for(var i:int = 0; i<this.numChildren; i++) 
         {
            var pgiForm:HalcyonAbstractForm = this.getChildAt(i) as HalcyonAbstractForm;
            if(pgiForm == null) continue;
            pgiForm.updateUI(argUser);
         }
      }
      
      public function getUpdate():User
      {
         var user:User;
         for(var i:int = 0; i<this.numChildren; i++) 
         {
            var pgiForm:HalcyonAbstractForm = this.getChildAt(i) as HalcyonAbstractForm;
            if(pgiForm == null) continue;
            user = pgiForm.getUpdate();
         }
         return user;
      }
   }
}