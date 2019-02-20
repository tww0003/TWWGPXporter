//
//  TWWGPXDataBase.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPXBase.h"
#import "TWWGPXPoint.h"

/**
 *  GPS Tracks and GPX Routes are very similar.
 *  They might as well inherit the same properties from a super class.
 *  Descriptions of the properties from the GPX 1.1 Schema Docs are found in the Subclasses.
 */
@interface TWWGPXDataBase : TWWGPXBase

@property NSString *comment;
@property NSString *source;
@property NSNumber *number;
@property NSString *type;

- (id) initWithName:(NSString *) name;
- (id) initWithName:(NSString *) name andDescription:(NSString *) desc;
- (void) addPoint:(TWWGPXPoint *) point;

@end

