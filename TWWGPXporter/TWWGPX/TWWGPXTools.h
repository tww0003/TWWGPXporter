//
//  TWWGPXTools.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 3/21/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapkit/MapKit.h>
#import "TWWGPX.h"
#import "TWWGPXFile.h"

@interface TWWGPXTools : NSObject
+ (NSData *) dataFromFileName:(NSString *) name andType:(NSString *) type;
+ (NSData *) dataWithNewLinesStrippedFromFileName:(NSString *) name andType:(NSString *) type;
+ (void) zoomToPolyLine:(MKMapView *) mapView polyline:(MKPolyline*)polyline animated:(BOOL) animated;
+ (NSString *) saveGPXFile:(TWWGPXFile *) file withName:(NSString *) name;
@end
