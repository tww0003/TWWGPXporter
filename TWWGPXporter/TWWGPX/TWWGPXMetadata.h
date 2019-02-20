//
//  TWWGPXMetadata.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWWGPXMetadata : NSObject

@property NSString *name;
@property NSString *desc;
@property NSString *author;
@property NSString *copyright;
@property NSArray  *link;
@property NSDate   *time;
@property NSArray  *keywords;
@property NSString *bounds;

@end
