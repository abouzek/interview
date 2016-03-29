//
//  Contact.h
//  Interview
//
//  Created by Alan Bouzek on 8/3/15.
//  Copyright (c) 2015 hotschedules. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *address;


/**
 * Returns a Contact object from the NSDictionary which should have been parsed from JSON.
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/**
 * Returns the contact's first name and last name together with a space separating them.
 */
- (NSString *)fullName;

@end
