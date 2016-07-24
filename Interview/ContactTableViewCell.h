//
//  ContactTableViewCell.h
//  Interview
//
//  Created by Alan Bouzek on 2/8/16.
//  Copyright © 2016 hotschedules. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Contact;
@interface ContactTableViewCell : UITableViewCell

- (void)updateWithContact:(Contact *)contact;

@end
