//
//  KLinkedList.m
//  objcWoow
//
//  Created by David Augusto on 26/07/21.
//

#import <Foundation/Foundation.h>
#import "KLinkedList.h"

@interface KLinkedList()
@property (readwrite, assign) BOOL isEmpty;
@property (readwrite, assign) NSInteger count;

@end

@implementation KLinkedList

- (instancetype)init
{
    self = [super init];
    if (self) {
        _head = nil;
        _tail = nil;
    }
    return self;
}

- (void)append: (id)value {
    if (self.head == nil) {
        self.head = [[KNode alloc] init];
        self.head.value = value;
        self.tail = self.head;
        self.count++;
    } else {
        KNode *newNode = [[KNode alloc] init];
        newNode.value = value;
        if (self.head.next == nil) {
            self.head.next = newNode;
        } else {
            self.tail.next = newNode;
        }
        self.tail = newNode;
        self.count++;
    }
    if (self.isEmpty == YES) {
        self.isEmpty = NO;
    }
}

- (void)appendFirst: (id)value {
    if (self.head == nil) {
        [self append:value];
    } else {
        KNode *newNode = [[KNode alloc] init];
        newNode.value = value;
        newNode.next = self.head;
        self.head = newNode;
        self.count++;
        if (self.isEmpty == YES) {
            self.isEmpty = NO;
        }
    }
}

- (void)appendAtIndex:(NSInteger)index withValue:(id)value {
    if (index > self.count-1) {
        NSLog(@"Index out of bounds.");
        return;
    }
    KNode *node = self.head;
    if (index == 0) {
        [self appendFirst:value];
        return;
    }
    for (int i=1; i < index; i++) {
        node = node.next;
    }
    KNode *newNode = [[KNode alloc] init];
    newNode.value = value;
    newNode.next = node.next;
    node.next = newNode;
    self.count++;
    if (self.isEmpty == YES) {
        self.isEmpty = NO;
    }
}

- (void)appendElementsOfArray:(NSArray *)array {
    
    for (id element in array) {
        [self append: element];
    }
    
}

- (id)removeFirst {
    KNode *node = self.head.next;
    self.head = node;
    self.count--;
    if(self.count == 0){
        self.isEmpty = YES;
    }
    return node;
}

- (id)removeLast {
    if(self.count <= 0) {
        return nil;
    }
    KNode *node = self.head;
    do {
        node = node.next;
    } while (node.next.next != nil);
    node.next = nil;
    self.tail = node;
    self.count--;
    if(self.count <= 0){
        self.isEmpty = YES;
    }
    return node;
}

- (id)removeAtIndex:(NSInteger)index {
    if (self.count == 0) { return nil; }

        if (self.count - 1 < index) {
            NSLog(@"Index out of bounds.");
            return nil;
        } else if (index == 1) {
            return [self removeFirst];
        }  else if (index == self.count - 1) {
            return [self removeLast];
        }

        KNode * tmp = self.head;

        for (int i = 0; i < index-1; i++) {
            tmp = tmp.next;
        }

        KNode * removed = tmp.next;
        tmp.next = removed.next;
        
        removed.next = nil;

        self.count--;

        if (self.count == 0) { self.isEmpty = YES; }

        return removed.value;

}



- (NSInteger)firstIndexOf: (id)value {
    KNode *node = self.head;
    for (int i=0; i > self.count; i++) {
        if (value == node.value) {
            return i;
        }
        node = node.next;
    }
    return -1;
}


- (NSString *)description {
    KNode *node = self.head;
    NSString *description = @"[";
    while (node.next != nil) {
        description = [description stringByAppendingString: [[node.value description] stringByAppendingString: @", "]];
        node = node.next;
    }
    description = [description stringByAppendingString: [[node.value description] stringByAppendingString: @"]"]];
    return description;
}

@end
