//
//  TWWGPXRoute.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXRoute.h"
#import "TWWGPXUtil.h"
#import "TWWGPXLink.h"

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

- (NSString *) toXMLString {
    
    NSMutableString *returnString = [NSMutableString stringWithFormat:@"<rte>"];
    if([TWWGPXUtil isNotEmptyString:self.name]) {
        [returnString appendFormat:@"<name>%@</name>", self.name];
    }
    
    if([TWWGPXUtil isNotEmptyString:self.comment]) {
        [returnString appendFormat:@"<cmt>%@</cmt>", self.comment];
    }
    
    if([TWWGPXUtil isNotEmptyString:self.desc]) {
        [returnString appendFormat:@"<desc>%@</desc>", self.desc];
    }

    if([TWWGPXUtil isNotEmptyString:self.source]) {
        [returnString appendFormat:@"<src>%@</src>", self.source];
    }
    
    if(self.links) {
        for(TWWGPXLink *link in self.links) {
            [returnString appendString:[link toXMLString]];
        }
    }

    if(self.number) {
        [returnString appendFormat:@"<number>%@</number>", self.number];
    }

    if([TWWGPXUtil isNotEmptyString:self.type]) {
        [returnString appendFormat:@"<type>%@</type>", self.type];
    }
    
    if(_routePoints) {
        for(TWWGPXRoutePoint *rtept in _routePoints) {
            [returnString appendString:[rtept toXMLString]];
        }
    }
    
    [returnString appendString:@"</rte>"];

    return [returnString copy];
}

@end
