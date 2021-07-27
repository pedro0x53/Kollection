//
//  KDoubleNode.h
//  Apex
//
//  Created by Pedro Sousa on 26/07/21.
//

#ifndef KDoubleNode_h
#define KDoubleNode_h

NS_ASSUME_NONNULL_BEGIN

@interface KDoubleNode<ObjectType> : NSObject

@property (nullable, nonatomic, readwrite, strong) KDoubleNode<ObjectType> * next;
@property (nullable, nonatomic, readwrite, strong) KDoubleNode<ObjectType> * previous;

@property (nonatomic, copy) ObjectType value;

- (instancetype) initWithValue: (ObjectType) value;

@end

NS_ASSUME_NONNULL_END

#endif /* KDoubleNode_h */
