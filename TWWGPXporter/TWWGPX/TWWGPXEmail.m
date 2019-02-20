//
//  TWWGPXEmail.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXEmail.h"

@implementation TWWGPXEmail
- (id) initWithEmailAddress:(NSString *) email{
    self = [super init];
    if(self) {
        NSArray *splitArray = [email componentsSeparatedByString:@"@"];
        _ID = splitArray[0];
        _domain = splitArray[1];
    }
    return self;
}
- (id) initWithId:(NSString *) ID andDomain:(NSString *) domain {
    self = [super init];
    if(self) {
        _ID = ID;
        _domain = domain;
    }
    return self;
}

- (NSString *) toXMLString {
    NSMutableString *returnString = [NSMutableString stringWithFormat:@"<email id=\"%@\" domain=\"%@\">", _ID, _domain];
    return [returnString copy];
}

@end
