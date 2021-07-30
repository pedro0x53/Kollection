//
//  KStackTest.m
//  KollectionTests
//
//  Created by Pedro Sousa on 29/07/21.
//

#import <XCTest/XCTest.h>
#import "Kollection/KStack.h"

@interface KStackTest : XCTestCase

@property KStack<NSNumber *> * stack;

@end

@implementation KStackTest

- (void) setUp {
    self.stack = [[KStack alloc] init];
}

- (void) testInitEmpty {
    XCTAssertTrue(self.stack.isEmpty);
    XCTAssertEqual(self.stack.count, 0);
}

- (void) testAppend {
    [self.stack append: @1];

    XCTAssertFalse(self.stack.isEmpty);
    XCTAssertEqual(self.stack.count, 1);
}

- (void) testAppendElementOfArray {
    NSArray<NSNumber *> * array = @[@1, @2, @3];

    [self.stack appendElementsOfArray: array];

    XCTAssertEqual(self.stack.count, 3);
}

- (void) testRemove {
    NSArray<NSNumber *> * array = @[@1, @2, @3];
    [self.stack appendElementsOfArray: array];

    NSNumber * removed = [self.stack remove];

    XCTAssertEqual(self.stack.count, 2);
    XCTAssertEqual(removed, @3);
}

- (void) testRemoveNil {
    NSNumber * removed = [self.stack remove];

    XCTAssertNil(removed);
}

- (void) testFirstIndexOfElementExistentElement {
    NSArray<NSNumber *> * array = @[@1, @2, @3];
    [self.stack appendElementsOfArray: array];

    NSInteger index = [self.stack firstIndexOf: @2];

    XCTAssertEqual(index, 1);
}

- (void) testFirstIndexOfElementNonExistentElement {
    NSArray<NSNumber *> * array = @[@1, @2, @3];
    [self.stack appendElementsOfArray: array];

    NSInteger index = [self.stack firstIndexOf: @10];

    XCTAssertEqual(index, -1);
}

- (void) testDescription {
    NSArray<NSNumber *> * array = @[@1, @2, @3];
    [self.stack appendElementsOfArray: array];
    
    NSString * description = [self.stack description];
    
    XCTAssertTrue([description isEqual: @"[3, 2, 1]"]);
}

@end
