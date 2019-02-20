//
//  TWWGPXMetadata.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXMetadata.h"
#import "TWWGPXUtil.h"

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

- (id) initWithAuthor:(TWWGPXPerson *) author copyright:(TWWGPXCopyright *) copyright time:(NSDate *) time andKeywords:(NSString *) keywords {
    self = [self initWithAuthor:author copyright:copyright time:time keywords:keywords andBounds:nil];
    return self;
}

- (id) initWithAuthor:(TWWGPXPerson *) author
            copyright:(TWWGPXCopyright *) copyright
                 time:(NSDate *) time
             keywords:(NSString *)keywords
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

- (NSString *) toXMLString {
    NSMutableString *returnString = [NSMutableString stringWithFormat:@"<metadata>"];
    
    if(self.name && ![self.name isEqualToString:@""]) {
        [returnString appendFormat:@"<name>%@</name>", self.name];
    }
    
    if(self.desc && ![self.desc isEqualToString:@""]) {
        [returnString appendFormat:@"<desc>%@</desc>", self.desc];
    }
    
    if(_author) {
        [returnString appendFormat:@"<author>%@</author>",[_author toXMLString]];
    }
    
    if(_copyright) {
        [returnString appendString:[_copyright toXMLString]];
    }
    
    if(self.links) {
        for(TWWGPXLink *link in self.links) {
            [returnString appendString:[link toXMLString]];
        }
    }
    
    if(_time) {
        [returnString appendFormat:@"<time>%@</time>", [TWWGPXUtil stringFromDate:_time]];
    }
    
    if(_keywords && ![_keywords isEqualToString:@""]) {
        [returnString appendFormat:@"<keywords>%@</keywords>", _keywords];
    }
    
    if(_bounds) {
        [returnString appendString:[_bounds toXMLString]];
    }
    
    return [returnString copy];
}


@end
