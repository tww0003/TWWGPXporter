//
//  TWWGPXBase.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXBase.h"

@implementation TWWGPXBase

- (void) addLink:(TWWGPXLink *) link {
    if(_links) {
        NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:_links];
        [temp addObject:link];
        _links = [temp copy];
    } else {
        _links = @[link];
    }
}

@end
