//
//  TWWGPXTrack.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXTrack.h"
#import "TWWGPXUtil.h"
#import "TWWGPXLink.h"

@implementation TWWGPXTrack

- (id) init {
    self = [super init];
    
    if(self) {
        _trackSegments = @[[[TWWGPXTrackSegment alloc] init]]; // Maybe I shouldn't do this
    }
    return self;
}

- (id) initWithTrackSegment:(TWWGPXTrackSegment *) segment {
    self = [super init];
    if(self) {
        _trackSegments = @[segment];
    }
    return  self;
}

- (id) initWithName:(NSString *) name andTrackSegment:(TWWGPXTrackSegment *) segment {
    self = [self initWithTrackSegment:segment];
    
    if(self) {
        self.name = name;
    }
    
    return self;
}

- (id) initWithName:(NSString *) name number:(NSNumber *) number andTrackSegment:(TWWGPXTrackSegment *) segment {
    self = [self initWithName:name andTrackSegment:segment];
    if (self) {
        self.number = number;
    }
    return self;
}

- (id) initWithTrackSegments:(NSArray *)segments {
    self = [super init];
    
    if(self) {
        _trackSegments = segments;
    }
    return self;
}

- (id) initWithName:(NSString *)name andTrackSegments:(NSArray *)segments {
    self = [self initWithTrackSegments:segments];
    
    if(self) {
        self.name = name;
    }
    return self;
}

- (id) initWithName:(NSString *)name number:(NSNumber *)number andTrackSegments:(NSArray *)segments {
    self = [self initWithName:name andTrackSegments:segments];
    
    if(self) {
        self.number = number;
    }
    
    return self;
}

- (void) addTrackSegment:(TWWGPXTrackSegment *) segment {
    if(_trackSegments) {
        NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:_trackSegments];
        [temp addObject:segment];
        _trackSegments = [temp copy];
    } else {
        _trackSegments = @[segment];
    }
}

- (void) addPoint:(TWWGPXPoint *) point {
    if([point isKindOfClass:[TWWGPXTrackPoint class]]) {
        if(_trackSegments && [_trackSegments lastObject]) {
            TWWGPXTrackSegment *lastSegment = (TWWGPXTrackSegment *) [_trackSegments lastObject];
            if([lastSegment trackPoints]) {
                NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:[lastSegment trackPoints]];
                [temp addObject:point];
                lastSegment.trackPoints = [temp copy];
            } else {
                lastSegment.trackPoints = @[point];
            }
        }
    }
}


- (NSString *) toXMLString {
    NSMutableString *returnString = [NSMutableString stringWithFormat:@"<trk>"];
    
    if([TWWGPXUtil isNotEmptyString:self.name]) {
        [returnString appendFormat:@"<name>%@</name>", self.name];
    }
    
    if([TWWGPXUtil isNotEmptyString:self.comment]) {
        [returnString appendFormat:@"<cmt>%@</cmt>", self.comment];
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
    
    if(_trackSegments) {
        for(TWWGPXTrackSegment *seg in _trackSegments) {
            [returnString appendString:[seg toXMLString]];
        }
    }
    
    [returnString appendString:@"</trk>"];
    
    return returnString;
}

@end
