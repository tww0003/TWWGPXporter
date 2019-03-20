//
//  ViewController.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "ViewController.h"
#import "TWWGPXFile.h"

@interface ViewController ()
@property MKMapView *mapView;
//@property MKTileOverlayRenderer *renderer;
@property NSArray *locations;
@property TWWGPXParser *parser;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.mapView.delegate = self;
    
    // If you want to use custom map tiles uncomment the following lines
    // along with the MKTileOverlayRenderer property above and the commented out line in
    // mapView:rendererForOverlay:
//    MKTileOverlay *overlay = [[MKTileOverlay alloc] initWithURLTemplate:@"http://<map_tile_server>/tile/{z}/{x}/{y}.png"];
//    overlay.canReplaceMapContent = YES;
//    _renderer = [[MKTileOverlayRenderer alloc] initWithTileOverlay:overlay];
//    [self.mapView addOverlay:overlay level:MKOverlayLevelAboveLabels];
    
    [self.view addSubview:self.mapView];
    __weak ViewController *weakSelf = self;
    _parser = [[TWWGPXParser alloc] initWithData:[self dataFromFileName:@"Skyway_Beer_Run" andType:@"gpx"]];
    _parser.gpxDelegate = self;

    // Parsing the GPX file can take a while depending on how many points the file contains,
    // so we'll hop onto a background thread until it finishes
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [weakSelf.parser createTWWGPXFile];
    });

    
}

- (MKOverlayRenderer *) mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolyline *route = overlay;
        MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:route];
        renderer.strokeColor = [UIColor blueColor];
        renderer.lineWidth = 3.0;
        return renderer;
    }

//    return _renderer;
    return nil;
}

- (void) didFinishParsingGPXFile:(TWWGPXFile *) gpxFile {
    [self.mapView addOverlay:[gpxFile getPolyLine]];
    [self zoomToPolyLine:self.mapView polyline:[gpxFile getPolyLine] animated:YES];
    
    // Show the start of the ride
    MKPointAnnotation *start = [[MKPointAnnotation alloc] init];
    start.coordinate = [[[[gpxFile tracks][0] trackSegments][0] trackPoints][0] getCoordinate];
    start.title = @"Start";
    [self.mapView addAnnotation:start];
    
    // Show the end of the ride
    MKPointAnnotation *finish = [[MKPointAnnotation alloc] init];
    finish.coordinate = [[[[[gpxFile tracks][0] trackSegments][0] trackPoints]lastObject] getCoordinate];
    finish.title = @"Finish";
    [self.mapView addAnnotation:finish];

    
    // This will save the data to a file. Not really useful yet but will be added to the TWWGPXFile eventually
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents directory
//    NSLog(@"%@", documentsDirectory);
//    NSError *error;
//    BOOL succeed = [[gpxFile toXMLString] writeToFile:[documentsDirectory stringByAppendingPathComponent:@"myFile.gpx"] atomically:YES encoding:NSUTF8StringEncoding error:&error];
//    if (!succeed){
//       // do something if the save fails
//    }
//
}

// Get NSData of GPX file
- (NSData *) dataFromFileName:(NSString *) name andType:(NSString *) type {
    return [[NSMutableData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:type]];
}

// Strings new line character before creating NSData
- (NSData *) dataWithNewLinesStrippedFromFileName:(NSString *) name andType:(NSString *) type {
    NSString *gpxPath = [[NSBundle mainBundle] pathForResource:name ofType:type];
    NSString *gpxString = [NSString stringWithContentsOfFile:gpxPath encoding:NSUTF8StringEncoding error:nil];
    gpxString = [gpxString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return [gpxString dataUsingEncoding:NSUTF8StringEncoding];
}


// Thanks! https://stackoverflow.com/a/19042141/4102523
- (void) zoomToPolyLine:(MKMapView *) mapView polyline:(MKPolyline*)polyline animated:(BOOL) animated {
    [mapView setVisibleMapRect:[polyline boundingMapRect] edgePadding:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0) animated:animated];
}


@end
