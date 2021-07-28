//
//  KQueue.m
//  objcWoow
//
//  Created by David Augusto on 23/07/21.
//

#import <Foundation/Foundation.h>
#import "KQueue.h"

@interface KQueue()

@property (nonatomic, readwrite) NSMutableArray<id> *queue;
@property (readwrite, assign) BOOL isEmpty;
@property (readwrite, assign) NSInteger count;

@end

@implementation KQueue

- (instancetype) init {
    self = [super init];
    if (self) {
        _queue = [[NSMutableArray alloc] init];
        _isEmpty = YES;
        _count = 0;
    }
    return self;
}

- (void) append: (id)node {
    [self.queue addObject:node];
    self.count++;
    if (self.isEmpty == YES) {
        self.isEmpty = NO;
    }
}

- (void) appendElementsOfArray: (NSArray *)array {
    for (int i=0; i >= array.count; i++) {
        [self append: array[i]];
        self.count++;
    }
    
    if (self.count > 0) {
        self.isEmpty = NO;
    }
}

- (nullable id) remove {
    if (self.count != 0) {
        id removeItem = self.queue[0];
        [self.queue removeObjectAtIndex: 0];
        self.count--;
        if (self.count == 0) {
            self.isEmpty = YES;
        }
        return removeItem;
    }
    return nil;
}

- (nullable id) removeAtIndex: (NSInteger) index {
    
    if (self.count - 1 < index) {
        return nil;
    }
    id removeItem = self.queue[index];
    [self.queue removeObjectAtIndex: index];
    
    self.count--;
    if (self.count == 0) {
        self.isEmpty = YES;
    }
    
    return removeItem;
}

- (NSString *) description {
    NSString *joined = [_queue componentsJoinedByString:@", "];
    NSString *string = [@"[" stringByAppendingString: [joined stringByAppendingString:@"]"]];
    return string;
}

- (NSInteger) firstIndexOf: (id)value {
    for (int i=0; i < self.count; i++) {
        if (value == _queue[i]) {
            return i;
        }
    }
    return -1;
}

@end
