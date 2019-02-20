//
//  TWWGPXTrack.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPXBase.h"
#import "TWWGPXTrackSegment.h"

/** trkType - http://www.topografix.com/GPX/1/1/#type_trkType
 *
 *  trk represents a track - an ordered list of points describing a path.
 *
 */
@interface TWWGPXTrack : TWWGPXBase

/** GPS name of track. (Inherited from TWWGPXBase)
 */
//@property NSString *name;

/** GPS comment for track.
 */
@property NSString *comment;

/** User description of track. (Inherited from TWWGPXBase)
 */
//@property NSString *desc;

/** Source of data. Included to give user some idea of reliability and accuracy of data.
 */
@property NSString *source;

/** Links to external information about track. (Inherited from TWWGPXBase)
 */
//@property NSArray *links;

/** GPS track number.
 */
@property NSNumber *number;

/** Type (classification) of track.
 */
@property NSString *type;

/** A Track Segment holds a list of Track Points which are logically connected in order.
 *  To represent a single GPS track where GPS reception was lost, or the GPS receiver was turned off,
 *  start a new Track Segment for each continuous span of track data.
 */
@property NSArray *trackSegments;


- (id) initWithName:(NSString *) name number:(NSNumber *) number andTrackSegment:(TWWGPXTrackSegment *) segment;
- (id) initWithName:(NSString *) name andTrackSegment:(TWWGPXTrackSegment *) segment;
- (id) initWithTrackSegment:(TWWGPXTrackSegment *) segment;
- (id) initWithName:(NSString *) name number:(NSNumber *) number andTrackSegments:(NSArray *) segments;
- (id) initWithName:(NSString *) name andTrackSegments:(NSArray *) segments;
- (id) initWithTrackSegments:(NSArray *) segments;
- (void) addTrackSegment:(TWWGPXTrackSegment *) segment;

@end
