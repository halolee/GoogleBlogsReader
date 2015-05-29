//
//  QueryResponse.m
//  GoogleBlogsReader
//
//  Created by Hao Li on 29/05/2015.
//  Copyright (c) 2015 halolee. All rights reserved.
//

#import "QueryResponse.h"

@implementation QueryResponse
+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"query":@"query",
             @"entries":@"entries"
             };
}
@end
