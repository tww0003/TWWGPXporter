//
//  TWWGPXTools.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 3/21/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXTools.h"

@implementation TWWGPXTools

// Get NSData of GPX file
+ (NSData *) dataFromFileName:(NSString *) name andType:(NSString *) type {
    return [[NSMutableData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:type]];
}

// Strings new line character before creating NSData
+ (NSData *) dataWithNewLinesStrippedFromFileName:(NSString *) name andType:(NSString *) type {
    NSString *gpxPath = [[NSBundle mainBundle] pathForResource:name ofType:type];
    NSString *gpxString = [NSString stringWithContentsOfFile:gpxPath encoding:NSUTF8StringEncoding error:nil];
    gpxString = [gpxString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return [gpxString dataUsingEncoding:NSUTF8StringEncoding];
}


// Thanks! https://stackoverflow.com/a/19042141/4102523
+ (void) zoomToPolyLine:(MKMapView *) mapView polyline:(MKPolyline*)polyline animated:(BOOL) animated {
    [mapView setVisibleMapRect:[polyline boundingMapRect] edgePadding:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0) animated:animated];
}

+ (NSString *) saveGPXFile:(TWWGPXFile *) file withName:(NSString *) name {
    // This will save the data to a file. Not really useful yet but will be added to the TWWGPXFile eventually
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents directory
    NSLog(@"%@", documentsDirectory);
    NSError *error;
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:name];
    BOOL succeed = [[file toXMLString] writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (!succeed){
       // do something if the save fails
    }
    return filePath;
}

+ (float) milesToMeters:(float) miles {
    return miles * 1609.344;
}

+ (float) metersToMiles:(float) meters {
    return meters / 1609.344;
}

+ (float) metersToFeet:(float) meters {
    return [TWWGPXTools metersToMiles:meters] * 5280;
}

@end
