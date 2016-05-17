//
//  UserManager.m
//  bProject
//
//  Created by Gino Shen on 2016/4/22.
//  Copyright © 2016年 Gino Shen. All rights reserved.
//

#import "UserManager.h"
static NSString *const  USER_STORE_KEY = @"UserData";

@implementation UserManager

+ (id)sharedInstance
{
    // structure used to test whether the block has completed or not
    static dispatch_once_t p = 0;
    
    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject = nil;
    
    // executes a blocsk object once and only once for the lifetime of an application
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    // returns the same object each time
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        [self getAndDecoderUserDataFromUserDefault];
    }
    return self;
}

+ (BOOL) isUserLogin
{
    return [[self sharedInstance] userData]?YES:NO;
}

+ (void) setLoginWithData:(UserDataModel *)userData
{
    [[self sharedInstance] setUserData:userData];
    [[self sharedInstance] setAndEncoderUserDataFromUserDefault];
}

+ (void) removeLoginData
{
    [[self sharedInstance] setUserData:nil];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USER_STORE_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void) getAndDecoderUserDataFromUserDefault
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:USER_STORE_KEY]) {
        self.userData = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:USER_STORE_KEY]];
    }
}

- (void) setAndEncoderUserDataFromUserDefault
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:USER_STORE_KEY]) {
        self.userData = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:USER_STORE_KEY]];
    }
}


@end
