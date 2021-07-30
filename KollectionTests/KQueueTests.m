//
//  KQueueTests.m
//  KollectionTests
//
//  Created by David Augusto on 29/07/21.
//

#import <XCTest/XCTest.h>
#import "Kollection/KQueue.h"

@interface KQueueTests : XCTestCase
@property (nonatomic) KQueue *kqueueToTest;
@end

@implementation KQueueTests

- (void)setUp {
    [super setUp];
    self.kqueueToTest = [[KQueue alloc] init];
}

- (void)testInitEmpty {
    XCTAssertTrue(self.kqueueToTest.isEmpty);
    XCTAssertEqual(self.kqueueToTest.count, 0);
}

- (void)testAppend {
    [self.kqueueToTest append: @1];
    
    XCTAssertFalse(self.kqueueToTest.isEmpty);
    XCTAssertEqual(self.kqueueToTest.count, 1);
}

- (void)testAppendElementsOfArray {
    NSArray<NSNumber *> *array = @[@1, @2, @3];
    
    [self.kqueueToTest appendElementsOfArray: array];
    
    XCTAssertEqual(self.kqueueToTest.count, 3);
}

- (void)testRemove {
    NSArray<NSNumber *> *array = @[@1, @2, @3];
    [self.kqueueToTest appendElementsOfArray: array];
    
    NSNumber *removed = [self.kqueueToTest remove];
    
    XCTAssertEqual(self.kqueueToTest.count, 2);
    XCTAssertEqual(removed, @1);
    
}

- (void)testRemoveKKK {
    NSArray<NSNumber *> *array = @[@1];
    [self.kqueueToTest appendElementsOfArray: array];
    
    [self.kqueueToTest remove];
    
    XCTAssertEqual(self.kqueueToTest.count, 0);
    XCTAssertTrue(self.kqueueToTest.isEmpty);
    
}

- (void)testRemoveNil {
    NSNumber *removed = [self.kqueueToTest remove];
    
    XCTAssertEqual(self.kqueueToTest.count, 0);
    XCTAssertNil(removed);
}

- (void)testFirstIndexOfElementExistent {
    NSArray<NSNumber *> *array = @[@1, @2, @3];
    [self.kqueueToTest appendElementsOfArray: array];
    
    NSInteger index = [self.kqueueToTest firstIndexOf: @3];
    
    XCTAssertEqual(index, 2);
}

- (void)testFirstIndexOfElementNotExistent {
    NSArray<NSNumber *> *array = @[@1, @2, @3];
    [self.kqueueToTest appendElementsOfArray: array];
    
    NSInteger index = [self.kqueueToTest firstIndexOf: @25];
    
    XCTAssertEqual(index, -1);
}


- (void)testDescription {
    NSArray<NSNumber *> *array = @[@1, @2, @3];
    [self.kqueueToTest appendElementsOfArray: array];
    
    NSString *string = [self.kqueueToTest description];
    NSString *valor = @"[1, 2, 3]";
    
    XCTAssertTrue([string isEqual:valor]);
}


@end
