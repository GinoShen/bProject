//
//  UserManager.h
//  bProject
//
//  Created by Gino Shen on 2016/4/22.
//  Copyright © 2016年 Gino Shen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserDataModel.h"

@interface UserManager : NSObject
@property (nonatomic, strong)UserDataModel *userData;
+ (id)sharedInstance;
+ (BOOL) isUserLogin;
+ (void) setLoginWithData:(UserDataModel *)userData;
+ (void) removeLoginData;

@end
