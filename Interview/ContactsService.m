//
//  ContactsService.m
//  Interview
//
//  Created by Alan Bouzek on 8/4/15.
//  Copyright (c) 2015 hotschedules. All rights reserved.
//

#import "ContactsService.h"
#import "Contact.h"

@implementation ContactsService

/**
 * Example response from http://mocky.io/v2/55c0d0632d3a3a4c10032c45:
 *
 * [
 *      {
 *          "firstName": "Alan",
 *          "lastName": "Bouzek",
 *          "phoneNumber": "555-555-5555",
 *          "address": "1111 Park Place"
 *      },
 *      {
 *          "firstName": "Test",
 *          "lastName": "User",
 *          "phoneNumber": "111-111-1111",
 *          "address": "1234 Boardwalk"
 *      }
 * ]
 *
 */

-(void)getContactsWithCompletionBlock:(void(^)(NSArray *contacts))completionBlock {
#warning - TODO: Call completionBlock with the NSArray of Contact objects as an argument. Fetch the data from the above URL.
}

@end
