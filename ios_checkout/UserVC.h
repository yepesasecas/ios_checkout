//
//  UserVC.h
//  ios_checkout
//
//  Created by Andres Yepes on 1/2/17.
//  Copyright © 2017 Andres Yepes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLFormViewController.h"

//#define XLFormRowDescriptorTypeText @"text";
//#define XLFormRowDescriptorTypeName @"name";
//#define XLFormRowDescriptorTypeURL @"url";
//#define XLFormRowDescriptorTypeEmail @"email";
//#define XLFormRowDescriptorTypePassword @"password";
//#define XLFormRowDescriptorTypeNumber @"number";
//#define XLFormRowDescriptorTypePhone @"phone";
//#define XLFormRowDescriptorTypeTwitter @"twitter";
//#define XLFormRowDescriptorTypeAccount @"account";
//#define XLFormRowDescriptorTypeInteger @"integer";
//#define XLFormRowDescriptorTypeImage @"image";
//#define XLFormRowDescriptorTypeDecimal @"decimal";
//#define XLFormRowDescriptorTypeTextView @"textView";
//#define XLFormRowDescriptorTypeZipCode @"zipCode";
//#define XLFormRowDescriptorTypeSelectorPush @"selectorPush";
//#define XLFormRowDescriptorTypeSelectorPopover @"selectorPopover";
//#define XLFormRowDescriptorTypeSelectorActionSheet @"selectorActionSheet";
//#define XLFormRowDescriptorTypeSelectorAlertView @"selectorAlertView";
//#define XLFormRowDescriptorTypeSelectorPickerView @"selectorPickerView";
//#define XLFormRowDescriptorTypeSelectorPickerViewInline @"selectorPickerViewInline";
//#define XLFormRowDescriptorTypeMultipleSelector @"multipleSelector";
//#define XLFormRowDescriptorTypeMultipleSelectorPopover @"multipleSelectorPopover";
//#define XLFormRowDescriptorTypeSelectorLeftRight @"selectorLeftRight";
//#define XLFormRowDescriptorTypeSelectorSegmentedControl @"selectorSegmentedControl";
//#define XLFormRowDescriptorTypeDateInline @"dateInline";
//#define XLFormRowDescriptorTypeDateTimeInline @"datetimeInline";
//#define XLFormRowDescriptorTypeTimeInline @"timeInline";
//#define XLFormRowDescriptorTypeCountDownTimerInline @"countDownTimerInline";
//#define XLFormRowDescriptorTypeDate @"date";
//#define XLFormRowDescriptorTypeDateTime @"datetime";
//#define XLFormRowDescriptorTypeTime @"time";
//#define XLFormRowDescriptorTypeCountDownTimer @"countDownTimer";
//#define XLFormRowDescriptorTypeDatePicker @"datePicker";
//#define XLFormRowDescriptorTypePicker @"picker";
//#define XLFormRowDescriptorTypeSlider @"slider";
//#define XLFormRowDescriptorTypeBooleanCheck @"booleanCheck";
//#define XLFormRowDescriptorTypeBooleanSwitch @"booleanSwitch";
//#define XLFormRowDescriptorTypeButton @"button";
//#define XLFormRowDescriptorTypeInfo @"info";
//#define XLFormRowDescriptorTypeStepCounter @"stepCounter";


@interface UserVC : XLFormViewController

@property (strong, nonatomic) XLFormDescriptor * form;

@end
