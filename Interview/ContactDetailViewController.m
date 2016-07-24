//
//  ContactDetailViewController.m
//  Interview
//
//  Created by Alan Bouzek on 8/3/15.
//  Copyright (c) 2015 hotschedules. All rights reserved.
//

#import "ContactDetailViewController.h"

@interface ContactDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end


@implementation ContactDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstNameLabel.text = _contact.firstName;
    self.lastNameLabel.text = _contact.lastName;
    self.phoneNumberLabel.text = _contact.phoneNumber;
    self.addressLabel.text = _contact.address;
}

@end
