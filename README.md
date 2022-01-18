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

##### 실시간 데이터베이스 (Realtime Database)

##### A/B 테스팅

##### 클라우드 메시징

##### 원격 구성 (Remote Config)

### 3) 새롭게 알게 된 것
