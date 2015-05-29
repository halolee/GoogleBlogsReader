//
//  NetworkManager.h
//  GoogleBlogsReader
//
//  Created by Hao Li on 29/05/2015.
//  Copyright (c) 2015 halolee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FindResponse.h"

@class AFHTTPRequestOperation;

@interface NetworkManager : NSObject

+ (id) sharedNetworkManager;

- (void) getBlogPostSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (NSArray *) getEntitiesListFromResponse:(id)response;
@end
