//
//  TWWGPXUtil.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TWWGPXUtil : NSObject

+ (NSString *) getCurrentTimeAsString;
+ (NSDate *) dateFromString:(NSString *) date;
+ (NSString *) stringFromDate:(NSDate *) date;
+ (BOOL) isNotEmptyString:(NSString *) inStr;
@end

