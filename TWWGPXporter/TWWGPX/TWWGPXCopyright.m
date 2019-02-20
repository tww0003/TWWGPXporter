//
//  TWWGPXCopyright.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXCopyright.h"

@implementation TWWGPXCopyright

- (id) initWithAuthor:(NSString *) author {
    self = [self initWithAuthor:author year:nil andLicense:nil];
    return self;
}

- (id) initWithAuthor:(NSString *) author andYear:(NSNumber *) year {
    self = [self initWithAuthor:author year:year andLicense:nil];
    return self;
}

- (id) initWithAuthor:(NSString *) author year:(NSNumber *) year andLicense:(NSURL *) license {
    self = [super init];
    if(self) {
        _author = author;
        _year = year;
        _license = license;
    }
    
    return self;
}

- (NSString *) toXMLString {
    NSMutableString *returnString = [NSMutableString stringWithFormat:@"<copyright author=\"%@\">", _author];
    
    if(_year) {
        [returnString appendFormat:@"<year>%@</year>", _year];
    }
    
    if(_license) {
        [returnString appendFormat:@"<license>%@</license>", [_license absoluteString]];
    }
    
    return [returnString copy];
    
}

@end
