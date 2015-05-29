//
//  Entry.h
//  GoogleBlogsReader
//
//  Created by Hao Li on 29/05/2015.
//  Copyright (c) 2015 halolee. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Entry : MTLModel <MTLJSONSerializing>
@property (nonatomic, copy, readonly) NSString *url;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *conntentSnippet;
@property (nonatomic, copy, readonly) NSString *link;
@end
