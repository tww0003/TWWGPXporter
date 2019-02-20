//
//  TWWGPXPerson.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPXLink.h"

/** personType - http://www.topografix.com/GPX/1/1/#type_personType
 *
 *  A person or organization.
 *
 */
@interface TWWGPXPerson : NSObject

/** Name of person or organization.
 */
@property NSString *name;

/** Email address.
 */
@property NSString *email;

/** Link to Web site or other external information about person.
 */
@property TWWGPXLink *link;

@end
