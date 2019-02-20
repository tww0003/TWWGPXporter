//
//  TWWGPXRoutePoint.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXRoutePoint.h"

@implementation TWWGPXRoutePoint

- (id) init {
    self = [super init];
    if(self) {
        self.pointType = @"rtept";
    }
    return self;
}

@end
