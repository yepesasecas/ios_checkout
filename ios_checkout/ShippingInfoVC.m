//
//  ShippingInfoVC.m
//  ios_checkout
//
//  Created by Andres Yepes on 1/2/17.
//  Copyright © 2017 Andres Yepes. All rights reserved.
//

#import "ShippingInfoVC.h"

@interface ShippingInfoVC ()

@end

@implementation ShippingInfoVC

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
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"Shipping Info"];
    
    // First section
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    // First Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"first_name" rowType:@"name" title:@"First Name"];
    [section addFormRow:row];
    
    // Last Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"last_name" rowType:@"name" title:@"Last Name"];
    [section addFormRow:row];
    
    // Address
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"address" rowType:@"text" title:@"Address"];
    [section addFormRow:row];
    
    // Country
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"country" rowType:@"text" title:@"Country"];
    [section addFormRow:row];
    
    // City
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"city" rowType:@"text" title:@"City"];
    [section addFormRow:row];
    
    // Postal Code
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"postal_code" rowType:@"text" title:@"Postal Code"];
    [section addFormRow:row];
    
    // Phone Number
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"phone" rowType:@"phone" title:@"Phone"];
    [section addFormRow:row];
    
    self.form = form;

}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"billing_info"]) {
        
        NSMutableDictionary *order = [[NSMutableDictionary alloc] init];
        [order setValue:[self.form formValues] forKey:@"shipping_info"];
//        ShippingInfoVC *shippingInfoVC = [segue destinationViewController];
//        shippingInfoVC.order = order;
    }

}

@end
