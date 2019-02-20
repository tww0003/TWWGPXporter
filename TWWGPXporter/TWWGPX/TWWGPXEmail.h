//
//  TWWGPXEmail.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/20/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import "TWWGPX.h"

/** emailType - http://www.topografix.com/GPX/1/1/#type_emailType
 *  An email address. Broken into two parts (id and domain) to help prevent email harvesting.
 */
@interface TWWGPXEmail : TWWGPX

/** id half of email address (billgates2004)
 */
@property NSString *ID;

/** domain half of email address (hotmail.com)
 */
@property NSString *domain;

- (id) initWithEmailAddress:(NSString *) email;
- (id) initWithId:(NSString *) ID andDomain:(NSString *) domain;

@end
