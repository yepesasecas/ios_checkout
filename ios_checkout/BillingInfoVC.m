//
//  BillingInfoVC.m
//  ios_checkout
//
//  Created by Andres Yepes on 1/2/17.
//  Copyright © 2017 Andres Yepes. All rights reserved.
//

#import "BillingInfoVC.h"

@interface BillingInfoVC ()

@end

@implementation BillingInfoVC


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
    
    form = [XLFormDescriptor formDescriptorWithTitle:@"Billing Info"];
    
    // First section
    section = [XLFormSectionDescriptor formSection];
    section.footerTitle = @"use Shipping Address as Billing Address";
    [form addFormSection:section];
    
    // Boolean - Same as Shipping Address
    NSString *sameAsShippingTag = @"sameAsShipping";
    row = [XLFormRowDescriptor formRowDescriptorWithTag:sameAsShippingTag
                                                rowType:XLFormRowDescriptorTypeBooleanSwitch
                                                  title:@"Same as Shipping"];
    row.value = @1;
    [section addFormRow:row];
    
    // section - Billing Address
    section = [XLFormSectionDescriptor formSection];
    section.hidden = [NSString stringWithFormat:@"$%@==1", sameAsShippingTag];
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
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"country" rowType:XLFormRowDescriptorTypeSelectorPush title:@"Country"];
    row.selectorOptions = [NSArray arrayWithObjects:@"Afghanistan", @"Akrotiri", @"Albania", @"Algeria", @"American Samoa", @"Andorra", @"Angola", @"Anguilla", @"Antarctica", @"Antigua and Barbuda", @"Argentina", @"Armenia", @"Aruba", @"Ashmore and Cartier Islands", @"Australia", @"Austria", @"Azerbaijan", @"The Bahamas", @"Bahrain", @"Bangladesh", @"Barbados", @"Bassas da India", @"Belarus", @"Belgium", @"Belize", @"Benin", @"Bermuda", @"Bhutan", @"Bolivia", @"Bosnia and Herzegovina", @"Botswana", @"Bouvet Island", @"Brazil", @"British Indian Ocean Territory", @"British Virgin Islands", @"Brunei", @"Bulgaria", @"Burkina Faso", @"Burma", @"Burundi", @"Cambodia", @"Cameroon", @"Canada", @"Cape Verde", @"Cayman Islands", @"Central African Republic", @"Chad", @"Chile", @"China", @"Christmas Island", @"Clipperton Island", @"Cocos (Keeling) Islands", @"Colombia", @"Comoros", @"Democratic Republic of the Congo", @"Republic of the Congo", @"Cook Islands", @"Coral Sea Islands", @"Costa Rica", @"Cote d'Ivoire", @"Croatia", @"Cuba", @"Cyprus", @"Czech Republic", @"Denmark", @"Dhekelia", @"Djibouti", @"Dominica", @"Dominican Republic", @"Ecuador", @"Egypt", @"El Salvador", @"Equatorial Guinea", @"Eritrea", @"Estonia", @"Ethiopia", @"Europa Island", @"Falkland Islands (Islas Malvinas)", @"Faroe Islands", @"Fiji", @"Finland", @"France", @"French Guiana", @"French Polynesia", @"French Southern and Antarctic Lands", @"Gabon", @"The Gambia", @"Gaza Strip", @"Georgia", @"Germany", @"Ghana", @"Gibraltar", @"Glorioso Islands", @"Greece", @"Greenland", @"Grenada", @"Guadeloupe", @"Guam", @"Guatemala", @"Guernsey", @"Guinea", @"Guinea-Bissau", @"Guyana", @"Haiti", @"Heard Island and McDonald Islands", @"Holy See (Vatican City)", @"Honduras", @"Hong Kong", @"Hungary", @"Iceland", @"India", @"Indonesia", @"Iran", @"Iraq", @"Ireland", @"Isle of Man", @"Israel", @"Italy", @"Jamaica", @"Jan Mayen", @"Japan", @"Jersey", @"Jordan", @"Juan de Nova Island", @"Kazakhstan", @"Kenya", @"Kiribati", @"North Korea", @"South Korea", @"Kuwait", @"Kyrgyzstan", @"Laos", @"Latvia", @"Lebanon", @"Lesotho", @"Liberia", @"Libya", @"Liechtenstein", @"Lithuania", @"Luxembourg", @"Macau", @"Macedonia", @"Madagascar", @"Malawi", @"Malaysia", @"Maldives", @"Mali", @"Malta", @"Marshall Islands", @"Martinique", @"Mauritania", @"Mauritius", @"Mayotte", @"Mexico", @"Federated States of Micronesia", @"Moldova", @"Monaco", @"Mongolia", @"Montserrat", @"Morocco", @"Mozambique", @"Namibia", @"Nauru", @"Navassa Island", @"Nepal", @"Netherlands", @"Netherlands Antilles", @"New Caledonia", @"New Zealand", @"Nicaragua", @"Niger", @"Nigeria", @"Niue", @"Norfolk Island", @"Northern Mariana Islands", @"Norway", @"Oman", @"Pakistan", @"Palau", @"Panama", @"Papua New Guinea", @"Paracel Islands", @"Paraguay", @"Peru", @"Philippines", @"Pitcairn Islands", @"Poland", @"Portugal", @"Puerto Rico", @"Qatar", @"Reunion", @"Romania", @"Russia", @"Rwanda", @"Saint Helena", @"Saint Kitts and Nevis", @"Saint Lucia", @"Saint Pierre and Miquelon", @"Saint Vincent and the Grenadines", @"Samoa", @"San Marino", @"Sao Tome and Principe", @"Saudi Arabia", @"Senegal", @"Serbia", @"Montenegro", @"Seychelles", @"Sierra Leone", @"Singapore", @"Slovakia", @"Slovenia", @"Solomon Islands", @"Somalia", @"South Africa", @"South Georgia and the South Sandwich Islands", @"Spain", @"Spratly Islands", @"Sri Lanka", @"Sudan", @"Suriname", @"Svalbard", @"Swaziland", @"Sweden", @"Switzerland", @"Syria", @"Taiwan", @"Tajikistan", @"Tanzania", @"Thailand", @"Tibet", @"Timor-Leste", @"Togo", @"Tokelau", @"Tonga", @"Trinidad and Tobago", @"Tromelin Island", @"Tunisia", @"Turkey", @"Turkmenistan", @"Turks and Caicos Islands", @"Tuvalu", @"Uganda", @"Ukraine", @"United Arab Emirates", @"United Kingdom", @"United States", @"Uruguay", @"Uzbekistan", @"Vanuatu", @"Venezuela", @"Vietnam", @"Virgin Islands", @"Wake Island", @"Wallis and Futuna", @"West Bank", @"Western Sahara", @"Yemen", @"Zambia", @"Zimbabwe", nil];
    row.required = TRUE;
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
