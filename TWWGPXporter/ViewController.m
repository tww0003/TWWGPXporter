//
//  ViewController.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "ViewController.h"
#import "TWWGPXFile.h"
#import "TWWGPXTools.h"

@interface ViewController ()
@property MKMapView *mapView;
@property NSArray *locations;
@property TWWGPXParser *parser;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.mapView.delegate = self;
    
    [self.view addSubview:self.mapView];
    __weak ViewController *weakSelf = self;
    _parser = [[TWWGPXParser alloc] initWithData:[TWWGPXTools dataFromFileName:@"Fried_Clay_200k" andType:@"gpx"]];
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

    return nil;
}

- (void) didFinishParsingGPXFile:(TWWGPXFile *) gpxFile {
    [self.mapView addOverlay:[gpxFile getPolyLine]];
    [TWWGPXTools zoomToPolyLine:self.mapView polyline:[gpxFile getPolyLine] animated:YES];
    
    // Show the start of the ride
    [self.mapView addAnnotation:[gpxFile getStartPoint]];
    
    // Show the end of the ride
    [self.mapView addAnnotation:[gpxFile getFinishPoint]];
    
    // Show the highest point
    [self.mapView addAnnotation:[gpxFile getHighestElevationPoint]];
    
    // Show the lowest point
    [self.mapView addAnnotation:[gpxFile getLowestElevationPoint]];
}

@end
