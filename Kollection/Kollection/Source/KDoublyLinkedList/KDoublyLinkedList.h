//
//  KDoublyLinkedList.h
//  Apex
//
//  Created by Pedro Sousa on 26/07/21.
//

#ifndef KDoublyLinkedList_h
#define KDoublyLinkedList_h

#import "KDoubleNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface KDoublyLinkedList<ObjectType> : NSObject
@property (readonly, strong)  KDoubleNode * head;
@property (readonly, strong)  KDoubleNode * tail;

@property (readonly, assign) BOOL isEmpty;
@property (readonly, assign) NSInteger count;

- (void) append: (ObjectType) element;
- (void) appendFirst: (ObjectType) element;
- (void) appendAtIndex: (NSInteger) index element: (ObjectType) element;
- (void) appendElementsOFArray: (NSArray<ObjectType> *)  array;

- (nullable ObjectType) removeLast;
- (nullable ObjectType) removeFirst;
- (nullable ObjectType) removeAtIndex: (NSInteger) index;

- (NSInteger) firstIndexOf: (ObjectType) element;
@end

NS_ASSUME_NONNULL_END

#endif /* KDoublyLinkedList_h */
