//
//  TWWGPXRoute.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPXBase.h"
#import "TWWGPXRoutePoint.h"

/** rteType - http://www.topografix.com/GPX/1/1/#type_rteType
 *
 *  rte represents route - an ordered list of waypoints representing a series
 *  of turn points leading to a destination.
 *
 */
@interface TWWGPXRoute : TWWGPXBase

/** GPS name of route.
 *  (Inherited from TWWGPXBase)
 */
//@property NSString *name;

/** GPS comment for route.
 */
@property NSString *comment;

/** Text description of route for user. Not sent to GPS.
 *  (Inherited from TWWGPXBase)
 */
//@property NSString *desc;

/** Source of data. Included to give user some idea of reliability and accuracy of data.
 */
@property NSString *source;

/** Links to external information about the route.
 *  (Inherited from TWWGPXBase)
 */
//@property NSArray *links;

/** GPS route number.
 */
@property NSNumber *number;

/** Type (classification) of route.
 */
@property NSString *type;

/** A list of route points.
 */
@property NSArray *routePoints;

@end
