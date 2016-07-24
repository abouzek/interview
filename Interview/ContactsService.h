//
//  ContactsService.h
//  Interview
//
//  Created by Alan Bouzek on 8/4/15.
//  Copyright (c) 2015 hotschedules. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Contact;

typedef void (^ContactServiceCompletionBlock)(NSArray <Contact *> *contacts, NSError *error);

@interface ContactsService : NSObject

/**
 *  Asynchronous method that will get contact items from server.
 *  @param block - completion block that will return list of user or error object. Could be NULL.
 *  NOTE: block will be called on main thread.
 */
+ (void)getContactsWithCompletionBlock:(ContactServiceCompletionBlock)block;

@end
