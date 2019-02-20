//
//  TWWGPXDataBase.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXDataBase.h"

@implementation TWWGPXDataBase

- (id) initWithName:(NSString *) name {
    self = [self initWithName:name andDescription:nil];
    return self;
}

- (id) initWithName:(NSString *)name andDescription:(NSString *) desc {
    self = [super init];
    if(self) {
        self.name = name;
        self.desc = desc;
    }
    return self;
}

@end
