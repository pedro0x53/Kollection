//
//  KDoublyLinkedList.m
//  Apex
//
//  Created by Pedro Sousa on 26/07/21.
//

#import <Foundation/Foundation.h>
#import "KDoublyLinkedList.h"

NS_ASSUME_NONNULL_BEGIN

@interface KDoublyLinkedList()
@property (nullable, readwrite, strong)  KDoubleNode * head;
@property (nullable, readwrite, strong)  KDoubleNode * tail;

@property (readwrite, assign) BOOL isEmpty;
@property (readwrite, assign) NSInteger count;
@end

@implementation KDoublyLinkedList

- (instancetype) init {
    self = [super init];

    self.head = nil;
    self.tail = nil;

    self.count = 0;
    self.isEmpty = YES;

    return self;
}

- (NSString *) description {
    if (self.isEmpty) {
        return @"[]";
    }

    NSString * description = @"[";
    KDoubleNode * node = self.head;
    while (node.next != nil) {
        description = [[description stringByAppendingString: [node.value description]] stringByAppendingString: @", "];
        node = node.next;
    }
    description = [[description stringByAppendingString: [node.value description]] stringByAppendingString: @"]"];

    return description;
}

- (void) append: (id) element {
    if (self.isEmpty) { self.isEmpty = NO; }

    KDoubleNode * node = [[KDoubleNode alloc] initWithValue: element];
    
    if (self.count == 0) {
        self.head = node;
        self.tail = node;
    } else {
        if (self.head.next == nil) {
            self.head.next = node;
        } else {
            self.tail.next = node;
        }
        node.previous = self.tail;
        self.tail = node;
    }
    self.count++;
}

- (void) appendFirst: (id) element {
    if (self.isEmpty) {
        [self append: element];
    } else {
        KDoubleNode * node = [[KDoubleNode alloc] initWithValue: element];
        node.next = self.head;

        self.head.previous = node;
        self.head = node;

        self.count++;
    }
}

- (void) appendAtIndex: (NSInteger) index element: (id) element {
    if (index < 0 || index > self.count - 1) {
        NSException * exception = [NSException exceptionWithName: @"KDoublyLinkedListException (appendAtIndex)"
                                                          reason: @"Index out of bounds."
                                                        userInfo: nil];
        @throw exception;
    }

    KDoubleNode * pointer = self.head;

    for (int i = 0; i < index - 1; i++) {
        pointer = pointer.next;
    }

    KDoubleNode * node = [[KDoubleNode alloc] initWithValue: element];
    node.next = pointer.next;
    node.previous = pointer;
    
    pointer.next.previous = node;

    pointer.next = node;

    self.count++;
}

- (void) appendElementsOfArray: (NSArray<id> *)  array {
    for (id element in array) {
        [self append: element];
    }
}

- (nullable id) removeFirst {
    if (self.count == 0) { return nil; }

    KDoubleNode * oldHead = self.head;
    self.head = oldHead.next;
    self.head.previous = nil;
    self.count--;

    if (self.count == 0) { self.isEmpty = YES; }
    
    return oldHead.value;
}

- (nullable id) removeLast {
    if (self.count == 0) { return nil; }

    KDoubleNode * oldTail = self.tail;
    self.tail = oldTail.previous;
    self.tail.next = nil;
    self.count--;

    if (self.count == 0) { self.isEmpty = YES; }

    return oldTail.value;
}

- (id) removeAtIndex: (NSInteger) index {
    if (index < 0 || index > self.count - 1) {
        NSException * exception = [NSException exceptionWithName: @"KDoublyLinkedListException (removeAtIndex)"
                                                          reason: @"Index out of bounds."
                                                        userInfo: nil];
        @throw exception;
    }

    KDoubleNode * nodeToRemove = self.head;

    int i = 0;
    while (i != index) {
        nodeToRemove = nodeToRemove.next;
        i++;
    }
    
    nodeToRemove.previous.next = nodeToRemove.next;
    nodeToRemove.next.previous = nodeToRemove.previous;
    
    nodeToRemove.next = nil;
    nodeToRemove.previous = nil;

    self.count--;

    if (self.count == 0) { self.isEmpty = YES; }

    return nodeToRemove.value;
    
}

- (NSInteger) firstIndexOf: (id) element {
    if (self.isEmpty) {
        return -1;
    }

    KDoubleNode * node = self.head;
    NSInteger index = 0;
    while (node.value != element) {

        if (node.next == nil) {
            return -1;
        }

        node = node.next;
        index++;
    }

    return index;
}

@end

NS_ASSUME_NONNULL_END
