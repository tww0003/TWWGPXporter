//
//  TWWGPXBase.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPX.h"

/**
 *  Quite a few classes share the same properties - TWWGPXMetadata, TWWGPXTrack,
 *  TWWGPXPoint, and TWWGPXRoute.
 *  They might as well inherit the same properties from a super class.
 *  Descriptions of the properties from the GPX 1.1 Schema Docs are found in the Subclasses.
 */

@interface TWWGPXBase : TWWGPX

@property NSString *name;
@property NSString *desc;
@property NSArray  *links;

@end
