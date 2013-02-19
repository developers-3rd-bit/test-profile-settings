package editProfile
{
   import com.halcyon.layout.common.HalcyonHGroup;
   import com.halcyon.layout.common.HalcyonLabel;
   import com.halcyon.layout.common.HalcyonSliderSwitch;
   import com.halcyon.layout.common.HalcyonVGroup;
   import com.halcyon.layout.common.LabelUpdater;
   import com.halcyon.layout.common.Utils;
   
   import common.HalcyonAbstractForm;
   
   import fl.controls.ComboBox;
   import fl.controls.RadioButton;
   import fl.controls.RadioButtonGroup;
   
   import flash.events.Event;
   
   import vo.User;
   
   public class OptionsForm extends HalcyonAbstractForm implements LabelUpdater
   {
      private var _languageLabel:HalcyonLabel;
      private var _temperatureLabel:HalcyonLabel;
      private var _clockLabel:HalcyonLabel;
      private var _languageDropDown:ComboBox;
      private var _fahrenheitRadioButton:RadioButton;
      private var _celsiusRadioButton:RadioButton;
      private var _temperatureRBGroup:RadioButtonGroup;
      private var _twelveHourRadioButton:RadioButton;
      private var _twentyFourHourRadioButton:RadioButton;
      private var _clockDisplayRBGroup:RadioButtonGroup;
      private var _turnWebcamLabel:HalcyonLabel;
      private var _displayConnectPanelLabel:HalcyonLabel;
      private var _callComputerLabel:HalcyonLabel;
      private var _turnWebcamButton:HalcyonSliderSwitch;
      private var _displayConnectPanelButton:HalcyonSliderSwitch;
      private var _callComputerButton:HalcyonSliderSwitch;
      private var _hGroup1:HalcyonHGroup;
      private var _hGroup2:HalcyonHGroup;
      
      public function OptionsForm()
      {
         super();
         var vGroup1:HalcyonVGroup = new HalcyonVGroup(this);
         vGroup1.top = 5;
         vGroup1.verticalGap = 20;
         _languageLabel = new HalcyonLabel();
         vGroup1.addChild(_languageLabel);
         _temperatureLabel = new HalcyonLabel();
         vGroup1.addChild(_temperatureLabel);
         _clockLabel = new HalcyonLabel();
         vGroup1.addChild(_clockLabel);
         this.addChild(vGroup1);
         
         var vGroup2:HalcyonVGroup = new HalcyonVGroup(this);
         vGroup2.verticalGap = 3;
         vGroup2.left = 150;
         _languageDropDown = new ComboBox();
         _languageDropDown.width = 120;
         vGroup2.addChild(_languageDropDown);
         
         _hGroup1 = new HalcyonHGroup(this);
         _hGroup1.horizontalgap = -50;
         _fahrenheitRadioButton = new RadioButton();
         _fahrenheitRadioButton.value = "fahrenheit";
         _hGroup1.addChild(_fahrenheitRadioButton);
         _celsiusRadioButton = new RadioButton();
         _celsiusRadioButton.value = "celsius";
         _hGroup1.addChild(_celsiusRadioButton);
         vGroup2.addChild(_hGroup1);
         
         _temperatureRBGroup = new RadioButtonGroup("");
         _temperatureRBGroup.addRadioButton(_fahrenheitRadioButton);
         _temperatureRBGroup.addRadioButton(_celsiusRadioButton);
         
         _hGroup2 = new HalcyonHGroup(this);
         _hGroup2.top = 48;
         _hGroup2.horizontalgap = -30;
         _twelveHourRadioButton = new RadioButton();
         _twelveHourRadioButton.value = "12-hour";
         _hGroup2.addChild(_twelveHourRadioButton);
         _twentyFourHourRadioButton = new RadioButton();
         _twentyFourHourRadioButton.value = "24-hour";
         _hGroup2.addChild(_twentyFourHourRadioButton);
         vGroup2.addChild(_hGroup2);
         this.addChild(vGroup2);
         
         _clockDisplayRBGroup = new RadioButtonGroup("");
         _clockDisplayRBGroup.addRadioButton(_twelveHourRadioButton);
         _clockDisplayRBGroup.addRadioButton(_twentyFourHourRadioButton);
         
         var mcDivider:McDivider = new McDivider();
         mcDivider.width = 268;
         vGroup1.addChild(mcDivider);
         _turnWebcamLabel = new HalcyonLabel();
         vGroup1.addChild(_turnWebcamLabel);
         _displayConnectPanelLabel = new HalcyonLabel();
         vGroup1.addChild(_displayConnectPanelLabel);
         _callComputerLabel = new HalcyonLabel();
         vGroup1.addChild(_callComputerLabel);
         
         var vGroup3:HalcyonVGroup = new HalcyonVGroup(this);
         vGroup3.top = 98;
         vGroup3.verticalGap = 8;
         vGroup3.left = 208;
         _turnWebcamButton = new HalcyonSliderSwitch("static", "yes", "no");
         vGroup3.addChild(_turnWebcamButton.content);
         _displayConnectPanelButton = new HalcyonSliderSwitch("static", "yes", "no");
         vGroup3.addChild(_displayConnectPanelButton.content);
         _callComputerButton = new HalcyonSliderSwitch("static", "yes", "no");
         vGroup3.addChild(_callComputerButton.content);
         
         _languageDropDown.addEventListener(Event.CHANGE, onValueChange, false, 0, true);
         _temperatureRBGroup.addEventListener(Event.CHANGE, onValueChange, false, 0, true);
         _clockDisplayRBGroup.addEventListener(Event.CHANGE, onValueChange, false, 0, true);
         _turnWebcamButton.addEventListener("sliderStateChange", onValueChange, false, 0, true);
         _displayConnectPanelButton.addEventListener("sliderStateChange", onValueChange, false, 0, true);
         _callComputerButton.addEventListener("sliderStateChange", onValueChange, false, 0, true);
         
         this.addChild(vGroup3);
      }
      
      public function updateLabel():void 
      {
         var optionsFormNode:Object = Utils.resourcesXml.editProfile.optionsForm;
         _hGroup1.left = optionsFormNode.hGroup1.left;
         _hGroup1.refresh();
         _hGroup2.left = optionsFormNode.hGroup2.left;
         _hGroup2.refresh();
         _languageLabel.label = optionsFormNode.languageLabel.text;
         _temperatureLabel.label = optionsFormNode.temperatureLabel.text;
         _clockLabel.label = optionsFormNode.clockLabel.text;
         _languageDropDown.prompt = optionsFormNode.languageDropDown.prompt;
         _fahrenheitRadioButton.label = optionsFormNode.fahrenheitRadioButton.label;
         _celsiusRadioButton.label = optionsFormNode.celsiusRadioButton.label;
         _twelveHourRadioButton.label = optionsFormNode.twelveHourRadioButton.label;
         _twentyFourHourRadioButton.label = optionsFormNode.twentyFourHourRadioButton.label;
         _turnWebcamLabel.label = optionsFormNode.turnWebcamLabel.text.part1 + "\n" + optionsFormNode.turnWebcamLabel.text.part2;
         _displayConnectPanelLabel.label = optionsFormNode.displayConnectPanelLabel.text.part1 + "\n" + optionsFormNode.displayConnectPanelLabel.text.part2;
         _callComputerLabel.label = optionsFormNode.callComputerLabel.text.part1 + "\n" + optionsFormNode.callComputerLabel.text.part2;
         /*_turnWebcamButton.selectedLabel = optionsFormNode.turnWebcamButton.selectedLabel;
         _turnWebcamButton.unselectedLabel = optionsFormNode.turnWebcamButton.unSelectedLabel;
         _displayConnectPanelButton.selectedLabel = optionsFormNode.displayConnectPanelButton.selectedLabel;
         _displayConnectPanelButton.unselectedLabel = optionsFormNode.displayConnectPanelButton.unSelectedLabel;
         _callComputerButton.selectedLabel = optionsFormNode.callComputerButton.selectedLabel;
         _callComputerButton.unselectedLabel = optionsFormNode.callComputerButton.unSelectedLabel;*/
      }
      
      override public function updateUI(argUser:User):void 
      {
         _user = argUser;
         var preferences:Object = _user.getPrefs();
         _languageDropDown.selectedItem = preferences.language;
         _temperatureRBGroup.selectedData = preferences.temperature;
         _clockDisplayRBGroup.selectedData = preferences.clock;
         _turnWebcamButton.selected = preferences.turnWebcam;
         _displayConnectPanelButton.selected = preferences.displayConnectPanel;
         _callComputerButton.selected = preferences.callComputer;
      }
      
      override public function getUpdate():User 
      {
         if(isModified == false) return _user;
         var preferences:Object = new Object();
         preferences.language = _languageDropDown.selectedItem;
         preferences.temperature = _temperatureRBGroup.selectedData;
         preferences.clock = _clockDisplayRBGroup.selectedData;
         preferences.turnWebcam = _turnWebcamButton.selected;
         preferences.displayConnectPanel = _displayConnectPanelButton.selected;
         preferences.callComputer = _callComputerButton.selected;
         _user.setPrefs(preferences);
         return _user;
      }
   }
}