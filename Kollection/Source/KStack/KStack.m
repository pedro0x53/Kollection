//
//  KStack.m
//  Apex
//
//  Created by Pedro Sousa on 22/07/21.
//

#import <Foundation/Foundation.h>
#import "KStack.h"

NS_ASSUME_NONNULL_BEGIN

@interface KStack()

@property (nonatomic, strong) NSMutableArray<id> * stack;
@property (readwrite, assign) NSInteger count;
@property (readwrite, assign) BOOL isEmpty;

@end

@implementation KStack

- (instancetype) init {
    self = [super init];
    
    if (self) {
        self.isEmpty = YES;
        self.count = 0;
        self.stack = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSString *) description {
    NSString * string = @"[";
    NSString * joined = [self.stack componentsJoinedByString: @", "];
    string = [string stringByAppendingString: [joined stringByAppendingString: @"]"]];
    return string;
}

- (void) append: (id) element {
    if (self.count == 0) {
        self.isEmpty = NO;
    }

    [self.stack insertObject: element atIndex: 0];
    self.count++;
}

- (void) appendElementsOfArray: (NSArray<id> *)  array {
    if (self.count == 0) {
        self.isEmpty = NO;
    }

    for (id value in array) {
        [self.stack insertObject: value atIndex: 0];
        self.count++;
    }
}

- (nullable id) remove {
    if (self.count == 0) {
        return nil;
    } else {
        id element = self.stack[0];
        [self.stack removeObjectAtIndex: 0];

        self.count--;
        if (self.count == 0) { self.isEmpty = YES; }

        return element;
    }
}

- (NSInteger) firstIndexOf: (id) element {
    for (int i = 0; i < self.count; i++) {
        if (self.stack[i] == element) {
            return i;
        }
    }
    return -1;
}

@end

NS_ASSUME_NONNULL_END
