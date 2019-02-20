//
//  TWWGPXRoute.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXRoute.h"

@implementation TWWGPXRoute

- (id) initWithRoutePoint:(TWWGPXRoutePoint *) routePoint {
    self = [self initWithRoutePoints:@[routePoint]];
    return self;
}

- (id) initWithRoutePoints:(NSArray *) routePoints {
    self = [super init];
    if(self) {
        _routePoints = routePoints;
    }
    return self;
}

- (void) addPoint:(TWWGPXPoint *) point {
    if([point isKindOfClass:[TWWGPXRoutePoint class]]) {
        if(_routePoints) {
            NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:_routePoints];
            [temp addObject:point];
            _routePoints = [temp copy];
        } else {
            _routePoints = @[point];
        }
    }
}

@end
