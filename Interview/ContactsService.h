//
//  ContactsService.h
//  Interview
//
//  Created by Alan Bouzek on 8/4/15.
//  Copyright (c) 2015 hotschedules. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactsService : NSObject

-(void)getContactsWithCompletionBlock:(void(^)(NSArray *contacts))completionBlock;

@end
