package settings
{
   import com.halcyon.layout.common.LabelUpdater;
   
   import common.HalcyonAbstractForm;
   
   import flash.display.Sprite;
   
   import vo.User;
   
   public class SettingsMain extends Sprite implements LabelUpdater
   {
      private var _roomKeyAndUrlForm:RoomKeyAndUrlForm;
      private var _roomNameAndThemeForm:RoomNameAndThemeForm;
      private var _smsOrEmailMessagesForm:SMSOrEmailMessagesForm;
      private var _dialingOptionsForm:DialingOptionsForm;
      private var _selectedForm:Sprite;
      
      public function SettingsMain()
      {
         super();
         _roomKeyAndUrlForm = new RoomKeyAndUrlForm();
         _roomNameAndThemeForm = new RoomNameAndThemeForm();
         _smsOrEmailMessagesForm = new SMSOrEmailMessagesForm();
         _dialingOptionsForm = new DialingOptionsForm();
         _roomNameAndThemeForm.visible = false;
         _smsOrEmailMessagesForm.visible = false;
         _dialingOptionsForm.visible = false;
         _selectedForm = _roomKeyAndUrlForm;
         this.addChild(_roomKeyAndUrlForm);
         this.addChild(_roomNameAndThemeForm);
         this.addChild(_smsOrEmailMessagesForm);
         this.addChild(_dialingOptionsForm);
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