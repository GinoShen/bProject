//
//  ViewController.m
//  bProject
//
//  Created by Gino Shen on 2016/4/22.
//  Copyright © 2016年 Gino Shen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *buildNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *gitVersionLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.buildNumberLabel.text = [NSString stringWithFormat:@"Build Number: %@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]];
    self.gitVersionLabel.text = [NSString stringWithFormat:@"Git Version: %@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CommitVersion"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
