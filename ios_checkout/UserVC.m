//
//  UserVC.m
//  ios_checkout
//
//  Created by Andres Yepes on 1/2/17.
//  Copyright © 2017 Andres Yepes. All rights reserved.
//

#import "UserVC.h"

@interface UserVC ()

@end

@implementation UserVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        [self initializeForm];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self){
        [self initializeForm];
    }
    return self;
}

- (void)initializeForm {
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"User Info"];
    
    // First section
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    // Email
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"email" rowType:XLFormRowDescriptorTypeEmail title:@"email"];
    [row.cellConfigAtConfigure setObject:@"Email" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    self.form = form;
}

NSString *const XLFormRowDescriptorTypeText = @"text";
NSString *const XLFormRowDescriptorTypeName = @"name";
NSString *const XLFormRowDescriptorTypeURL = @"url";
NSString *const XLFormRowDescriptorTypeEmail = @"email";
NSString *const XLFormRowDescriptorTypePassword = @"password";
NSString *const XLFormRowDescriptorTypeNumber = @"number";
NSString *const XLFormRowDescriptorTypePhone = @"phone";
NSString *const XLFormRowDescriptorTypeTwitter = @"twitter";
NSString *const XLFormRowDescriptorTypeAccount = @"account";
NSString *const XLFormRowDescriptorTypeInteger = @"integer";
NSString *const XLFormRowDescriptorTypeImage = @"image";
NSString *const XLFormRowDescriptorTypeDecimal = @"decimal";
NSString *const XLFormRowDescriptorTypeTextView = @"textView";
NSString *const XLFormRowDescriptorTypeZipCode = @"zipCode";
NSString *const XLFormRowDescriptorTypeSelectorPush = @"selectorPush";
NSString *const XLFormRowDescriptorTypeSelectorPopover = @"selectorPopover";
NSString *const XLFormRowDescriptorTypeSelectorActionSheet = @"selectorActionSheet";
NSString *const XLFormRowDescriptorTypeSelectorAlertView = @"selectorAlertView";
NSString *const XLFormRowDescriptorTypeSelectorPickerView = @"selectorPickerView";
NSString *const XLFormRowDescriptorTypeSelectorPickerViewInline = @"selectorPickerViewInline";
NSString *const XLFormRowDescriptorTypeMultipleSelector = @"multipleSelector";
NSString *const XLFormRowDescriptorTypeMultipleSelectorPopover = @"multipleSelectorPopover";
NSString *const XLFormRowDescriptorTypeSelectorLeftRight = @"selectorLeftRight";
NSString *const XLFormRowDescriptorTypeSelectorSegmentedControl = @"selectorSegmentedControl";
NSString *const XLFormRowDescriptorTypeDateInline = @"dateInline";
NSString *const XLFormRowDescriptorTypeDateTimeInline = @"datetimeInline";
NSString *const XLFormRowDescriptorTypeTimeInline = @"timeInline";
NSString *const XLFormRowDescriptorTypeCountDownTimerInline = @"countDownTimerInline";
NSString *const XLFormRowDescriptorTypeDate = @"date";
NSString *const XLFormRowDescriptorTypeDateTime = @"datetime";
NSString *const XLFormRowDescriptorTypeTime = @"time";
NSString *const XLFormRowDescriptorTypeCountDownTimer = @"countDownTimer";
NSString *const XLFormRowDescriptorTypeDatePicker = @"datePicker";
NSString *const XLFormRowDescriptorTypePicker = @"picker";
NSString *const XLFormRowDescriptorTypeSlider = @"slider";
NSString *const XLFormRowDescriptorTypeBooleanCheck = @"booleanCheck";
NSString *const XLFormRowDescriptorTypeBooleanSwitch = @"booleanSwitch";
NSString *const XLFormRowDescriptorTypeButton = @"button";
NSString *const XLFormRowDescriptorTypeInfo = @"info";
NSString *const XLFormRowDescriptorTypeStepCounter = @"stepCounter";

@end
