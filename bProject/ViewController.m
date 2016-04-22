//
//  ViewController.m
//  bProject
//
//  Created by Gino Shen on 2016/4/22.
//  Copyright © 2016年 Gino Shen. All rights reserved.
//

#import "ViewController.h"
#import "UserManager.h"
#import "UserDataModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *buildNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *gitVersionLabel;
@property (weak, nonatomic) IBOutlet UILabel *targetLabel;
@property (weak, nonatomic) IBOutlet UIView *loginStatusView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.buildNumberLabel.text = [NSString stringWithFormat:@"Build Number: %@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]];
    self.gitVersionLabel.text = [NSString stringWithFormat:@"Git Version: %@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CommitVersion"]];

#if defined DEV_VERSION
    self.targetLabel.text = @"This is dev Version";
#else
    self.targetLabel.text = @"This is production Version";
#endif

    [self.loginStatusView.layer setCornerRadius:self.loginStatusView.frame.size.height*0.5];
    self.loginStatusView.backgroundColor = [self setLoginStatusColor];
    
}

- (UIColor *) setLoginStatusColor
{
    if ([UserManager isUserLogin]) {
        return [UIColor greenColor];
    }else{
        return [UIColor redColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressToLogin:(id)sender {
    
    if ([UserManager isUserLogin]) {
        [UserDataModel logout];
    }else{
        [UserDataModel login];
    }
    self.loginStatusView.backgroundColor = [self setLoginStatusColor];
;
}

@end
