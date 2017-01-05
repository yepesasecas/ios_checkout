//
//  PaymentMethodVC.h
//  ios_checkout
//
//  Created by Andres Yepes on 1/5/17.
//  Copyright © 2017 Andres Yepes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLFormViewController.h"
#import "XLForm.h"
#import <SHSPhoneComponent/SHSPhoneNumberFormatter+UserConfig.h>

@interface PaymentMethodVC : XLFormViewController

@property (strong, nonatomic) XLFormDescriptor *form;
@property (strong, nonatomic) NSDictionary *order;

@end
