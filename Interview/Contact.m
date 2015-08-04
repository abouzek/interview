//
//  Contact.m
//  Interview
//
//  Created by Alan Bouzek on 8/3/15.
//  Copyright (c) 2015 hotschedules. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                      phoneNumber:(NSString *)phoneNumber
                          address:(NSString *)address {
    if (self = [super init]) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.phoneNumber = phoneNumber;
        self.address = address;
    }
    return self;
}

+ (instancetype)contactFromDictionary:(NSDictionary *)dictionary {
#warning - TODO: Implement this method using initWithFirstName: lastName: phoneNumber: address:
    return nil;
}

- (NSString *)fullName {
#warning - TODO: Return the contact's first name and last name together, separated by a space
    return nil;
}

@end
