//
//  TWWGPXTrackSegment.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPXTrackPoint.h"
#import "TWWGPX.h"

/** trksegType - http://www.topografix.com/GPX/1/1/#type_trksegType
 *
 *  A Track Segment holds a list of Track Points which are logically connected in order.
 *  To represent a single GPS track where GPS reception was lost, or the GPS receiver was turned off,
 *  start a new Track Segment for each continuous span of track data.
 *
 */

@interface TWWGPXTrackSegment : TWWGPX

/** A Track Point holds the coordinates, elevation, timestamp, and metadata for a single point in a track.
 */
@property NSArray *trackPoints;

- (id) initWithTrackPoint:(TWWGPXTrackPoint *) trackPoint;
- (id) initWithTrackPoints:(NSArray *) trackPoints;
- (void) addTrackPoint:(TWWGPXTrackPoint *) trackPoint;

@end
