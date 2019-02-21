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

+ (NSNumber *) numberFromString:(NSString *) string {
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    nf.numberStyle = NSNumberFormatterDecimalStyle;
    return [nf numberFromString:string];
}

+ (NSString *) getTagNameForElement:(NSString *) element {
    
    // Should probably turn this into a switch
    if([element isEqualToString:@"ele"]) {
        return @"elevation";
    }
    if([element isEqualToString:@"number"]) {
        return element;
    }
    if([element isEqualToString:@"geoidheight"]) {
        return @"geoidHeight";
    }
    if([element isEqualToString:@"hdop"]) {
        return @"horizontalDilution";
    }
    if([element isEqualToString:@"vdop"]) {
        return @"verticalDilution";
    }
    if([element isEqualToString:@"pdop"]) {
        return @"positionDilution";
    }
    if([element isEqualToString:@"ageofdgpsdata"]) {
        return @"secondsSinceLastDGPSUpdate";
    }
    if([element isEqualToString:@"sat"]) {
        return @"satellite";
    }
    if([element isEqualToString:@"magvar"]) {
        return @"magneticVariation";
    }
    if([element isEqualToString:@"time"]) {
        return element;
    }
    if([element isEqualToString:@"name"]) {
        return element;
    }
    if([element isEqualToString:@"text"]) {
        return element;
    }
    if([element isEqualToString:@"desc"]) {
        return element;
    }
    if([element isEqualToString:@"cmt"]) {
        return @"comment";
    }
    if([element isEqualToString:@"src"]) {
        return @"source";
    }
    if([element isEqualToString:@"sym"]) {
        return @"symbol";
    }
    if([element isEqualToString:@"fix"]) {
        return element;
    }

    return nil;
}

+ (BOOL) doesElementHaveObject:(NSString *) element {

    // Double check that these are all the elements that have a class
    // Also turn this into a switch
    if([element isEqualToString:@"gpx"] || [element isEqualToString:@"metadata"] ||
       [element isEqualToString:@"trk"] || [element isEqualToString:@"trkseg"] ||
       [element isEqualToString:@"trkpt"] || [element isEqualToString:@"rte"] ||
       [element isEqualToString:@"rtept"] || [element isEqualToString:@"wpt"] ||
       [element isEqualToString:@"copyright"] || [element isEqualToString:@"link"] ||
       [element isEqualToString:@"bounds"] || [element isEqualToString:@"author"] ||
       [element isEqualToString:@"email"]) {
        return YES;
    }
    
    return NO;
}
@end
