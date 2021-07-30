# Kollection

A framework that provides some data structures to use on your project.
The available structures are: Queue, Stack, Linked List and Doubly Linked List.

## Functions and Attributes

### Common

Every data structure has a set of common functions:

* append
* appendElementsOfArray
* remove
* firstIndexOf

and attributes:

* isEmpty
* count


### Specific

Linked List and Doubly Linked List have extra functions:

* appendFirst
* appendAtIndex
* removeFirst
* removeLast
* removeAtIndex

and attributes:

* head
* tail


### Example

```objective-c
KStack<NSNumber *> * stack = [[KStack alloc] init];
NSLog(stack.isEmpty ? @"YES" : @"NO");

[stack append: @1];
[stack append: @2];
[stack append: @3];

NSLog(@"%@", stack);

NSLog(stack.isEmpty ? @"YES" : @"NO");

NSNumber * n = [stack remove];
NSLog(@"%@", n);
NSLog(@"%@", stack);

NSInteger index = [stack firstIndexOf: @1];
if (index == -1) {
    NSLog(@"Element not found.");
} else {
    NSLog(@"%ld", index);
}
```

## Installation

Kollection is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Kollection'
```

## Author

[pedro0x53](https://github.com/pedro0x53), [daviaugusto222](https://github.com/daviaugusto222)

## License

Kollection is available under the MIT license. See the LICENSE file for more info.
