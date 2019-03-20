//
//  TWWGPXPerson.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXPerson.h"

@implementation TWWGPXPerson

- (id) initWithName:(NSString *) name {
    self = [self initWithName:name email:nil andLink:nil];
    return self;
}

- (id) initWithName:(NSString *) name andEmail:(TWWGPXEmail *) email {
    self = [self initWithName:name email:email andLink:nil];
    return self;
}

- (id) initWithName:(NSString *) name email:(TWWGPXEmail *) email andLink:(TWWGPXLink *) link {
    self = [super init];
    if(self) {
        _name = name;
        _email = email;
        _link = link;
    }
    return self;
}

- (void) addLink:(TWWGPXLink *) link {
    _link = link;
}


- (NSString *) toXMLString {
    NSMutableString *returnString = [NSMutableString stringWithFormat:@"<name>%@</name>", _name];
    if(_email) {
        [returnString appendString:[_email toXMLString]];
    }
    
    if(_link) {
        [returnString appendString:[_link toXMLString]];
    }
    
    return [returnString copy];
}

@end
