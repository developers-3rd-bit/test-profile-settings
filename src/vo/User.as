package vo
{
   import com.halcyon.interfaces.user.IFullInternalUser;

   public class User implements IFullInternalUser
   {
      private static var _userCounter:Number = 0;
      
      public var _isUnknownCaller:Boolean = false;
      public var showPhone:Boolean = false;
      public var dialinOnly:Boolean = false;
      public var isOnConference:Boolean = false;
      public var streaming:Boolean = false;
      
      public var merged:Boolean = false;
      private var _userID:Number;
      private var _loading:Boolean = false;
      private var _firstName:String;
      private var _lastName:String;
      private var _name:String;
      private var _title:String;
      private var _company:String;
      private var _email:String;
      private var _location:String;
      private var _ref:Object;
      private var _pref:Object;
      private var _state:String;
      private var _isDVR:Boolean;
      private var _isSpectator:Boolean;
      private var _linkedProfilePicUrl:String;
      private var _partId:String;
      private var _phoneIntlPrefix:String;
      private var _showVcard:Boolean;
      private var _about:String;
      private var _skipInfoPrompt:Boolean;
      private var _currentPhotoURI:String;
      private var _isHost:Boolean;
      private var _isSocialUser:Boolean;
      
      //Not found.  So using dummy fields
      public var password:String;
      public var primaryPhone:String;
      public var enableLocationDetection:Boolean;
      public var enableIntlDialing:Boolean;
      public var enableMusicOnHold:Boolean;
      public var enableImeeetCallerId:Boolean;
      public var iMeetCallerId:String;
      public var enableSms:Boolean;
      public var enableEmail:Boolean;
      public var mobileNumberForNotification:String;
      public var emailForNotification:String;
      public var keywrod1:String;
      public var keywrod2:String;
      public var keywrod3:String;
      public var customMessage1:String;
      public var customMessage2:String;
      public var customMessage3:String;
      public var roomKey:String;
      public var iMeetRoomAddress:String;
      public var isRoomOpen:Boolean;
      
      public function User() 
      {
         _userID = _userCounter++;
         _ref = new Object();
         _pref = new Object();
      }
      
      public function getAccountType() : int 
      {
         return 0;
      }
      
      public function getAge() : int 
      {
         return 0;
      }
      
      public function getCompany() : String 
      {
         return _company;
      }
      
      public function getDialinOnly() : Boolean 
      {
         return dialinOnly;
      }
      
      public function getEmail() : String 
      {
         return _email;
      }
      
      public function getFirstName() : String
      {
         return _firstName;
      }
      
      public function getGMTOffset() : Number
      {
         return 0;
      }
      
      public function getGender() : String 
      {
         return null;
      }
      
      public function getId() : Number
      {
         return _userID;
      }
      
      public function getImageIdx() : int
      {
         return 0;
      }
      
      public function getImageType() : int
      {
         return 0;
      }
      
      public function getIsActiveTalker() : Boolean 
      {
         return false;
      }
      
      public function getIsGuest() : Boolean
      {
         return false;
      }
      
      public function getIsMuted() : Boolean 
      {
         return false;
      }
      
      public function getIsOnConference() : Boolean 
      {
         return isOnConference;
      }
      
      public function getIsUnknownCaller() : Boolean 
      {
         return _isUnknownCaller;
      }
      
      public function getJoined() : String 
      {
         return null;
      }
      
      public function getLastName() : String 
      {
         return _lastName;
      }
      
      public function getLat() : Number 
      {
         return 0;
      }
      
      public function getLoading() : Boolean 
      {
         return _loading;
      }
      
      public function getLocation() : String
      {
         return _location;
      }
      
      public function getLong() : Number
      {
         return 0;
      }
      
      public function getMerged() : Boolean
      {
         return false;
      }
      
      public function getName() : String
      {
         return _name;
      }
      
      public function getPhone() : String 
      {
         return null;
      }
      
      public function getPhoneExt() : String 
      {
         return null;
      }
      
      public function getPrefs() : Object
      {
         return _pref;
      }
      
      public function getRef() : Object 
      {
         return _ref;
      }
      
      public function getScreenName() : String
      {
         return null;
      }
      
      public function getShowPhone() : Boolean
      {
         return showPhone;
      }
      
      public function getSpeakLevel() : int
      {
         return 0;
      }
      
      public function getStreaming() : Boolean
      {
         return streaming;
      }
      
      public function getTitle() : String
      {
         return _title;
      }
      
      public function getState() : String
      {
         return _state;
      }
      
      public function getIsDVR():Boolean
      {
         return _isDVR;
      }
      
      public function getIsSpectator():Boolean
      {
         return _isSpectator;
      }
      
      public function getLinkedProfilePicUrl():String
      {
         return _linkedProfilePicUrl;
      }
      
      public function getPartId():String
      {
         return _partId;
      }
      
      public function getPhoneIntlPrefix():String
      {
         return _phoneIntlPrefix;
      }
      
      public function getShowVcard():Boolean
      {
         return _showVcard;
      }
      
      public function getAbout():String
      {
         return _about;
      }
      
      public function getSkipInfoPrompt():Boolean
      {
         return _skipInfoPrompt;
      }
      
      public function getCurrentPhotoURI():String
      {
         return _currentPhotoURI;
      }
      
      public function isHost():Boolean
      {
         return _isHost;
      }
      
      public function isSocialUser():Boolean
      {
         return _isSocialUser;
      }
      
      public function setCompany(value:String) : void 
      {
         _company = value;
      }
      
      public function setLocation(value:String) : void
      {
         _location = value;
      }
      
      public function setEmail(value:String) : void
      {
         _email = value;
      }
      
      public function setAbout(value:String) : void 
      {
         _about = value;
      }
      
      public function setLoading(value:Boolean) : void
      {
         _loading = value;
      }
      
      public function setFirstName(value:String) : void
      {
         _firstName = value;
      }
      
      public function setLastName(value:String) : void
      {
         _lastName = value;
      }
      
      public function setMerged(value:Boolean) : void
      {
         merged = value;
      }
      
      public function setName(value:String) : void
      {
         _name = value;
      }
      
      public function setPrefs(prefs:Object) : void
      {
         _pref = prefs;
      }
      
      public function setTitle(value:String) : void
      {
         _title = value;
      }
      
      public function setState(value:String) : void
      {
         _state = value;
      }
      
      public function setSkipInfoPrompt(value:Boolean):void
      {
         _skipInfoPrompt = value;         
      }
      
      public function setShowVCard(value:Boolean):void 
      {
         _showVcard = value;
      }
      
      public function sendUpdate():void
      {
      }
   }
}