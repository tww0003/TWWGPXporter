//
//  TWWGPXFile.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPXMetadata.h"

@interface TWWGPXFile : NSObject

@property NSString *version;
@property NSString *creator;
@property TWWGPXMetadata *metadata;
@property NSArray *waypoints;
@property NSArray *routes;
@property NSArray *treks;

@end
