//
//  BillingInfoVC.h
//  ios_checkout
//
//  Created by Andres Yepes on 1/2/17.
//  Copyright © 2017 Andres Yepes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLFormViewController.h"

@interface BillingInfoVC : UIViewController

@property (strong, nonatomic) XLFormDescriptor *form;
@property (strong, nonatomic) NSDictionary *order;
@end
