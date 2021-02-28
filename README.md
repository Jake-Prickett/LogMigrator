# LogMigrator 🪵

## Summary 
Lightweight Logging wrapper to enable early adoption, as well as a seamless migration to Apple's new [Swift Unified Logging APIs](https://developer.apple.com/documentation/os/logger).

## Usage
```swift
let logger = Logger(subsystem: "ExampleLogger", category: "Test")
logger["metadata1"] = "informatave metadata"

// Output: **Redacted** [Test] metadata1=informative metadata level=debug Debug Log Message
logger.debug("Debug Log Message")
```

## Installation 📦

Please reference the below instructions for installing PLOP.

## Requirements 📝
* iOS 12.0+
* Xcode 11.1+
* Swift 5.0+

### CocoaPods
LogMigrator is available through [CocoaPods](<https://cocoapods.org/>). To install it, simply add the following line to your `Podfile`:

  pod 'LogMigrator'

### Carthage

LogMigrator is available through [Carthage](<https://github.com/Carthage/Carthage>). To install it, simply add the following line to your Cartfile:

  github "Jake-Prickett/LogMigrator"

### Swift Package Manager
LogMigrator is available through [Swift PM](<https://swift.org/package-manager/>). To install it, simply add the package as a dependency in `Package.swift`:

```swift
dependencies: [
  .package(url: "https://github.com/Jake-Prickett/LogMigrator.git", from: "1.0.0"),
]
```

### Manual
Download and drop the `LogMigrator` directory into your project.

---

If you notice issues or have feature requests - please feel free to open an issue leveraging the corresponding template. 

**If you'd like to contribute - Please do!**

### Resources
- [Logging](https://developer.apple.com/documentation/os/logging)
- [Logger](https://developer.apple.com/documentation/os/logger)
- [Explore Logging in Swift WWDC2020](https://developer.apple.com/videos/play/wwdc2020/10168/)
