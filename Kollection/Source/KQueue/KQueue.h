//
//  KQueue.h
//  objcWoow
//
//  Created by David Augusto on 23/07/21.
//

#ifndef KQueue_h
#define KQueue_h
NS_ASSUME_NONNULL_BEGIN

@interface KQueue<ObjectType>: NSObject

@property (readonly, assign) BOOL isEmpty;
@property (readonly, assign) NSInteger count;

- (void) append: (ObjectType) value;
- (void) appendElementsOfArray: (NSArray *) array;
- (nullable ObjectType) remove;
- (nullable ObjectType) removeAtIndex: (NSInteger) index;
- (NSInteger) firstIndexOf: (ObjectType) value;

@end

NS_ASSUME_NONNULL_END
#endif /* KQueue_h */
