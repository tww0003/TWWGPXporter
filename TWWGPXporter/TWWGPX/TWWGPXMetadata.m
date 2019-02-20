//
//  TWWGPXMetadata.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXMetadata.h"

@implementation TWWGPXMetadata

- (id) init {
    self = [self initWithAuthor:nil];
    return self;
}

- (id) initWithAuthor:(TWWGPXPerson *) author {
    self = [self initWithAuthor:author andCopyright:nil];
    return self;
}

- (id) initWithAuthor:(TWWGPXPerson *) author andCopyright:(TWWGPXCopyright *) copyright {
    self = [self initWithAuthor:author copyright:copyright andTime:[NSDate new]];
    return self;
}

- (id) initWithAuthor:(TWWGPXPerson *) author copyright:(TWWGPXCopyright *) copyright andTime:(NSDate *) time {
    self = [self initWithAuthor:author copyright:copyright time:time andKeywords:nil];
    return self;
}

- (id) initWithAuthor:(TWWGPXPerson *) author copyright:(TWWGPXCopyright *) copyright time:(NSDate *) time andKeywords:(NSArray *)keywords {
    self = [self initWithAuthor:author copyright:copyright time:time keywords:keywords andBounds:nil];
    return self;
}

- (id) initWithAuthor:(TWWGPXPerson *) author
            copyright:(TWWGPXCopyright *) copyright
                 time:(NSDate *) time
             keywords:(NSArray *)keywords
            andBounds:(TWWGPXBounds *) bounds {
    
    self = [super init];
    if(self) {
        _author = author;
        _copyright = copyright;
        _time = time;
        _keywords = keywords;
        _bounds = bounds;
    }
    return self;
}


@end
