//
//  TWWGPXBounds.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXBounds.h"

@implementation TWWGPXBounds

- (id) initWithMinLat:(NSNumber *) minLat minLon:(NSNumber *) minLon maxLat:(NSNumber *) maxLat andMaxLon:(NSNumber *) maxLon {
    self = [super init];
    if(self) {
        _minLat = minLat;
        _minLon = minLon;
        _maxLat = maxLat;
        _maxLon = maxLon;
    }
    
    return self;
}

- (NSString *) toXMLString {
    NSMutableString *returnString = [NSMutableString stringWithFormat:@"<bounds minlat=\"%@\" minlon=\"%@\" maxlat=\"%@\" maxlon-\"%@\"/>", _minLat, _minLon, _maxLat, _maxLon];
    return [returnString copy];
}

@end
