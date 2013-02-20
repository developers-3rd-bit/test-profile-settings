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
   
   import fl.controls.ComboBox;
   
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.text.TextFieldAutoSize;
   
   import settings.SettingsMain;
   import settings.SettingsTab;
   
   import vo.User;
   
   public class TestSettingsScreen extends Sprite implements LabelUpdater
   {
      private var _settingsTab:SettingsTab;
      private var _settingsMain:SettingsMain;
      private var _footerLabel:HalcyonLabel;
      private var _intlPricingLabel:HalcyonLabel;
      private var _localeDropDown:ComboBox;
      private var _title:HalcyonLabel;
      private var _title2:HalcyonLabel;
      private var _doneButton:HalcyonLabelOnlyButton;
      private var _canvas:HalcyonCanvas; 
      
      public function TestSettingsScreen()
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
         
         _title2 = new HalcyonLabel();
         this.addChild(_canvas.prepareElementAndPosition(_title2, 38, NaN, 10, NaN));
         
         _settingsTab = new SettingsTab();
         _settingsTab.addEventListener("tabIndexChange", settingsTabIndexChange, false, 0, true);
         this.addChild(_canvas.prepareElementAndPosition(_settingsTab, 60, NaN, 13, NaN));
         
         _settingsMain = new SettingsMain();
         this.addChild(_canvas.prepareElementAndPosition(_settingsMain, 90, NaN, 35, NaN));
         
         var mcDividerBottom:McDivider = new McDivider();
         this.addChild(_canvas.prepareElementAndPosition(mcDividerBottom, 320, NaN, 10, NaN));
         
         _footerLabel = new HalcyonLabel();
         _footerLabel.visible = false;
         this.addChild(_canvas.prepareElementAndPosition(_footerLabel, 325, NaN, 10, NaN));
         
         _intlPricingLabel = new HalcyonLabel();
         _intlPricingLabel.underline = true;
         _intlPricingLabel.autoSize = TextFieldAutoSize.CENTER;
         _intlPricingLabel.buttonMode = true;
         _intlPricingLabel.visible = false;
         this.addChild(_canvas.prepareElementAndPosition(_intlPricingLabel, 325, NaN, 125, NaN));
         
         _doneButton = new HalcyonLabelOnlyButton(_canvas);
         _doneButton.addEventListener(MouseEvent.CLICK, onDoneButtonClick, false, 0, true);
         this.addChild(_canvas.prepareElementAndPosition(_doneButton, 325, NaN, NaN, 8));
         
         setDummyData();
      }
      
      public function updateLabel():void 
      {
         var settingsNode:Object = Utils.resourcesXml.settings;
         _title.label = settingsNode.title;
         _title2.label = settingsNode.title2;
         _footerLabel.label = settingsNode.footerLabel.text;
         _intlPricingLabel.label = settingsNode.intlPricingLabel.text;
         _doneButton.label = settingsNode.doneButton.label;
         _settingsTab.updateLabel();
         _settingsMain.updateLabel();
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
         testUser.password = "abcd";
         testUser.enableSms = true;
         testUser.enableEmail = true;
         testUser.mobileNumberForNotification = "+14047847496";
         testUser.emailForNotification = testUser.getEmail();
         testUser.keywrod1 = "gtg";
         testUser.keywrod2 = "cyl";
         testUser.keywrod3 = "brb";
         testUser.customMessage1 = "got to go";
         testUser.customMessage2 = "call you later";
         testUser.customMessage3 = "be right back";
         testUser.enableIntlDialing = true;
         testUser.enableMusicOnHold = false;
         testUser.enableImeeetCallerId = true;
         testUser.iMeetCallerId = "john.doe@imeet.com";
         testUser.roomKey = "";
         testUser.isRoomOpen = true;
         testUser.iMeetRoomAddress = "https://imeet.com/pgi/isan";
         _settingsMain.updateUI(testUser);
      }
      
      private function settingsTabIndexChange(event:LayoutEvent):void 
      {
         _settingsMain.selectedIndex = _settingsTab._hGroup.getChildIndex(event.extra as HalcyonTab) - 1;
         if(_settingsMain.selectedIndex == 3) 
         {
            _footerLabel.visible = true;
            _intlPricingLabel.visible = true;
            _intlPricingLabel.addEventListener(MouseEvent.CLICK, showIntlPricingTable, false, 0, true);
         }
         else
         {
            _footerLabel.visible = false;
            _intlPricingLabel.visible = false;
            _intlPricingLabel.removeEventListener(MouseEvent.CLICK, showIntlPricingTable);
         }
      }
      
      private function showIntlPricingTable(event:Event):void
      {
         
      }
      
      private function onDoneButtonClick(event:Event):void 
      {
         
      }
      
      private function onHelpButtonClick(event:Event):void 
      {
         
      }
      
      private function onCloseButtonClick(event:Event):void 
      {
         
      }
   }
}