//
//  KDoubleNode.m
//  Apex
//
//  Created by Pedro Sousa on 26/07/21.
//

#import <Foundation/Foundation.h>
#import "KDoubleNode.h"

NS_ASSUME_NONNULL_BEGIN

@implementation KDoubleNode

- (instancetype) initWithValue: (id) value {
    self = [super init];
    self.next = nil;
    self.previous = nil;
    self.value = value;

    return self;
}

@end

NS_ASSUME_NONNULL_END
