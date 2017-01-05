//
//  ShippingMethodVC.m
//  ios_checkout
//
//  Created by Andres Yepes on 1/5/17.
//  Copyright © 2017 Andres Yepes. All rights reserved.
//

#import "ShippingMethodVC.h"

@interface ShippingMethodVC ()

@end

@implementation ShippingMethodVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.order);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

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

-(void) initializeForm{
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"Shipping Method"];
    
    // section - Billing Address
    section = [XLFormSectionDescriptor formSection];
    section.footerTitle = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua";
    section.footerTitle = @"2 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua";
    [form addFormSection:section];
    
    // First Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"shippingMethod" rowType:XLFormRowDescriptorTypeSelectorPickerView title:@"Picker View"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Priority (today - $100)"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Express (1 day - $70)"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Two day (2 day - $50)"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"Economy (5 day - $20)"]
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"Two day (2 day - $50)"];
    [section addFormRow:row];
    
    self.form = form;
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
