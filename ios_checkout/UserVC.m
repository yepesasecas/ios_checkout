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
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"email" rowType:XLFormRowDescriptorTypeEmail title:@"email"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.required = TRUE;
    [row addValidator:[XLFormValidator emailValidator]];
    [section addFormRow:row];
    
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
    row.value = @"- USD";
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"order_duty_tax" rowType:XLFormRowDescriptorTypeText title:@"Duty and Tax"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = @"- USD";
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"order_insurance" rowType:XLFormRowDescriptorTypeText title:@"Loss & Damage Protection"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.value = @"- USD";
    row.disabled = @YES;
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"order_total" rowType:XLFormRowDescriptorTypeText title:@"Order Total"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [row.cellConfig setObject:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15] forKey:@"textLabel.font"];
    row.value = @"- USD";
    row.disabled = @YES;
    [section addFormRow:row];
    
    self.form = form;
}

#pragma mark - Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    //Activity Indicator
    self.activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeDoubleBounce tintColor:[UIColor blackColor] size:80.0f];
    self.activityIndicatorView.frame = CGRectMake(self.view.frame.size.width/2 - 40, self.view.frame.size.height/2 - 40, 80, 80);
    [self.view addSubview:self.activityIndicatorView];
    [self.activityIndicatorView startAnimating];
    [NSThread sleepForTimeInterval:2.0f];
    [self.activityIndicatorView stopAnimating];
    
    // Valid Form
    NSArray * array = [self formValidationErrors];
    if ([array count] == 0) {
        return YES;
    }
    
    // Invalid Form
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        XLFormValidationStatus * validationStatus = [[obj userInfo] objectForKey:XLValidationStatusErrorKey];
        UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[self.form indexPathOfFormRow:validationStatus.rowDescriptor]];
        [self animateCell:cell];
    }];
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"shipping_info"]) {
        NSMutableDictionary *order = [[NSMutableDictionary alloc] init];
        [order setValue:[self.form formValues] forKey:@"user_info"];
        ShippingInfoVC *shippingInfoVC = [segue destinationViewController];
        shippingInfoVC.order = order;
    }
}

#pragma mark - Helper

-(void)animateCell:(UITableViewCell *)cell
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values =  @[ @0, @20, @-20, @10, @0];
    animation.keyTimes = @[@0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1];
    animation.duration = 0.3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.additive = YES;
    
    [cell.layer addAnimation:animation forKey:@"shake"];
}

@end
