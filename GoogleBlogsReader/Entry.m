//
//  Entry.m
//  GoogleBlogsReader
//
//  Created by Hao Li on 29/05/2015.
//  Copyright (c) 2015 halolee. All rights reserved.
//

#import "Entry.h"

@implementation Entry

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"url":@"url",
             @"title":@"title",
             @"conntentSnippet":@"conntentSnippet",
             @"link":@"link"
             };
}

@end
