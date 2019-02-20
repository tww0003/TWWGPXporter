//
//  TWWGPXFile.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXFile.h"

@implementation TWWGPXFile

- (id) init {
    self = [super init];
    if (self) {
        _version = @"1.1";
    }
    return self;
}

- (id) initWithCreator:(NSString *) creator {
    self = [self init];
    
    if (self) {
        _creator = creator;
    }
    return self;
}

- (id) initWithMetadata:(TWWGPXMetadata *) metadata {
    self = [self init];
    if (self) {
        _metadata = metadata;
    }
    return self;
}

- (id) initWithWaypoint:(TWWGPXWaypoint *) waypoint {
    self = [self initWithWaypoints:@[waypoint]];
    return self;
}

- (id) initWithWaypoints:(NSArray *) waypoints {
    self = [self init];
    if(self) {
        _waypoints = waypoints;
    }
    return self;
}

- (id) initWithRoute:(TWWGPXRoute *) route {
    self = [self initWithRoutes:@[route]];
    return self;
}

- (id) initWithRoutes:(NSArray *) routes {
    self = [self init];
    if(self) {
        _routes = routes;
    }
    return self;
}

- (id) initWithTrack:(TWWGPXTrack *) track{
    self = [self initWithTracks:@[track]];
    return self;
}

- (id) initWithTracks:(NSArray *) tracks {
    self = [self init];
    if(self) {
        _tracks = tracks;
    }
    return self;
}

- (void) addWayPoint:(TWWGPXWaypoint *) waypoint {
    if(_waypoints) {
        NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:_waypoints];
        [temp addObject:waypoint];
        _waypoints = [temp copy];
    } else {
        _waypoints = @[waypoint];
    }
}

- (void) addTrack:(TWWGPXTrack *) track {
    if(_tracks) {
        NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:_tracks];
        [temp addObject:track];
        _tracks = [temp copy];
    } else {
        _tracks = @[track];
    }
}

- (void) addRoute:(TWWGPXRoute *) route {
    if(_routes) {
        NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:_routes];
        [temp addObject:route];
        _routes = [temp copy];
    } else {
        _routes = @[route];
    }

}


- (NSString *) toXMLString {
    
    NSMutableString *returnString = [NSMutableString stringWithFormat:@"<gpx version=\"%@\"", _version];
    if(_creator && ![_creator isEqualToString:@""]) {
        [returnString appendFormat:@" creator=\"%@\"", _creator];
    }
    [returnString appendString:@">"];
    
    if(_metadata) {
        [returnString appendString:[_metadata toXMLString]];
    }
    
    if(_waypoints) {
        for(TWWGPXWaypoint *wpt in _waypoints) {
            [returnString appendString:[wpt toXMLString]];
        }
    }
    
    if(_routes) {
        for(TWWGPXRoute *route in _routes) {
            [returnString appendString:[route toXMLString]];
        }
    }
    
    if(_tracks) {
        for(TWWGPXTrack *track in _tracks) {
            [returnString appendString:[track toXMLString]];
        }
    }
    
    [returnString appendString:@"</gpx>"];
    return [returnString copy];
}


@end
