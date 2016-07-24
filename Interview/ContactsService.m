//
//  ContactsService.m
//  Interview
//
//  Created by Alan Bouzek on 8/4/15.
//  Copyright (c) 2015 hotschedules. All rights reserved.
//

#import "ContactsService.h"
#import "Contact.h"

static NSString * const kBaseApiString = @"http://mocky.io";
static NSString * const kBaseApiVersion = @"v2";
static NSString * const kContactsDefaultId = @"55c0d0632d3a3a4c10032c45";

NSInteger kUnprocessableEntityError = 414;

@implementation ContactsService

#pragma mark - API Private -
/**
 *  Private, asynchronous method that will receive data from server, parse it and call completion block. If there will be some problem during parsing data or retrieve data will be called completion block with error.
 *  @param requestUrl - NSURL address for getting contacts. Value could not be nil.
 *  @param block - completion block will be called after all data is parsed and grouped or when some error occurred. Value could be NULL.
 *  @note: completion block will be called on main thread.
 *  @note: Example response from http://mocky.io/v2/55c0d0632d3a3a4c10032c45:
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
+ (void)reciveContactsFromUrl:(NSURL *)requestUrl completionBlock:(ContactServiceCompletionBlock)block {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithURL:requestUrl
                                            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                        if (block) {
                                            if (error == nil) {
                                                NSError *jsonError;
                                                id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                                                
                                                if (jsonError) {
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        block(nil, jsonError);
                                                    });
                                                } else if ([jsonObject isKindOfClass:[NSArray class]]) {
                                                    NSMutableArray <Contact *> *contacts = [NSMutableArray new];
                                                    BOOL success = YES;
                                                    for (id element in jsonObject) {
                                                        if ([element isKindOfClass:[NSDictionary class]]) {
                                                            [contacts addObject:[[Contact alloc] initWithDictionary:element]];
                                                        } else {
                                                            NSLog(@"ContactsService Error. Recived incorrect data structure for contact object.");
                                                            success = NO;
                                                            break;
                                                        }
                                                    }
                                                    if (success) {
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            block([contacts copy], error);
                                                        });
                                                    } else {
                                                        NSError *invalidDataError = [ContactsService errorWithCode:kUnprocessableEntityError];
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            block(nil, invalidDataError);
                                                        });
                                                    }
                                                } else {
                                                    NSError *invalidDataError = [ContactsService errorWithCode:kUnprocessableEntityError];
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        block(nil, invalidDataError);
                                                    });
                                                }
                                            } else {
                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                    block(nil, error);
                                                });
                                            }
                                        }
    }];
    [sessionDataTask resume];
}

#pragma mark - API Error -
/**
 *  Private method that will generate application base error based on error code.
 *  @param errorCode - error code value.
 *  @return NSError object with description.
 **/
+ (NSError *)errorWithCode:(NSInteger)errorCode {
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    NSDictionary *errorUserInfo = nil;
    
    if (errorCode == kUnprocessableEntityError) {
        errorUserInfo = @{NSLocalizedDescriptionKey: @"Unprocessable Entity error."};
    }
    
    NSError *invalidDataError = [NSError errorWithDomain:bundleIdentifier
                                                    code:errorCode
                                                userInfo:errorUserInfo];
    
    
    return invalidDataError;
}

#pragma mark - API -
+ (void)getContactsWithCompletionBlock:(ContactServiceCompletionBlock)block {
    [ContactsService reciveContactsFromUrl:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", kBaseApiString, kBaseApiVersion, kContactsDefaultId]] completionBlock:block];
}

@end
