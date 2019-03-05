![](./assets/cover.png)

# mvvm-c-rx-boilerplate

Table of Contents
-----------------

- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [List of Frameworks](#list-of-frameworks)
- [Tools](#tools)
- [Resources](#resources)
- [Beta Deployment](#beta-deployment) <!-- - [Changelog](#changelog) -->
- [Contributing](#contributing)

## Prerequisites

- [MacOS Mojave (10.14.2 or higher)](https://www.apple.com/lae/macos/mojave/)
- [Xcode 10.1 or higher](https://developer.apple.com/download/) ~ Swift 4.2
- [Carthage 0.31.2 or higher](https://github.com/Carthage/Carthage)

##### NOTE: It might work with older versions, but I didn't test. This is my current setup.

## Quick Start
- Clone repo
- Rename project ([Guide](https://stackoverflow.com/questions/33370175/how-do-i-completely-rename-an-xcode-project-i-e-inclusive-of-folders))
- Navigate to project and run `carthage update --platform iOS`

## Frameworks

|  Required Framework  | Description |
| ------------------------------- | --------------------------------------------------------------------- |
| RxSwift | ReactiveX for Swift |
| SnapKit | SnapKit is a DSL to make Auto Layout easy on both iOS and OS X |
| Kingfisher | Kingfisher is a powerful, pure-Swift library for downloading and caching images from the web |
| Moya | Network abstraction layer written in Swift |



| Optional Framework | Description |
| ------------------------------- | --------------------------------------------------------------------- |
| IQKeyboardManagerSwift | Codeless drop-in universal library allows to prevent issues of keyboard sliding up and cover UITextField/UITextView. Neither need to write any code nor any setup required and much more |
| KeychainSwift | Helper functions for storing text in Keychain for iOS, macOS, tvOS and WatchOS |
| SVProgressHUD | A clean and lightweight progress HUD for your iOS and tvOS app |
| Fabric/Crashlytics | Crash reporting & beta deployment. |

## Tools

- [Carthage](https://github.com/Carthage/Carthage) - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 33 thousand libraries and is used in over 2.2 million apps. CocoaPods can help you scale your projects elegantly
- [fastlane](https://docs.fastlane.tools/) - The easiest way to automate building and releasing your iOS and Android apps
- [SwiftLint](https://github.com/realm/SwiftLint) - A tool to enforce Swift style and conventions
- [Fabric](https://docs.fabric.io/apple/fabric/overview.html) - Fabric is a platform that helps your mobile team build better apps, understand your users, and grow your business

## Resources

- [Ray Wenderlich](https://www.raywenderlich.com/) - The largest collection of Swift & iOS video tutorials anywhere
- [Design Guidelines](https://designcode.io/iosdesign-guidelines) - iOS 11 Design Guidelines for iPhone and iPad
- [Rick and Morty API](https://rickandmortyapi.com/) - The Rick and Morty API (or ShlaAPI) is a RESTful and GraphQL API based on the television show Rick and Morty

## Contributing

If you have something unclear or confusing, please let me know. I am also open to suggestions. If you would like to contribute or improve something, feel free to do it (open an issue and submit pull request). Also feel free to improve `README.md` file.
