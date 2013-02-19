package editProfile
{
   import com.halcyon.layout.common.LabelUpdater;
   
   import common.HalcyonAbstractForm;
   
   import flash.text.TextField;
   
   import vo.User;
   
   public class PhotoForm extends HalcyonAbstractForm implements LabelUpdater
   {
      public function PhotoForm()
      {
         super();
         var textField:TextField = new TextField();
         textField.text = "Photo Form";
         this.addChild(textField);
      }
      
      public function updateLabel():void 
      {
         
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