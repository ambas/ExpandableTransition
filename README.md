# ExpandableTransition

[![CI Status](http://img.shields.io/travis/Ambas Chobsanti/ExpandableTransition.svg?style=flat)](https://travis-ci.org/Ambas Chobsanti/ExpandableTransition)
[![Version](https://img.shields.io/cocoapods/v/ExpandableTransition.svg?style=flat)](http://cocoapods.org/pods/ExpandableTransition)
[![License](https://img.shields.io/cocoapods/l/ExpandableTransition.svg?style=flat)](http://cocoapods.org/pods/ExpandableTransition)
[![Platform](https://img.shields.io/cocoapods/p/ExpandableTransition.svg?style=flat)](http://cocoapods.org/pods/ExpandableTransition)

## To Do

- [x] Push from collection view to view controller like cell expanded
- [x] Provide delegate for each transition state
- [x] Show or hide expanded view
- [x] Install with Carthage.
- [ ] Install with Cocoapods
- [ ] Custom transition


##Installation
### Carthage
```ogdl
github "ambas/ExpandableTransition"
```

##Usage
1. import ExpandableViewTransition
2. In UICollectionViewController set self.navigationviewControllerDelegate to
``` Objective-C
let delegateHolder = CENavigationControllerDelegate(isHideExpandedView: false)
self.navigationController?.delegate = delegateHolder
````
3. Implement `CEBaseViewControllerProtocol` in your UICollectionViewController
4. If you want to do something when transitioning at destination view controller just implement `CEDestinationViewControllerProtocol` in your destination view controller

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ExpandableTransition is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ExpandableTransition"
```

## Author

Ambas Chobsanti, ambaschobsanti@gmail.com

## License

ExpandableTransition is available under the MIT license. See the LICENSE file for more info.
