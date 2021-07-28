//
//  KLinkedList.h
//  objcWoow
//
//  Created by David Augusto on 26/07/21.
//

#ifndef KLinkedList_h
#define KLinkedList_h

#import "KNode.h"
NS_ASSUME_NONNULL_BEGIN

@interface KLinkedList<ObjectType> : NSObject

@property (readwrite, strong) KNode<ObjectType>* head;
@property (readwrite, strong) KNode<ObjectType>* tail;

@property (readonly, assign) BOOL isEmpty;
@property (readonly, assign) NSInteger count;

- (void) append: (ObjectType) value;
- (void) appendFirst: (ObjectType) value;
- (void) appendAtIndex:(NSInteger) index withValue: (ObjectType) value;
- (void) appendElementsOfArray: (NSArray *) array;
- (nullable ObjectType) removeFirst;
- (nullable ObjectType) removeLast;
- (nullable ObjectType) removeAtIndex: (NSInteger) index;
- (NSInteger) firstIndexOf: (ObjectType) value;

@end

NS_ASSUME_NONNULL_END

#endif /* KLinkedList_h */
