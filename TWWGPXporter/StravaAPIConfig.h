//
//  StravaAPIConfig.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 3/25/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StravaAPIConfig : NSObject

+ (NSString *) getClientId;
+ (NSString *) getClientSecret;

@end
