//
//  bProjectTests.m
//  bProjectTests
//
//  Created by Gino Shen on 2016/4/22.
//  Copyright © 2016年 Gino Shen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UserDataModel.h"
#import "UserManager.h"
#import "ViewController.h"

@interface bProjectTests : XCTestCase

@end

@implementation bProjectTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}


- (void)testCommitVersion {
    // Arrange: check commit versino is set up
    // Act: get commit version from plist
    // Assert: it should not be nil;
    XCTAssertNotNil([[NSBundle mainBundle] objectForInfoDictionaryKey:@"CommitVersion"]);
}


- (void)testUserLoginData{
    // Arrange: check login user data is not nil
    // Act: user login
    // Assert: user data is not nil, userId, username is not nil also;

    [UserDataModel loginCompletion:^(id data){
        UserDataModel *uData = (UserDataModel *)data;
        XCTAssertNotNil(uData);
        XCTAssertNotNil(uData.userId);
        XCTAssertNotNil(uData.userName);
        
    }];
    
}

- (void)testVCCommitVesionLabel {

    // Arrange: git version is set to view in viewDidLoad
    // Act: set up vc
    // Assert: check gitVersionLabel;

    UIStoryboard *storyboard =
    [UIStoryboard storyboardWithName:@"Main"
                              bundle:[NSBundle mainBundle]];
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"root"];
    [vc loadView];
    [vc viewDidLoad];
    NSString *gitVersion = [NSString stringWithFormat:@"Git Version: %@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CommitVersion"]];
    XCTAssertTrue([vc.gitVersionLabel.text isEqualToString:gitVersion], @"");

}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
