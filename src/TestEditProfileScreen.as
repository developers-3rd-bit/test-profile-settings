package
{
   import com.halcyon.layout.common.HalcyonButton;
   import com.halcyon.layout.common.HalcyonCanvas;
   import com.halcyon.layout.common.HalcyonLabel;
   import com.halcyon.layout.common.HalcyonLabelOnlyButton;
   import com.halcyon.layout.common.HalcyonTab;
   import com.halcyon.layout.common.LabelUpdater;
   import com.halcyon.layout.common.LayoutEvent;
   import com.halcyon.layout.common.Utils;
   
   import editProfile.EditProfileMain;
   import editProfile.EditProfileTab;
   
   import fl.controls.ComboBox;
   
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   import vo.User;
   
   public class TestEditProfileScreen extends Sprite implements LabelUpdater
   {
      private var _editProfileTab:EditProfileTab;
      private var _editProfileMain:EditProfileMain;
      private var _localeDropDown:ComboBox;
      private var _title:HalcyonLabel;
      private var _doneButton:HalcyonLabelOnlyButton;
      private var _canvas:HalcyonCanvas;
      
      public function TestEditProfileScreen()
      {
         super();
         loadLocale("en_US");
         
         _canvas = new HalcyonCanvas(this, 420, stage.height);
         
         _title = new HalcyonLabel();
         _title.fontSize = 14;
         this.addChild(_canvas.prepareElementAndPosition(_title, 10, NaN, 10, NaN));
         
         _localeDropDown = new ComboBox();
         _localeDropDown.dataProvider.addItems(Utils.locales);
         _localeDropDown.addEventListener(Event.CHANGE, onLocaleChange, false, 0, true);
         this.addChild(_canvas.prepareElementAndPosition(_localeDropDown, 7, NaN, NaN, 50));
         
         var helpButton:HalcyonButton = new HalcyonButton(McHelpButton);
         helpButton.content.addEventListener(MouseEvent.CLICK, onHelpButtonClick, false, 0, true);
         this.addChild(_canvas.prepareElementAndPosition(helpButton.content, 18, NaN, NaN, 20));
         
         var closeButton:HalcyonButton = new HalcyonButton(McCloseButton);
         closeButton.content.addEventListener(MouseEvent.CLICK, onCloseButtonClick, false, 0, true);
         this.addChild(_canvas.prepareElementAndPosition(closeButton.content, 18, NaN, NaN, 0));
         
         var mcDividerTop:McDivider = new McDivider();
         this.addChild(_canvas.prepareElementAndPosition(mcDividerTop, 33, NaN, 10, NaN));
         
         _editProfileTab = new EditProfileTab();
         _editProfileTab.addEventListener("tabIndexChange", editProfileTabIndexChange, false, 0, true);
         this.addChild(_canvas.prepareElementAndPosition(_editProfileTab, 55, NaN, 10, NaN));
         
         _editProfileMain = new EditProfileMain();
         this.addChild(_canvas.prepareElementAndPosition(_editProfileMain, 95, NaN, 70, NaN));
         
         var mcDividerBottom:McDivider = new McDivider();
         this.addChild(_canvas.prepareElementAndPosition(mcDividerBottom, 320, NaN, 10, NaN));
         
         _doneButton = new HalcyonLabelOnlyButton(this);
         _doneButton.addEventListener(MouseEvent.CLICK, onDoneButtonClick, false, 0, true);
         this.addChild(_canvas.prepareElementAndPosition(_doneButton, 325, NaN, NaN, 8));
         
         setDummyData();
      }
      
      public function updateLabel():void 
      {
         var editProfileNode:Object = Utils.resourcesXml.editProfile;
         _title.label = editProfileNode.title;
         _doneButton.label = editProfileNode.doneButton.label;
         _editProfileTab.updateLabel();
         _editProfileMain.updateLabel();
         _canvas.refresh();
      }
      
      private function onLocaleChange(event:Event):void 
      {
         loadLocale(event.currentTarget.selectedItem.value);
      }
      
      private function loadLocale(value:String):void 
      {
         var loader:URLLoader = new URLLoader(new URLRequest("\assets/locale/"+ value +"/resources.xml"));
         loader.addEventListener(Event.COMPLETE, xmlLoaded);
      }
      
      private function xmlLoaded(e:Event):void 
      {
         Utils.resourcesXml = new XML(e.target.data);
         e.currentTarget.removeEventListener(Event.COMPLETE, xmlLoaded);
         updateLabel();
      }
      
      private function setDummyData():void 
      {
         var testUser:User = new User();
         testUser.setFirstName("John");
         testUser.setLastName("Doe");
         testUser.setName("John Doe");
         testUser.setTitle("Designer");
         testUser.setAbout("Likes football");
         testUser.setCompany("PGI");
         testUser.setLocation("Atlanta, Georgia");
         testUser.setEmail("john.doe@gmail.com");
         testUser.setShowVCard(true);
         testUser.password = "abcd";
         testUser.enableLocationDetection = true;
         var preferences:Object = new Object();
         preferences.language = "English";
         preferences.temperature = "celsius";
         preferences.clock = "12-hour";
         preferences.turnWebcam = true;
         preferences.displayConnectPanel = false;
         preferences.callComputer = true;
         testUser.setPrefs(preferences);
         _editProfileMain.updateUI(testUser);
      }
      
      private function editProfileTabIndexChange(event:LayoutEvent):void 
      {
         _editProfileMain.selectedIndex = _editProfileTab._hGroup.getChildIndex(event.extra as HalcyonTab) - 1;
      }
      
      private function onDoneButtonClick(event:Event):void 
      {
         var user:User = _editProfileMain.getUpdate();
         //save the user to db
      }
      
      private function onHelpButtonClick(event:Event):void 
      {
         
      }
      
      private function onCloseButtonClick(event:Event):void 
      {
         
      }
   }
}