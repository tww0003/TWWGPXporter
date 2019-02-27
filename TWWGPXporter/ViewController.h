//
//  ViewController.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Mapkit/MapKit.h>
#import "TWWGPX/TWWGPXParser.h"

@interface ViewController : UIViewController<MKMapViewDelegate, TWWGPXParserDelegate>


@end

