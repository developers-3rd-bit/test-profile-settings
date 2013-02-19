package settings
{
   import common.HalcyonAbstractForm;
   
   import flash.text.TextField;
   
   import vo.User;
   
   public class RoomNameAndThemeForm extends HalcyonAbstractForm
   {
      public function RoomNameAndThemeForm()
      {
         super();
         var textField:TextField = new TextField();
         textField.text = "Room And Theme";
         this.addChild(textField);
      }
      
      override public function updateUI(argUser:User):void 
      {
         _user = argUser;
      }
      
      override public function getUpdate():User
      {
         if(isModified == false) return _user;
         return _user;
      }
   }
}