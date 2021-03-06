//
//  TWWGPXBounds.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPX.h"

/** boundsType - http://www.topografix.com/GPX/1/1/#type_boundsType
 *
 *  Two lat/lon pairs defining the extent of an element.
 *
 */

NS_ASSUME_NONNULL_BEGIN

@interface TWWGPXBounds : TWWGPX

/** The minimum latitude.
 */
@property NSNumber *minLat;

/** The minimum longitude.
 */
@property NSNumber *minLon;

/** The maximum latitude.
 */
@property NSNumber *maxLat;

/** The maximum longitude.
 */
@property NSNumber *maxLon;

NS_ASSUME_NONNULL_END

@end
