//
//  UserVC.m
//  ios_checkout
//
//  Created by Andres Yepes on 1/2/17.
//  Copyright © 2017 Andres Yepes. All rights reserved.
//

#import "UserVC.h"
#import "ShippingInfoVC.h"

@interface UserVC ()

@end

@implementation UserVC

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (void)initializeForm {
    XLFormDescriptor * form;
    XLFormSectionDescriptor * section;
    XLFormRowDescriptor * row;
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"User Info"];
    
    // First section
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    // Email
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"email" rowType:@"text" title:@"email"];
    [section addFormRow:row];
    
    self.form = form;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"shipping_info"]) {
        
        NSMutableDictionary *order = [[NSMutableDictionary alloc] init];
        [order setValue:[self.form formValues] forKey:@"user_info"];
        ShippingInfoVC *shippingInfoVC = [segue destinationViewController];
        shippingInfoVC.order = order;
    }
}

@end
