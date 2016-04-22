//
//  UserDataModel.m
//  bProject
//
//  Created by Gino Shen on 2016/4/22.
//  Copyright © 2016年 Gino Shen. All rights reserved.
//

#import "UserDataModel.h"
#import "UserManager.h"

@implementation UserDataModel

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.userId forKey:@"userId"];
    [coder encodeObject:self.userName forKey:@"userName"];    
}

- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        self.userId = [coder decodeObjectForKey:@"userId"];
        self.userName = [coder decodeObjectForKey:@"userName"];
    }
    return self;
}

+ (void)login
{
    UserDataModel *uData = [[UserDataModel alloc] init];
    uData.userId = @"007";
    uData.userName = @"Gino";
    [UserManager setLoginWithData:uData];
}

+ (void)logout
{
    [UserManager removeLoginData];
}

@end
