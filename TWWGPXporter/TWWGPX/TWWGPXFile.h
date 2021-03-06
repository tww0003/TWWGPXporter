//
//  TWWGPXFile.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPX.h"
#import "TWWGPXMetadata.h"
#import "TWWGPXRoute.h"
#import "TWWGPXTrack.h"
#import "TWWGPXWaypoint.h"
#import <MapKit/MapKit.h>


/** gpxType - http://www.topografix.com/GPX/1/1/#type_gpxType
 *
 *   GPX documents contain a metadata header, followed by waypoints, routes, and tracks.
 *   You can add your own elements to the extensions section of the GPX document.
 *
 */
@interface TWWGPXFile : TWWGPX

/** You must include the version number in your GPX document.
 */
@property NSString *version;

/** You must include the name or URL of the software that created your GPX document.
 *  This allows others to inform the creator of a GPX instance document that fails to validate.
 */
@property NSString *creator;

/** Metadata about the file.
 */
@property TWWGPXMetadata *metadata;

/** A list of waypoints.
 */
@property NSArray *waypoints;

/** A list of routes.
 */
@property NSArray *routes;

/** A list of tracks.
 */
@property NSArray *tracks;

- (id) initWithCreator:(NSString *) creator;
- (id) initWithMetadata:(TWWGPXMetadata *) metadata;
- (id) initWithWaypoint:(TWWGPXWaypoint *) waypoint;
- (id) initWithWaypoints:(NSArray *) waypoints;
- (id) initWithRoute:(TWWGPXRoute *) route;
- (id) initWithRoutes:(NSArray *) routes;
- (id) initWithTrack:(TWWGPXTrack *) track;
- (id) initWithTracks:(NSArray *) tracks;

- (void) addWayPoint:(TWWGPXWaypoint *) waypoint;
- (void) addTrack:(TWWGPXTrack *) track;
- (void) addRoute:(TWWGPXRoute *) route;

/** Returns a polyline created from all points.
 *  This does not give a damn about multiple track segments and just groups them together.
 *  If the GPX file has more than 1 track segment use getPolylines
 */
- (MKPolyline *) getPolyLine;
- (NSArray *) getPolyLines;
/* Gets annotation for the first point in the GPX file.
   If there are multiple tracks it will select the first track.
 */
- (MKPointAnnotation *) getStartPoint;

/* Gets annotation for the last point in the GPX file.
   If there are multiple tracks it will select the last tracks last point.
 */
- (MKPointAnnotation *) getFinishPoint;

/* Returns total elevation gain for the gpx file in meters.
 */
- (NSNumber *) getElevationGain;

/* Returns total elevation gain for the gpx file in meters.
 */
- (NSNumber *) getElevantionLoss;

/* Returns the highest elevation on the gpx file in meters.
 */
- (NSNumber *) getHighestElevation;

/* Returns the lowest elevation on the gpx file in meters.
 */
- (NSNumber *) getLowestElevation;

/* Returns the TWWGPXPoint of the highest elevation on the gpx file.
 */
- (TWWGPXPoint *) getHighestElevationGPXPoint;

/* Returns the TWWGPXPoint of the lowest elevation on the gpx file.
 */
- (TWWGPXPoint *) getLowestElevationGPXPoint;

/* Returns an MKPointAnnotation of the highest elevation on the gpx file.
 */
- (MKPointAnnotation *) getHighestElevationPoint;

/* Returns an MKPointAnnotation of the lowest elevation on the gpx file.
 */
- (MKPointAnnotation *) getLowestElevationPoint;

/* Returns the total distance in meters. NOTE: this is only for track points.
 */
- (NSNumber *) getTotalDistance;
@end
