//
//  ViewController.h
//  bProject
//
//  Created by Gino Shen on 2016/4/22.
//  Copyright © 2016年 Gino Shen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *buildNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *gitVersionLabel;
@property (weak, nonatomic) IBOutlet UILabel *targetLabel;
@property (weak, nonatomic) IBOutlet UIView *loginStatusView;

- (UIColor *) setLoginStatusColor;

@end

