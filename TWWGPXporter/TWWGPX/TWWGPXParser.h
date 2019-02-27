//
//  TWWGPXParser.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPXFile.h"


@protocol TWWGPXParserDelegate<NSObject>
@optional
- (void) didFinishParsingGPXFile:(TWWGPXFile *) gpxFile;
@end

@interface TWWGPXParser : NSXMLParser<NSXMLParserDelegate>

- (id) initWithGPXData:(NSData *) gpxData;
- (void) createTWWGPXFile;

@property (nonatomic, weak) id <TWWGPXParserDelegate> gpxDelegate;


@end
