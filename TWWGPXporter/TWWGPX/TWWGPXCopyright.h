//
//  TWWGPXCopyright.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPX.h"

/**  copyrightType - http://www.topografix.com/GPX/1/1/#type_copyrightType
 *
 *   Information about the copyright holder and any license governing use of this file.
 *   By linking to an appropriate license, you may place your data into the public domain
 *   or grant additional usage rights.
 *
 */

@interface TWWGPXCopyright : TWWGPX

/** Copyright holder (TopoSoft, Inc.)
 */
@property NSString *author;

/** Year of copyright.
 */
@property NSNumber *year;

/** Link to external file containing license text.
 */
@property NSURL *license;

- (id) initWithAuthor:(NSString *) author;
- (id) initWithAuthor:(NSString *) author andYear:(NSNumber *) year;
- (id) initWithAuthor:(NSString *) author year:(NSNumber *) year andLicense:(NSURL *) license;

@end
