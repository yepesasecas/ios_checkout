//
//  UserVC.h
//  ios_checkout
//
//  Created by Andres Yepes on 1/2/17.
//  Copyright © 2017 Andres Yepes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLFormViewController.h"
#import "XLForm.h"
#import "ShippingInfoVC.h"


@interface UserVC : XLFormViewController

@property (strong, nonatomic) XLFormDescriptor *form;

@end
