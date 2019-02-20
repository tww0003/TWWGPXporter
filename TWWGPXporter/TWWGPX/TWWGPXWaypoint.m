//
//  TWWGPXWaypoint.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXWaypoint.h"

@implementation TWWGPXWaypoint

- (id) init {
    self = [super init];
    if(self) {
        self.pointType = @"wpt";
    }
    return self;
}

@end
