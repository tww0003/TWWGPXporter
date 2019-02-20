//
//  TWWGPXPoint.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXPoint.h"

@implementation TWWGPXPoint

- (id) initWithLocation:(CLLocation *)location {
    self = [super init];
    
    if(self) {
        _latitude = @(location.coordinate.latitude);
        _longitude = @(location.coordinate.longitude);
        _elevation = @(location.altitude);
        _time = location.timestamp;
        _horizontalDilution = @(location.horizontalAccuracy);
        _verticalDilution = @(location.verticalAccuracy);
    }
    
    return self;
}

@end
