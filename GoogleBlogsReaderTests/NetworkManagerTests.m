//
//  NetworkManagerTests.m
//  GoogleBlogsReader
//
//  Created by Hao Li on 29/05/2015.
//  Copyright (c) 2015 halolee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NetworkManager.h"

#import <AFNetworking/AFNetworking.h>

@interface NetworkManagerTests : XCTestCase

@end

@implementation NetworkManagerTests

#pragma mark - helper methods

- (NetworkManager *)createUniqueInstance {
    
    return [[NetworkManager alloc] init];
    
}

- (NetworkManager *)getSharedInstance {
    
    return [NetworkManager sharedNetworkManager];
    
}

#pragma mark - Singleton creation test

- (void)testSingletonSharedInstanceCreated {
    
    XCTAssertNotNil([self getSharedInstance]);
    
}

- (void)testSingletonUniqueInstanceCreated {
    
    XCTAssertNotNil([self createUniqueInstance]);
    
}

- (void)testSingletonReturnsSameSharedInstanceTwice {
    
    NetworkManager *networkManager = [self getSharedInstance];
    XCTAssertEqual(networkManager, [self getSharedInstance]);
    
}

- (void)testSingletonSharedInstanceSeparateFromUniqueInstance {
    
    NetworkManager *networkManager = [self getSharedInstance];
    XCTAssertNotEqual(networkManager, [self createUniqueInstance]);
}

- (void)testSingletonReturnsSeparateUniqueInstances {
    
    NetworkManager *networkManager = [self createUniqueInstance];
    XCTAssertNotEqual(networkManager, [self createUniqueInstance]);
}

#pragma mark - Network connection test

- (void) testGetBlogPost{
    
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"Network request expection"];
    
    [[NetworkManager sharedNetworkManager] getBlogPostSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        XCTAssertTrue(responseObject);
        [expectation fulfill];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        XCTAssertFalse(error);
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

@end
