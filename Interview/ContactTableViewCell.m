//
//  ContactTableViewCell.m
//  Interview
//
//  Created by Alan Bouzek on 2/8/16.
//  Copyright © 2016 hotschedules. All rights reserved.
//

#import "ContactTableViewCell.h"
#import "Contact.h"

@interface ContactTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end



@implementation ContactTableViewCell

- (void)updateWithContact:(Contact *)contact {
    self.nameLabel.text = contact.fullName;
}

@end
