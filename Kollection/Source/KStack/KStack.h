//
//  KStack.h
//  Apex
//
//  Created by Pedro Sousa on 22/07/21.
//

#import <Foundation/Foundation.h>

#ifndef KStack_h
#define KStack_h

NS_ASSUME_NONNULL_BEGIN

@interface KStack<ObjectType> : NSObject
@property (readonly, assign) NSInteger count;
@property (readonly, assign) BOOL isEmpty;

- (void) append: (ObjectType) element;
- (void) appendElementsOfArray: (NSArray<id> *)  array;

- (nullable ObjectType) remove;

- (NSInteger) firstIndexOf: (id) element;
@end

NS_ASSUME_NONNULL_END

#endif /* KStack_h */
