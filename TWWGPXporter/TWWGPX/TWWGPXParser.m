//
//  TWWGPXParser.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXParser.h"
#import "TWWGPX.h"
#import "TWWGPXUtil.h"

@interface TWWGPXParser()

@property TWWGPXFile *gpxFile;
@property NSMutableArray *elements;
@property NSString *currentElementName;

@end

@implementation TWWGPXParser

- (id) initWithGPXData:(NSData *) gpxData {
    self = [super initWithData:gpxData];
    return self;
}

- (void) createTWWGPXFile {
    self.delegate = self;
    [self parse];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    _gpxFile = [[TWWGPXFile alloc] init];
    _elements = [[NSMutableArray alloc] init];
}

- (void) parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"Document ended");
}

- (void) parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName
     forElement:(NSString *) elementName type:(NSString *)type
   defaultValue:(NSString *) defaultValue {
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"Found Characters: %@", string);
    if([TWWGPXUtil isNotEmptyString:string] && ![[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@"\n"]) {
        NSLog(@"%@", string);
        
        if([_currentElementName isEqualToString:@"text"]
           || [_currentElementName isEqualToString:@"name"] || [_currentElementName isEqualToString:@"desc"]) {
            [[_elements lastObject] setValue:string forKey:[TWWGPXUtil getTagNameForElement:_currentElementName]];
        }
        
        // NSNumber's
        if([_currentElementName isEqualToString:@"ele"] || [_currentElementName isEqualToString:@"number"]
           || [_currentElementName isEqualToString:@"geoidheight"] || [_currentElementName isEqualToString:@"hdop"]
           || [_currentElementName isEqualToString:@"vdop"] || [_currentElementName isEqualToString:@"pdop"]
           || [_currentElementName isEqualToString:@"ageofdgpsdata"] || [_currentElementName isEqualToString:@"sat"]
           || [_currentElementName isEqualToString:@"magvar"]) {
            
            NSNumber *num = @([string floatValue]);
            [[_elements lastObject] setValue:num forKey:[TWWGPXUtil getTagNameForElement:_currentElementName]];
        }
        
        if([_currentElementName isEqualToString:@"time"]) {
            [[_elements lastObject] setValue:[TWWGPXUtil dateFromString:string] forKey:_currentElementName];
        }
    }
}

- (void) parser:(NSXMLParser *) parser didStartElement:(NSString *) elementName
   namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
     attributes:(NSDictionary *) attributeDict {
    
    NSLog(@"Did start parsing element named: %@ With attributes:%@", elementName, attributeDict);
    
    _currentElementName = elementName;
    
    if([elementName isEqualToString:@"gpx"]) {
        _gpxFile.version = attributeDict[@"version"];
        _gpxFile.creator = attributeDict[@"creator"];
        [_elements addObject:_gpxFile];
    }
    if([elementName isEqualToString:@"metadata"]) {
        TWWGPXMetadata *metadata = [[TWWGPXMetadata alloc] init];
        _gpxFile.metadata = metadata;
        [_elements addObject:metadata];
    }
    if([elementName isEqualToString:@"wpt"]) {
        TWWGPXWaypoint *wpt = [[TWWGPXWaypoint alloc] init];
        [_gpxFile addWayPoint:wpt];
        [_elements addObject:wpt];
    }
    if([elementName isEqualToString:@"trkpt"]) {
        NSNumber *lat;
        NSNumber *lon;
        if(attributeDict[@"lat"] && attributeDict[@"lon"]) {
            lat = @([attributeDict[@"lat"] floatValue]);
            lon = @([attributeDict[@"lon"] floatValue]);
        }
        TWWGPXTrackPoint *trkpt = [[TWWGPXTrackPoint alloc] init];
        if(lat && lon) {
            trkpt.latitude = lat;
            trkpt.longitude = lon;
        }
        [[[[[_gpxFile tracks] lastObject] trackSegments] lastObject] addTrackPoint:trkpt];
        [_elements addObject:trkpt];
    }
    if([elementName isEqualToString:@"rte"]) {
        TWWGPXRoute *rte = [[TWWGPXRoute alloc] init];
        [_elements addObject:rte];
    }
    if([elementName isEqualToString:@"trk"]) {
        TWWGPXTrack *trk = [[TWWGPXTrack alloc] init];
        [_gpxFile addTrack:trk];
        [_elements addObject:trk];
    }
    if([elementName isEqualToString:@"trkseg"]) {
        TWWGPXTrackSegment *trkseg = [[TWWGPXTrackSegment alloc] init];
        
        if([_gpxFile tracks].count != 1) {
            [[[_gpxFile tracks] lastObject] addTrackSegment:trkseg];
        }
        
        [_elements addObject:trkseg];
    }
    if([elementName isEqualToString:@"author"]) {

    }
    if([elementName isEqualToString:@"copyright"]) {

    }
    if([elementName isEqualToString:@"link"]) {
        TWWGPXLink *link = [[TWWGPXLink alloc] init];
        if(attributeDict[@"href"]) {
            link.href = [NSURL URLWithString:attributeDict[@"href"]];
        }
        [[_elements lastObject] addLink:link];
        [_elements addObject:link];
    }

    if([elementName isEqualToString:@"bounds"]) {
        TWWGPXBounds *bounds = [[TWWGPXBounds alloc] init];
        [_elements addObject:bounds];
    }
    if([elementName isEqualToString:@"rtept"]) {
        TWWGPXRoutePoint *rtept = [[TWWGPXRoutePoint alloc] init];
        [_elements addObject:rtept];
    }
    if([elementName isEqualToString:@"email"]) {
        TWWGPXEmail *email = [[TWWGPXEmail alloc] init];
        [_elements addObject:email];
    }
}

-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"Did end parsing element: %@", elementName);
    if([TWWGPXUtil doesElementHaveObject:elementName]) {
        [_elements removeLastObject];
    }
}

@end
