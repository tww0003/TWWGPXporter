//
//  TWWGPXFile.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPXMetadata.h"


/** gpxType - http://www.topografix.com/GPX/1/1/#type_gpxType
 *
 *   GPX documents contain a metadata header, followed by waypoints, routes, and tracks.
 *   You can add your own elements to the extensions section of the GPX document.
 *
 */
@interface TWWGPXFile : NSObject

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

@end
