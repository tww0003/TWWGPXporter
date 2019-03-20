## TWWGPXporter

The name sucks, I know.  

This is a work in progress. The idea is to make creating, exporting, and displaying GPX files easy with Objective-C, since I'm too stubborn to learn Swift. 

Currently this project can do the following:  
- Create GPX files
- Parse GPX files (GPXParser isn't fully implemented but it will parse most GPX files just fine. The parser is kind of slow - it takes about 30 seconds to parse a GPX file with ~20k points)
- Draw the GPX file onto a map.

Eventually it'll do more, but for now it's very basic.


Included is an example GPX file that I exported from a ride I uploaded to Strava. The project will display that file on a map for you as an example.


#### Example Code:

Parsing a GPX file and displaying it onto a map:  

1. Import the appropriate files and create a property to hold the TWWGPXParser


#import "TWWGPXParser.h"

@interface ViewController()
@property TWWGPXParser *parser;
@end

1. Create the parser, set the delegate, and begin parsing the file

_parser = [[TWWGPXParser alloc] initWithData:[[NSMutableData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fileName" ofType:@"gpx"]]];  
_parser.delegate = self;  
// You'll want to run this on a background thread  
// Create a weak reference to your class  
__weak ViewController *weakSelf = self;
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
[weakSelf.parser createTWWGPXFile];
});



2. Implement the TWWGPXParser delegate method  


// TWWGPX delegate method
- (void) didFinishParsingGPXFile:(TWWGPXFile *) gpxFile {
[self.mapView addOverlay:[gpxFile getPolyLine]];
// Zooms to the polyline
[self zoomToPolyLine:self.mapView polyline:[gpxFile getPolyLine] animated:YES];
}

// https://stackoverflow.com/a/19042141/4102523
- (void) zoomToPolyLine:(MKMapView *) mapView polyline:(MKPolyline*)polyline animated:(BOOL) animated {
[mapView setVisibleMapRect:[polyline boundingMapRect] edgePadding:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0) animated:animated];
}


3. Implement the MKMapViewDelegate method and render the polyline  


- (MKOverlayRenderer *) mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
if ([overlay isKindOfClass:[MKPolyline class]]) {
MKPolyline *route = overlay;
MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:route];
renderer.strokeColor = [UIColor blueColor];
renderer.lineWidth = 3.0;
return renderer;
}
return nil;
}
