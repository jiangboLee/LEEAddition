# LEEAddition
every addition
# Installation
### From CocoaPods
CocoaPods is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like SVProgressHUD in your projects. First, add the following line to your Podfile:<br>
    
    pod 'LEEAddition'
Second, install `LEEAddition` into your project:<br>
    
    pod install  
if you can't seacrsh "Unable to find a specification for `LEEAddition`", you can `pod setup`
### Manually
    Drag the LEEAddition/LEEAddition/LEEAddition folder into your project.
# Swift
Even though `LEEAddition` is written in Objective-C, it can be used in Swift with no hassle. If you use CocoaPods add the following line to your Podfile:<br>

    use_frameworks!    
 If you added LEEAddition manually, just add a [bridging header](https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html) file to your project with the LEEAddition header included.

# Usage
(see sample Xcode project)
#### included
```
#import "UIView+LEEView.h"
#import "UIScreen+LEEScreen.h"
#import "UIColor+LEEColor.h"
#import "UINavigationController+LEENavigationController.h"
#import "UITextView+LEETextView.h"
#import "UITextField+LEETextField.h"
#import "UILabel+LEELable.h"
#import "UIImage+LEEImage.h"
#import "NSString+LEEString.h"
#import "NSObject+LEENSObject.h"
#import "NSMutableAttributedString+LEEAttributedString.h"
#import "NSArray+LEENSArray.h"
#import "NSDictionary+LEENSDictionary.h"
```
```
//字符串转拼音
[str Lee_transformToPinyin]；
//视图截屏
[_demoView lee_snapshotImage]；
//UITextField占位符颜色
@property(nonatomic, strong) IBInspectable UIColor *placeholderColor;
and so on........
```
# License
LEEAlertView is distributed under the terms and conditions of the MIT license. The success, error and info icons are made by Freepik from Flaticon and are licensed under Creative Commons BY 3.0.
# contact me
if has some problem,send me msg: li15712691251@163.com, thanks~
