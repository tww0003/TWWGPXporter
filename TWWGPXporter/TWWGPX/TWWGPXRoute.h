//
//  TWWGPXRoute.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWWGPXRoute : NSObject

@property NSString *name;
@property NSString *comment;
@property NSString *desc;
@property NSString *source;
@property NSArray  *link;
@property NSArray  *routePoints;

@end
