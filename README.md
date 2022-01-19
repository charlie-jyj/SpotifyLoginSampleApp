## Spotify login clone coding
> 로그인 화면 구현하기

### 1) 구현 기능
- Backend 와 Frontend 데이터 흐름
- Firebase dlswmd
- 이메일 로그인 
- Google 로그인
- Apple 로그인

### 2) 기본 개념

#### (1) Firebase

##### Cloud Firestore

##### 인증 (Auth)

- OAuth
    - 사용자 인증 방식에 대한 업계 표준
    - id/pw 를 노출하지 않고 OAuth를 사용하는 업체의 API 접근 권한을 위임 받음
    - 기본 개념
        + User Service Provider(구글, 페이스북…)에 계정을 가지고 있는 사용자
        + Consumer Service Provider 의 API를 사용하려는 서비스 (앱/웹)
        + Service Provider OAuth 를 사용하여 API를 제공하는 서비스 (Firebase)
        + Access Token 인증 완료 후 Service Provider의 제공 기능을 이용할 수 있는 권한을 위임받은 인증키 

<img src=“https://cloud.google.com/appengine/docs/standard/python/images/firebase_auth_diagram.svg”>

- 앱에 구글 로그인 추가위해 초기 설정
https://firebase.google.com/docs/auth/ios/google-signin?hl=ko

- login with Apple ID
https://firebase.google.com/docs/auth/ios/apple
    - ASAuthorizationController
    - func presentationAnchor 
        + tells the delegate from which window it should present content to the user
        + presentation context UI 를 어디에 띄울지 적합한 뷰 앵커를 반환하는데 보통 view의 window 반환
        + https://jinnify.tistory.com/72


##### 실시간 데이터베이스 (Realtime Database)

##### A/B 테스팅

##### 클라우드 메시징

##### 원격 구성 (Remote Config)

### 3) 새롭게 알게 된 것

- Apple ID login
    - 타사 또는 소셜 로그인 서비스를 사용하는 앱은 Apple로 로그인 역시 동긍한 옵션으로 제공해야 하는 지침
    - https://developer.apple.com/kr/sign-in-with-apple/get-started/

- inset? 
    - positive value caused the frame to be inset (or shrunk) by the specified amount
    - negative values cause the frame to be outset (or expanded) by the special amount
    - padding

- Auto Layout
    - Auto Layout dynamically calculates the size and position of all the views in your view hierarchy
    - based on constraints placed on those views
    
- safe area?

Safe area is basically a pre-defined reference point for the top, bottom, leading, trailing within Xcode.
As of iOS 14.0, if you set a 0pt constraint to the safe area for iPhoneX and above, 
Xcode will automatically factor in a top margin of 44pt and a bottom margin of 34pt. (Portrait orientation)
In the horizontal (landscape) orientation the safe area is 44pt left+right, with 21pt bottom.

<img src=“https://miro.medium.com/max/1400/1*cbclhd77ySg6vemMuze5og.jpeg”>

- viewDidLoad()
This method is called after the view controller has loaded its view hierarchy into memory.
This method is called regardless of whether the view hierarchy was loaded from a nib file or created programmatically in the loadView() method. You usually override this method to perform additional initialization on view that were loaded from nib files.

*nib file*
https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/NibFile.html

    - A special type of resource file that you use to store the user interfaces of iOS and Mac apps
    - an interface builder document
    - use. Interface builder to design the visual parts of your app such as windows and views

- UITextFieldDelegate 를 사용하며 
    - textFieldShouldReturn
        + asks the delegate whether to process the pressing of the Return button for the text field 
    - textFieldDidEndEditing
        + tells the delegate when editing stops for the specified text filed

- self.view.endEditing(true)
    - instance method
    - causes the view 9or one of its embedded text fields) to resign there first responder status
    - true to force the first responder to resign, regardless of whether it wats to do so

- UITextField.becomeFirstResponder()
    - instance method
    - asks UIKit to make this object the first responder in its window
    - call this method when you want the current object to be the first responder

- swift 에서는 객체를 Import 하지 않아도 사용할 수 있는 이유가 뭘까
https://stackoverflow.com/questions/35222044/swift-import-my-swift-class

- navigationController 를 사용하며
    - interactivePopGestureRecognizer?.isEnabled 
        + the gesture recognizer responsible for popping the top view controller off the navigation stack
        + you can use this property to retrieve the gesture recognizer and tie it to the behavior of other gesture recognizers in your interface.
    - navigationBar.isHidden
    - popToRootViewController

- plist 가 뭐지
    - a preference file for the Application that it holds the preference settings for
    - https://discussions.apple.com/thread/1869002

- pod 을 연결한 후에 pod으로 install 한 라이브러리를 사용하기 위해선 workspace에서 작업해야 한다.

- pod Init 을 엉뚱한 디렉토리에서 진행해버렸다. 어쩌지?
    - https://medium.com/app-makers/how-to-remove-cocoapods-from-xcode-project-5166c19152
    - help to clear your project from CocoaPods and remove Pods

- firebase 초기화 코드 
    - SDK 추가 후 
    - AppDelegate
    ```swift
import UIKit
import Firebase
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
      [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

    ```
    
- 나는 @main 이라고 Appdelegate.swift 에 되어있는데?
    - 일단 @main의 뜻 : entry point 
    - which creates some instances including the app and the app delegate and gets the event loop running
    - Swift 5.3, Xcode 12 이후 명칭 바뀜
    - 참고) https://stackoverflow.com/questions/67429098/what-is-the-differnce-between-main-and-uiapplicationmain

- import firebase 가 안 되는데? : No such module ‘Firebase’
    - pod init, install 제대로 되었는지 확인 (0)
    - build 되는지 확인 (X)
        + 다른 오류가 있었음 (Provisioning)
        + 빌드 환경이 ipod으로 되어있었음
    - 참고자료: https://codecrew.codewithchris.com/t/xcode-no-such-module-firebase/3650/5

- storyboard 객체 가져오는 다른 방법  
    - self.storyboard 말고 
    - UIStoryboard(name:bundle:)
        + name: the name of the storyboard resource file without the filename extension
        + bundle: the bundle containing the storyboard file and its related resources. If you specify nil, this method looks in the main bundle of the current application
            + .main represents the bundle directory that contains the currently executing code
            + https://developer.apple.com/documentation/foundation/bundle

- Multiline string
```swift
“””
Multi-line string literal content
must begin on new line
“””
```

-NSError
    - Information about an error condition including a domain, a domain-specific error code, and application-specific information
    - .code : getting the error code
    - .localizedDescription: a string containing the localized description of the error
    
- root view controller 찾기
```swift
UIApplication.shared.windows.first!.rootViewController
```

- provisioning profile + capabilities
    - 참고 ) https://eunjin3786.tistory.com/373
    - apple developer 사이트 identifies에 등록한 appi id 와 capabilities 
    - Xcode’s 의 Signing & Capabilities 에 등록해야 적용가능하다.
    - 서로 동기화 되지 않는 것으로 보인다

- Nonce?
    - 암호화된 임의의 난수
    - 단 한 번만 사용할 수 있는 값
    - 주로 암호화 통신을 할 때 활용
    - 동일한 요청을 짧은 시간에 여러 번 보내는 릴레이 공격 방지
    - 정보 탈취 없이 안전하게 인증 정보 전달을 위한 안전 장치
    

