//
//  TWWGPXPoint.m
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPXPoint.h"
#import "TWWGPXUtil.h"

@implementation TWWGPXPoint

- (id) initWithLocation:(CLLocation *)location {
    self = [super init];
    
    if(self) {
        _latitude = @(location.coordinate.latitude);
        _longitude = @(location.coordinate.longitude);
        _elevation = @(location.altitude);
        _time = location.timestamp;
        _horizontalDilution = @(location.horizontalAccuracy);
        _verticalDilution = @(location.verticalAccuracy);
    }
    
    return self;
}

- (NSString *) toXMLString {
    NSMutableString *returnString = [NSMutableString stringWithFormat:@"<%@ lat=\"%@\" lon=\"%@\">",_pointType, _latitude, _longitude];
    if(_elevation) {
        [returnString appendFormat:@"<ele>%@</ele>", _elevation];
    }
    
    if(_magneticVariation) {
        [returnString appendFormat:@"<magvar>%@</magvar>", _magneticVariation];
    }
    
    if(_geoidHeight) {
        [returnString appendFormat:@"<geoidheight>%@</geoidheight>", _geoidHeight];
    }
    
    if([TWWGPXUtil isNotEmptyString:self.name]) {
        [returnString appendFormat:@"<name>%@</name>", self.name];
    }
    
    if([TWWGPXUtil isNotEmptyString:self.comment]) {
        [returnString appendFormat:@"<cmt>%@</cmt>", self.comment];
    }

    if([TWWGPXUtil isNotEmptyString:self.desc]) {
        [returnString appendFormat:@"<desc>%@</desc>", self.desc];
    }

    if([TWWGPXUtil isNotEmptyString:_source]) {
        [returnString appendFormat:@"<src>%@</src>", _source];
    }
    
    if([TWWGPXUtil isNotEmptyString:_symbol]) {
        [returnString appendFormat:@"<sym>%@</sym>", _symbol];
    }
    
    if([TWWGPXUtil isNotEmptyString:_type]) {
        [returnString appendFormat:@"<type>%@</type>", _type];
    }

    if([TWWGPXUtil isNotEmptyString:_fix]) {
        [returnString appendFormat:@"<fix>%@</fix>", _fix];
    }

    if(_satellite) {
        [returnString appendFormat:@"<sat>%@</sat>", _satellite];
    }
    
    if(_horizontalDilution) {
        [returnString appendFormat:@"<hdop>%@</hdop>", _horizontalDilution];
    }
    
    if(_verticalDilution) {
        [returnString appendFormat:@"<vdop>%@</vdop>", _verticalDilution];
    }

    if(_positionDilution) {
        [returnString appendFormat:@"<pdop>%@</pdop>", _positionDilution];
    }
    
    if(_secondsSinceLastDGPSUpdate) {
        [returnString appendFormat:@"<ageofdgpsdata>%@</ageofdgpsdata>", _secondsSinceLastDGPSUpdate];
    }
    
    if(_DGPSStationID) {
        [returnString appendFormat:@"<dgpsid>%@</dgpsid>", _DGPSStationID];
    }
    [returnString appendFormat:@"</%@>", _pointType];
    
    return [returnString copy];
}

@end
