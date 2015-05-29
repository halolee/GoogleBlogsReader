//
//  NetworkManager.m
//  GoogleBlogsReader
//
//  Created by Hao Li on 29/05/2015.
//  Copyright (c) 2015 halolee. All rights reserved.
//

#import "NetworkManager.h"

#import <AFNetworking/AFNetworking.h>

#define BASE_URL @"https://ajax.googleapis.com/ajax/services/"

@interface NetworkManager()
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

@end

@implementation NetworkManager

+ (id) sharedNetworkManager{
    static NetworkManager *sharedMVNetworkManager = nil;
    @synchronized(self) {
        if (sharedMVNetworkManager == nil)
            sharedMVNetworkManager = [[self alloc] init];
        sharedMVNetworkManager.manager = [AFHTTPRequestOperationManager manager];
    }
    return sharedMVNetworkManager;
}

- (void) getBlogPostSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    NSString *dummySearchString = @"Official%20Google%20Blogs"; //TODO: change to real request in production mode
    NSString *requestURL = [BASE_URL stringByAppendingFormat:@"feed/find?v=1.0&q=%@",dummySearchString];
    
    [self.manager GET:requestURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"response %@",responseObject);
        success(operation,responseObject);
    } failure:failure];
}

@end
