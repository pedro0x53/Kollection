//
//  KNode.m
//  objcWoow
//
//  Created by David Augusto on 26/07/21.
//

#import <Foundation/Foundation.h>
#import "KNode.h"

@implementation KNode

- (instancetype)init
{
    self = [super init];
    if (self) {
        _value = nil;
        _next = nil;
    }
    return self;
}

@end
