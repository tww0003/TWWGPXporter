//
//  TWWGPXLink.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPX.h"


/** linkType - http://www.topografix.com/GPX/1/1/#type_linkType
 *
 *  A link to an external resource (Web page, digital photo, video clip, etc) with additional information.
 *
 */
@interface TWWGPXLink : TWWGPX


/** URL of hyperlink.
 */
@property NSURL *href;

/** Text of hyperlink.
 */
@property NSString *text;

/** Mime type of content (image/jpeg)
 */
@property NSString *type;

@end
