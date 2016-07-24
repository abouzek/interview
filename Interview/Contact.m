//
//  Contact.m
//  Interview
//
//  Created by Alan Bouzek on 8/3/15.
//  Copyright (c) 2015 hotschedules. All rights reserved.
//

#import "Contact.h"

static NSString * const kContactFirstNameKey = @"firstName";
static NSString * const kContactLastNameKey = @"lastName";
static NSString * const kContactPhoneNumberKey = @"phoneNumber";
static NSString * const kContactAddressKey = @"address";

@implementation Contact

- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                      phoneNumber:(NSString *)phoneNumber
                          address:(NSString *)address {
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.phoneNumber = phoneNumber;
        self.address = address;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    return [self initWithFirstName:dictionary[kContactFirstNameKey]
                          lastName:dictionary[kContactLastNameKey]
                       phoneNumber:dictionary[kContactPhoneNumberKey]
                           address:dictionary[kContactAddressKey]];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}

@end
