//
//  TWWGPXTrackSegment.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXTrackSegment.h"

@implementation TWWGPXTrackSegment

- (id) initWithTrackPoint:(TWWGPXTrackPoint *) trackPoint {
    self = [super init];
    if(self) {
        _trackPoints = @[trackPoint];
    }
    return self;
}

- (void) addTrackPoint:(TWWGPXTrackPoint *) trackPoint {
    
    if(_trackPoints) {
        NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:_trackPoints];
        [temp addObject:trackPoint];
        _trackPoints = [temp copy];
    }
}


@end
