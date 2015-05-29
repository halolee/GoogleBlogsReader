//
//  FindResponse.m
//  GoogleBlogsReader
//
//  Created by Hao Li on 29/05/2015.
//  Copyright (c) 2015 halolee. All rights reserved.
//

#import "FindResponse.h"

@implementation FindResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
              @"responseData":@"responseData",
              @"responseDetails":@"responseDetails",
              @"responseStatus":@"responseStatus"
             
             };
}

@end
