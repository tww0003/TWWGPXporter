//
//  TWWGPXLink.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXLink.h"
#import "TWWGPXUtil.h"

@implementation TWWGPXLink

- (NSString *) toXMLString {
    NSMutableString *returnString = _href ? [NSMutableString stringWithFormat:@"<link href=\"%@\">", [_href absoluteString]] : [NSMutableString stringWithFormat:@"<link>"];
    
    if([TWWGPXUtil isNotEmptyString:_text]) {
        [returnString appendFormat:@"<text>%@</text>", _text];
    }
    
    if([TWWGPXUtil isNotEmptyString:_type]) {
        [returnString appendFormat:@"<type>%@</type>", _type];
    }
    
    [returnString appendString:@"</link>"];
    return [returnString copy];
}

@end
