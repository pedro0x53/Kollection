//
//  KDoublyLinkedListTest.m
//  KollectionTests
//
//  Created by Pedro Sousa on 29/07/21.
//

#import <XCTest/XCTest.h>
#import "Kollection/KDoublyLinkedList.h"

@interface KDoublyLinkedListTest : XCTestCase

@property KDoublyLinkedList<NSNumber *> * list;

@end

@implementation KDoublyLinkedListTest

- (void)setUp {
    self.list = [[KDoublyLinkedList alloc] init];
}

- (void) testInitEmpty {
    XCTAssertTrue(self.list.isEmpty);
    XCTAssertEqual(self.list.count, 0);
    XCTAssertNil(self.list.head);
    XCTAssertNil(self.list.tail);
}

- (void) testAppendNotEmpty {
    [self.list append: @1];

    XCTAssertFalse(self.list.isEmpty);
}

- (void) testAppendFirstEmptyList {
    [self.list appendFirst: @1];

    XCTAssertEqual(self.list.count, 1);
    
    XCTAssertNil(self.list.head.next);
    XCTAssertNil(self.list.head.previous);
    XCTAssertEqual(self.list.head.value, @1);
    
    XCTAssertNil(self.list.tail.next);
    XCTAssertNil(self.list.tail.previous);
    XCTAssertEqual(self.list.tail.value, @1);
}

- (void) testAppendFirstNotEmptyList {
    [self.list appendFirst: @1];
    [self.list appendFirst: @2];

    XCTAssertEqual(self.list.count, 2);
    
    XCTAssertEqual(self.list.head.next.value, @1);
    XCTAssertNil(self.list.head.previous);
    XCTAssertEqual(self.list.head.value, @2);
    
    XCTAssertNil(self.list.tail.next);
    XCTAssertEqual(self.list.tail.previous.value, @2);
    XCTAssertEqual(self.list.tail.value, @1);
}

- (void) testAppendFirstElement {
    [self.list append: @1];

    XCTAssertEqual(self.list.count, 1);
    
    XCTAssertNil(self.list.head.next);
    XCTAssertNil(self.list.head.previous);
    XCTAssertEqual(self.list.head.value, @1);
    
    XCTAssertNil(self.list.tail.next);
    XCTAssertNil(self.list.tail.previous);
    XCTAssertEqual(self.list.tail.value, @1);
}

- (void) testAppendSecondElement {
    [self.list append: @1];
    [self.list append: @2];

    XCTAssertEqual(self.list.count, 2);
    
    XCTAssertNil(self.list.head.previous);
    XCTAssertEqual(self.list.head.value, @1);
    XCTAssertEqual(self.list.head.next, self.list.tail);
    
    XCTAssertNil(self.list.tail.next);
    XCTAssertEqual(self.list.tail.value, @2);
    XCTAssertEqual(self.list.tail.previous, self.list.head);
}

- (void) testAppendThirdElement {
    [self.list append: @1];
    [self.list append: @2];
    [self.list append: @3];

    XCTAssertEqual(self.list.count, 3);
    
    XCTAssertNil(self.list.head.previous);
    XCTAssertEqual(self.list.head.value, @1);
    XCTAssertEqual(self.list.head.next.value, @2);
    
    XCTAssertNil(self.list.tail.next);
    XCTAssertEqual(self.list.tail.value, @3);
    XCTAssertEqual(self.list.tail.previous.value, @2);
}

- (void) testAppendElementsOfArray {
    NSArray<NSNumber *> * array = @[@1, @2, @3];

    [self.list appendElementsOfArray: array];

    XCTAssertEqual(self.list.count, 3);
}

- (void) testRemoveFirst {
    NSArray<NSNumber *> * array = @[@1, @2, @3];

    [self.list appendElementsOfArray: array];

    NSNumber * removed = [self.list removeFirst];

    XCTAssertEqual(removed, @1);
    XCTAssertFalse(self.list.isEmpty);
    XCTAssertEqual(self.list.count, 2);
}

- (void) testRemoveFirstAndListGetsEmpty {
    [self.list append: @1];

    NSNumber * removed = [self.list removeFirst];

    XCTAssertEqual(removed, @1);
    XCTAssertTrue(self.list.isEmpty);
}

- (void) testRemoveFirstWhenEmpty {
    NSNumber * removed = [self.list removeFirst];
    XCTAssertNil(removed);
}

- (void) testRemoveLast {
    NSArray<NSNumber *> * array = @[@1, @2, @3];

    [self.list appendElementsOfArray: array];

    NSNumber * removed = [self.list removeLast];

    XCTAssertEqual(removed, @3);
    XCTAssertFalse(self.list.isEmpty);
    XCTAssertEqual(self.list.count, 2);
}

- (void) testRemoveLastWhenEmpty {
    NSNumber * removed = [self.list removeLast];
    XCTAssertNil(removed);
}

- (void) testRemoveAtIndex {
    NSArray<NSNumber *> * array = @[@1, @2, @3];

    [self.list appendElementsOfArray: array];

    NSNumber * removed = [self.list removeAtIndex: 1];

    XCTAssertEqual(removed, @2);
    XCTAssertFalse(self.list.isEmpty);
    XCTAssertEqual(self.list.count, 2);
}

- (void) testAppendAtIndex {
    NSArray<NSNumber *> * array = @[@1, @2, @3];

    [self.list appendElementsOfArray: array];

    [self.list appendAtIndex: 2 element: @4];

    XCTAssertEqual(self.list.count, 4);
    
    NSNumber * removed = [self.list removeAtIndex: 2];
    XCTAssertEqual(removed, @4);
}

- (void) testAppendAtIndexAndThrows {
    XCTAssertThrows([self.list appendAtIndex: 10 element: @4]);
}

- (void) testRemoveAtIndexAndThrows {
    XCTAssertThrows([self.list removeAtIndex: 1]);
}

- (void) testRemoveAtIndexWithIndexOutOfBounds {
    NSArray<NSNumber *> * array = @[@1, @2, @3];

    [self.list appendElementsOfArray: array];
    
    XCTAssertThrows([self.list removeAtIndex: 10]);
}

- (void) testFirstIndexOfElementEmptyList {
    NSInteger index = [self.list firstIndexOf: @2];

    XCTAssertEqual(index, -1);
    
}
- (void) testFirstIndexOfElementExistentElement {
    NSArray<NSNumber *> * array = @[@1, @2, @3];
    [self.list appendElementsOfArray: array];

    NSInteger index = [self.list firstIndexOf: @2];

    XCTAssertEqual(index, 1);
}

- (void) testFirstIndexOfElementNonExistentElement {
    NSArray<NSNumber *> * array = @[@1, @2, @3];
    [self.list appendElementsOfArray: array];

    NSInteger index = [self.list firstIndexOf: @10];

    XCTAssertEqual(index, -1);
}

- (void) testDescription {
    NSArray<NSNumber *> * array = @[@1, @2, @3];
    [self.list appendElementsOfArray: array];
    
    NSString * description = [self.list description];
    
    XCTAssertTrue([description isEqual: @"[1, 2, 3]"]);
}

- (void) testDescriptionEmptyList {
    NSString * description = [self.list description];
    
    XCTAssertTrue([description isEqual: @"[]"]);
}

@end
