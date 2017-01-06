//
//  PaymentMethodVC.m
//  ios_checkout
//
//  Created by Andres Yepes on 1/5/17.
//  Copyright © 2017 Andres Yepes. All rights reserved.
//

#import "PaymentMethodVC.h"

@interface PaymentMethodVC ()

@end

@implementation PaymentMethodVC

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
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"Payment Method"];
    
    // Section -  Order Summary
    section = [XLFormSectionDescriptor formSection];
    section.title = @"Order Summary";
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"order_subtotal" rowType:XLFormRowDescriptorTypeText title:@"Subtotal"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = @"$271.45 USD";
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"order_shipping" rowType:XLFormRowDescriptorTypeText title:@"Shipping"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = @"$530.40 USD";
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"order_duty_tax" rowType:XLFormRowDescriptorTypeText title:@"Duty and Tax"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = @"$278.80 USD";
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"order_insurance" rowType:XLFormRowDescriptorTypeText title:@"Loss & Damage Protection"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = @"$21.61 USD";
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"order_total" rowType:XLFormRowDescriptorTypeText title:@"Order Total"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15] forKey:@"textLabel.font"];
    row.value = @"$1102.26 USD";
    row.disabled = @YES;
    [section addFormRow:row];

    
    // First section
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"payment_thod" rowType:XLFormRowDescriptorTypeSelectorPush title:@"Payment Method"];
    row.selectorOptions = [NSArray arrayWithObjects:@"Credit Card", @"PayPal", nil];
    row.value = @"Credit Card";
    row.required = TRUE;
    [section addFormRow:row];

    // Second Section
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    // Card Number
    SHSPhoneNumberFormatter *formatter = [[SHSPhoneNumberFormatter alloc] init];
    [formatter setDefaultOutputPattern:@"#### #### #### ####" imagePath:nil];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"card_number" rowType:XLFormRowDescriptorTypePhone title:@"Card Number"];
    row.valueFormatter = formatter;
    row.required = TRUE;
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:@"1111 1111 1111 1111" forKey:@"textField.placeholder"];
    [section addFormRow:row];
    
    // MM/YY expiration
    SHSPhoneNumberFormatter *formatter2 = [[SHSPhoneNumberFormatter alloc] init];
    [formatter2 setDefaultOutputPattern:@"##/##" imagePath:nil];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"expiration" rowType:XLFormRowDescriptorTypePhone title:@"Expiration"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:@"MM/YY" forKey:@"textField.placeholder"];
    row.valueFormatter = formatter2;
    row.required = TRUE;
    [section addFormRow:row];

    // CVY
    SHSPhoneNumberFormatter *formatter3 = [[SHSPhoneNumberFormatter alloc] init];
    [formatter3 setDefaultOutputPattern:@"###" imagePath:nil];
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"cvy" rowType:XLFormRowDescriptorTypePhone title:@"CVY"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfigAtConfigure setObject:@"000" forKey:@"textField.placeholder"];
    row.valueFormatter = formatter3;
    row.required = TRUE;
    [section addFormRow:row];

    // Third Section
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    // Pay button
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"pay_now" rowType:XLFormRowDescriptorTypeButton title: @"Pay Now"];
    [row.cellConfigAtConfigure setObject:[UIColor purpleColor] forKey:@"backgroundColor"];
    [row.cellConfig setObject:[UIColor whiteColor] forKey:@"textLabel.color"];
    [row.cellConfig setObject:[UIFont fontWithName:@"Helvetica" size:30] forKey:@"textLabel.font"];
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
