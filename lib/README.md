1. Basic (Android & iOS)
    - Set up enviroments for dart | flutter project
    - Set up icon application (done)
    - Add splash screen (done)
    - Change application name (done)
    - assets folder: images & fonts (done)
    - release android (.apk, .aab), ios (.ipa)
    - normalization (lefthook, lint)
        + lefthook: https://github.com/evilmartians/lefthook/blob/master/docs/node.md
        + lint (analysis_options.yaml)
    - Multiple languages
    - routes
        - unAuthenticate
            - Introduce
            - Login 
            - Register
            - OTP
            - Forget password
            - New password
        - Authenticate
            - Home
            - Gift
            - QR
            - Transaction
            - Account
2. Advance
        - MVC Architecture
        - assets
            + images
            + fonts
        - config/lib
            - enviroment
            - routes
        - lib
            + data
            + models (request, responses)
            + views (cubit, ui, screen_name_route.dart)
            + controllers
3. Pub dev
    - json_serializable & build_runner
        + do Google xuất bản, package này tự động tạo code để serialize và giải mã hóa(deserialize) class dữ liệu của chúng ta.
        + https://200lab.io/blog/lam-viec-voi-json-serialization-trong-flutter/
