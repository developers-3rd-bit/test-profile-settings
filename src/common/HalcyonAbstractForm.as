package common
{
   import flash.display.Sprite;
   import flash.events.Event;
   
   import vo.User;
   
   public class HalcyonAbstractForm extends Sprite
   {
      private var _isModified:Boolean;
      protected static var _user:User;
      
      public function HalcyonAbstractForm()
      {
         super();
      }
      
      public function get isModified():Boolean
      {
         return _isModified;
      }
      
      public function updateUI(argUser:User):void { }
      
      public function getUpdate():User
      {
         return _user;
      }
      
      protected function onValueChange(event:Event):void 
      { 
         _isModified = true;
      }
   }
}