//
//  KNode.h
//  objcWoow
//
//  Created by David Augusto on 26/07/21.
//

#ifndef KNode_h
#define KNode_h

@interface KNode<ObjectType> : NSObject

@property (readwrite, assign) ObjectType value;
@property (readwrite, strong) KNode<ObjectType>* next;

@end

#endif /* KNode_h */
