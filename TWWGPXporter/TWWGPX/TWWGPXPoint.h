//
//  TWWGPXPoint.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "TWWGPXBase.h"

/** Base point - waypoints, route points and track points are all essentially the same
 */
@interface TWWGPXPoint : TWWGPXBase

/** The latitude of the point. Decimal degrees, WGS84 datum.
 */
@property NSNumber *latitude;

/** The longitude of the point. Decimal degrees, WGS84 datum.
 */
@property NSNumber *longitude;

/** Elevation (in meters) of the point.
 */
@property NSNumber *elevation;

/** Creation/modification timestamp for element. Date and time in are in Univeral Coordinated Time (UTC),
 *  not local time! Conforms to ISO 8601 specification for date/time representation.
 *  Fractional seconds are allowed for millisecond timing in tracklogs.
 */
@property NSDate *time;

/** Magnetic variation (in degrees) at the point
 */
@property NSNumber *magneticVariation;

/** Height (in meters) of geoid (mean sea level) above WGS84 earth ellipsoid. As defined in NMEA GGA message.
 */
@property NSNumber *geoidHeight;

/** The GPS name of the waypoint. This field will be transferred to and from the GPS.
 *  GPX does not place restrictions on the length of this field or the characters contained in it.
 *  It is up to the receiving application to validate the field before sending it to the GPS.
 *  
 *  (Inherited from TWWGPXBase)
 */
//@property NSString *name;

/** GPS point comment. Sent to GPS as comment.
 */
@property NSString *comment;

/** A text description of the element. Holds additional information about the element intended for the user, not the GPS.
 *  (Inherited from TWWGPXBase)
 */
//@property NSString *desc;

/** Source of data. Included to give user some idea of reliability and accuracy of data.
 *  "Garmin eTrex", "USGS quad Boston North", e.g.
 */
@property NSString *source;

/** Link to additional information about the point.
 *  (Inherited from TWWGPXBase)
 */
//@property NSArray *links;

/** Text of GPS symbol name. For interchange with other programs, use the exact spelling of the symbol as displayed on the GPS.
 *  If the GPS abbreviates words, spell them out.
 */
@property NSString *symbol;

/** Type (classification) of the waypoint.
 *  ex: <type>Hiking trail</type>
 */
@property NSString *type;

/** Type of GPX fix.
 */
@property NSString *fix;

/** Number of satellites used to calculate the GPX fix.
 */
@property NSNumber *satellite;

/** Horizontal dilution of precision.
 */
@property NSNumber *horizontalDilution;

/** Vertical dilution of precision.
 */
@property NSNumber *verticalDilution;

/** Position dilution of precision.
 */
@property NSNumber *positionDilution;

/** Number of seconds since last DGPS update.
 */
@property NSNumber *secondsSinceLastDGPSUpdate;

/** ID of DGPS station used in differential correction.
 */
@property NSString *DGPSStationID;

@property NSString *pointType;

- (id) initWithLocation:(CLLocation *) location;

- (CLLocationCoordinate2D) getCoordinate;
- (CLLocation *) getLocation;
@end


