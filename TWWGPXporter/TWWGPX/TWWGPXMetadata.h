//
//  TWWGPXMetadata.h
//  TWWGPXporter
//
//  Created by Tyler Williamson on 2/19/19.
//  Copyright © 2019 Topsoil Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWWGPXBase.h"
#import "TWWGPXBounds.h"
#import "TWWGPXCopyright.h"
#import "TWWGPXPerson.h"


/** metadataType - http://www.topografix.com/GPX/1/1/#type_metadataType
 *
 *  Information about the GPX file, author, and copyright restrictions goes in the metadata section.
 *  Providing rich, meaningful information about your GPX files allows others to search for and use your GPS data.
 *
 */

@interface TWWGPXMetadata : TWWGPXBase

/** The name of the GPX file. (Inherited from TWWGPXBase)
 */
//@property NSString *name;

/** A description of the contents of the GPX file. (Inherited from TWWGPXBase)
 */
//@property NSString *desc;

/** The person or organization who created the GPX file.
 */
@property TWWGPXPerson *author;

/** Copyright and license information governing use of the file.
 */
@property TWWGPXCopyright *copyright;

/** URLs associated with the location described in the file. (Inherited from TWWGPXBase)
 */
//@property NSArray *links;

/** The creation date of the file.
 */
@property NSDate *time;

/** Keywords associated with the file. Search engines or databases can use this information to classify the data.
 */
@property NSArray *keywords;

/** Minimum and maximum coordinates which describe the extent of the coordinates in the file.
 */
@property TWWGPXBounds *bounds;

- (id) initWithAuthor:(TWWGPXPerson *) author;
- (id) initWithAuthor:(TWWGPXPerson *) author andCopyright:(TWWGPXCopyright *) copyright;
- (id) initWithAuthor:(TWWGPXPerson *) author copyright:(TWWGPXCopyright *) copyright andTime:(NSDate *) time;
- (id) initWithAuthor:(TWWGPXPerson *) author copyright:(TWWGPXCopyright *) copyright time:(NSDate *) time andKeywords:(NSArray *)keywords;
- (id) initWithAuthor:(TWWGPXPerson *) author copyright:(TWWGPXCopyright *) copyright time:(NSDate *) time keywords:(NSArray *)keywords andBounds:(TWWGPXBounds *) bounds;
@end
