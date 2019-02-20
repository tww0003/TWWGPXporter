//
//  TWWGPXUtil.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXUtil.h"

@implementation TWWGPXUtil

+ (NSString *) getCurrentTimeAsString {
    return [TWWGPXUtil stringFromDate:[NSDate new]];
}

+ (NSDate *) dateFromString:(NSString *) date {
    NSISO8601DateFormatter *df = [[NSISO8601DateFormatter alloc] init];
    return [df dateFromString:date];
}

+ (NSString *) stringFromDate:(NSDate *) date {
    NSISO8601DateFormatter *df = [[NSISO8601DateFormatter alloc] init];
    return [df stringFromDate:date];
}

+ (BOOL) isNotEmptyString:(NSString *) inStr {
    if(inStr && ![inStr isEqualToString:@""]) return YES;
    return NO;
}

@end
