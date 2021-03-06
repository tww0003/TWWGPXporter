//
//  TWWGPXPerson.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPXEmail.h"
#import "TWWGPXLink.h"
#import "TWWGPX.h"


/** personType - http://www.topografix.com/GPX/1/1/#type_personType
 *
 *  A person or organization.
 *
 */
@interface TWWGPXPerson : TWWGPX

/** Name of person or organization.
 */
@property NSString *name;

/** Email address.
 */
@property TWWGPXEmail *email;

/** Link to Web site or other external information about person.
 */
@property TWWGPXLink *link;

- (id) initWithName:(NSString *) name;
- (id) initWithName:(NSString *) name andEmail:(TWWGPXEmail *) email;
- (id) initWithName:(NSString *) name email:(TWWGPXEmail *) email andLink:(TWWGPXLink *) link;

- (void) addLink:(TWWGPXLink *) link;

@end
