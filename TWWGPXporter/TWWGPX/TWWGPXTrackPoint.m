//
//  TWWGPXTrackPoint.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXTrackPoint.h"

@implementation TWWGPXTrackPoint

- (id) init {
    self = [super init];
    if(self) {
        self.pointType = @"trkpt";
    }
    return self;
}

@end
