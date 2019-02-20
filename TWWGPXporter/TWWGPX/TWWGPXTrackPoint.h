//
//  TWWGPXTrackPoint.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPXPoint.h"

/** trkpt - Essentially the as waypoint but these live within track segments.
 *
 *  A Track Point holds the coordinates, elevation, timestamp, and metadata for a single point in a track.
 *
 */

@interface TWWGPXTrackPoint : TWWGPXPoint

@end
