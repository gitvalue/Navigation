# Navigation
Navigation is a framework that provides an another look on iOS app screens navigation.

The idea behind this project is that average iOS-app navigation can be represented as a [finite-state-machine](https://en.wikipedia.org/wiki/Finite-state_machine), where _state_ is a particular screen (`UIViewController` class), _input_ is an
arbitrary user data.

## Therminology
In _Navigation_ we use terms below:
- _Gate_: a submodule router. Contains transfer table and trigger that transfers.
- _Tranfser_: represents the transfer between screens itself. Contains information about conditions of transfer (input and state) and destination state.
- _Input_: user-defined enum values that trigger transfers and pass data between screens using [swift patterns](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Patterns.html).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See [deployment](#deployment) for notes on how to deploy the project on a live system.

### Prerequisites

- iOS 9.0+
- Xcode 9.0+
- Swift 4

### Installing

#### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Navigation into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Navigation', '~> 1.0'
end
```

Then, run the following command:

```bash
$ pod install
```

#### Swift Package Manager

**Note:** At this time there is [no _official_ support for iOS targets or the related system libraries](https://github.com/apple/swift-package-manager/blob/master/Documentation/Usage.md#depending-on-apple-modules) in SPM. So read [this](https://github.com/j-channings/swift-package-manager-ios) before processing.

All you need is to define Navigation dependency in your package manifest file:

```Swift
import PackageDescription

let package = Package(
    name: "YourPackageName",
    products: [
        .library(name: "YourPackageName", targets: ["YourPackageName"]),
    ],
    dependencies: [
        .package(url: "https://github.com/gitvalue/Navigation.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "YourPackageName",
            dependencies: ["Navigation"]),
        .testTarget(
            name: "YourPackageNameTests",
            dependencies: ["Navigation"]),
    ]
)
```

and then run

```bash
$ swift fetch
```

#### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Navigation into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "https://github.com/gitvalue/Navigation" ~> 1.0.0
```

Run `carthage update --platform iOS` to build the framework and drag the built `Navigation` into your Xcode project.

For more information read [this](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application)

#### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate Navigation into your project manually by copying files from [Source directory](/Sources/Navigation/) to your project.

## Deployment

### Quick Start

TBD

## Notes

TBD

## Versioning

This repo uses [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/gitvalue/Navigation/tags). 

## Authors

* **Dmitry Volosach** - *Initial work* - [@vlk1994](https://twitter.com/vlk1994)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

