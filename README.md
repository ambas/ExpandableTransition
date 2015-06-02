# ExpandableViewTransition
![](https://github.com/ambas/ExpanableTransition/blob/master/Demo/sample.gif?raw=true)

## To do.

- [x] Push from collection view to view controller like cell expanded
- [x] Provide delegate for each transition state
- [x] Show or hide expanded view
- [ ] Install with Carthage.
- [ ] Install with Cocoapods
- [ ] Custom transition


##Installation

##Usage
1. import ExpandableViewTransition
2. In UICollectionViewController set self.navigationviewControllerDelegate to
``` Objective-C
let delegateHolder = CENavigationControllerDelegate(isHideExpandedView: false)
self.navigationController?.delegate = delegateHolder
````
3. Implement `CEBaseViewControllerProtocol` in your UICollectionViewController
4. If you want to do something when transitioning at destination view controller just implement `CEDestinationViewControllerProtocol` in your destination view controller

