//
//  TWWGPXPoint.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWWGPXPoint : NSObject

@property NSNumber *latitude;
@property NSNumber *longitude;
@property NSNumber *elevation;
@property NSDate   *time;
@property NSNumber *magneticVariation;
@property NSNumber *geoidHeight;
@property NSString *name;
@property NSString *comment;
@property NSString *desc;
@property NSString *source;
@property NSArray  *link;
@property NSString *symbol;
@property NSString *fix;
@property NSNumber *satellite;
@property NSNumber *horizontalDilution;
@property NSNumber *verticalDilution;
@property NSNumber *positionDilution;
@property NSNumber *secondsSinceLastDGPSUpdate;
@property NSString *DGPSStationID;

@end


