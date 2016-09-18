# KYNavigationProgress

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Pod Version](http://img.shields.io/cocoapods/v/KYNavigationProgress.svg?style=flat)](http://cocoadocs.org/docsets/KYNavigationProgress/)
[![Pod Platform](http://img.shields.io/cocoapods/p/KYNavigationProgress.svg?style=flat)](http://cocoadocs.org/docsets/KYNavigationProgress/)
[![Pod License](http://img.shields.io/cocoapods/l/KYNavigationProgress.svg?style=flat)](https://github.com/ykyohei/KYNavigationProgress/blob/master/LICENSE)
![Swift version](https://img.shields.io/badge/swift-3.0-orange.svg)

`KYNavigationProgress` is simple extension of UINavigationController to display progress on the UINavigationBar.


![image.png](https://cloud.githubusercontent.com/assets/5757351/12037003/690bc894-ae8e-11e5-8c2f-864aef9a7cb4.gif "image.png")


## Installation

### CocoaPods

`KYNavigationProgress` is available on CocoaPods.
Add the following to your `Podfile`:

```ruby
use_frameworks!
pod 'KYNavigationProgress'
```

### Carthage
`KYNavigationProgress` is available through [Carthage](https://github.com/Carthage/Carthage). To install it, simply add the following line to your Cartfile:

```ruby
github "ykyouhei/KYNavigationProgress"
```


## Usage

### Progress
```Swift
import KYNavigationProgress

// get and set progress.
self.navigationController?.progress = 0.5

// set progress with animation.
self.navigationController?.setProgress(0.1, animated: true)

// finish progress.
self.navigationController?.finishProgress()

// cancel progress.
self.navigationController?.cancelProgress()
```

### Custom
```Swift
// default is UIColor(red: 0.0, green: 122/255, blue: 1.0, alpha: 1.0)
self.navigationController?.progressTintColor

// default is UIColor.clearColor()
self.navigationController?.trackTintColor

// default is 2.0
self.navigationController?.progressHeight
```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE). 

