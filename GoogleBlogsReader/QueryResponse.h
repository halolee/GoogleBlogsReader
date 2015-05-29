//
//  QueryResponse.h
//  GoogleBlogsReader
//
//  Created by Hao Li on 29/05/2015.
//  Copyright (c) 2015 halolee. All rights reserved.
//

#import "Entry.h"

@interface QueryResponse : MTLModel <MTLJSONSerializing>
@property (nonatomic, copy, readonly) NSString *query;
@property (nonatomic, copy, readonly) NSArray *entries;
@end
