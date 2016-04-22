//
//  UserDataModel.h
//  bProject
//
//  Created by Gino Shen on 2016/4/22.
//  Copyright © 2016年 Gino Shen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDataModel : NSObject
@property (nonatomic, strong)NSString *userId;
@property (nonatomic, strong)NSString *userName;

+ (void)login;
+ (void)logout;

@end
