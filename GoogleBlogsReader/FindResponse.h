//
//  FindResponse.h
//  GoogleBlogsReader
//
//  Created by Hao Li on 29/05/2015.
//  Copyright (c) 2015 halolee. All rights reserved.
//

#import "QueryResponse.h"

@interface FindResponse : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSDictionary *responseData;
@property (nonatomic, copy, readonly) NSString *responseDetails;
@property (nonatomic, copy, readonly) NSNumber *responseStatus;

@end
