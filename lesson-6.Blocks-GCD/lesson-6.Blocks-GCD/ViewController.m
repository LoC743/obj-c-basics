//
//  ViewController.m
//  lesson-6.Blocks-GCD
//
//  Created by Alexey on 18.04.2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self gcd];
}

- (void) gcd {
    NSUInteger size = 10;
    
    dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);

    dispatch_async(queue, ^{
        NSArray *bubbleArray = generateArray(size);
        NSLog(@"[Bubble Array]: %@", bubbleArray);
        NSLog(@"[Bubble sort]: %@", bubbleSort(bubbleArray));
    });
    
    dispatch_async(queue, ^{
        NSArray *shakerArray = generateArray(size);
        NSLog(@"[Shaker Array]: %@", shakerArray);
        NSLog(@"[Shaker sort]: %@", shakerSort(shakerArray));
    });
    
    dispatch_async(queue, ^{
        NSArray *selectionArray = generateArray(size);
        NSLog(@"[Selection Array]: %@", selectionArray);
        NSLog(@"[Selection sort]: %@", selectionSort(selectionArray));
    });
    
    dispatch_async(queue, ^{
        NSArray *gnomeArray = generateArray(size);
        NSLog(@"[Gnome Array]: %@", gnomeArray);
        NSLog(@"[Gnome sort]: %@", gnomeSort(gnomeArray));
    });
}

NSArray *(^generateArray)(NSUInteger size) = ^NSMutableArray *(NSUInteger size) {
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < size; i++)
        [array addObject: [NSNumber numberWithInt: arc4random() % 100]];
    
    return [array copy];
};


NSArray *(^bubbleSort)(NSArray *array) = ^NSArray *(NSArray *array) {
    NSInteger length = array.count;
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:array];
    
    for (NSInteger i = 0; i + 1 < length; ++i) {
        for (NSInteger j = 0; j + 1 < length - i; ++j) {
            if ([result[j + 1] intValue] < [result[j] intValue]) {
                [result exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
    }
    
    return [result copy];
};

NSArray *(^shakerSort)(NSArray *array) = ^NSArray *(NSArray *array) {
    NSInteger left = 0;
    NSInteger right = [array count] - 1;
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:array];
    
    while(left <= right) {
        for (NSInteger i = right; i > left; --i) {
            if ([result[i - 1] intValue] > [result[i] intValue]) {
                [result exchangeObjectAtIndex:i - 1 withObjectAtIndex:i];
            }
        }
        ++left;
        for (NSInteger i = left; i < right; ++i) {
            if ([result[i] intValue] > [result[i + 1] intValue]) {
                [result exchangeObjectAtIndex:i withObjectAtIndex:i + 1];
            }
        }
        --right;
    }
    
    return [result copy];
};

NSArray *(^insertionSort)(NSArray *array) = ^NSArray *(NSArray *array) {
    NSInteger length = [array count];
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:array];
    
    for (NSInteger i = 1; i < length; ++i) {
        NSNumber *item = result[i];
        NSInteger j = i;
        
        while (j > 0 && [array[j - 1] intValue] > [item intValue]) {
            result[j] = result[j - 1];
            --j;
        }
        
        result[j] = item;
    }
    
    return [result copy];
};

NSArray *(^selectionSort)(NSArray *array) = ^NSArray *(NSArray *array) {
    NSInteger length = [array count];
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:array];

    for (NSInteger i = 0; i < length - 1; ++i) {
        NSInteger minIndex = i;
        for (NSInteger j = i + 1; j < length; ++j) {
            if ([result[j] intValue] < [result[minIndex] intValue]) {
                minIndex = j;
            }
        }
        [result exchangeObjectAtIndex:minIndex withObjectAtIndex:i];
    }
    
    return [result copy];
};

NSArray *(^gnomeSort)(NSArray *array) = ^NSArray *(NSArray *array) {
    NSInteger length = [array count];
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray:array];
    NSInteger index = 0;
    
    while (index < length) {
        if (index == 0)
            ++index;
        if ([result[index] intValue] >= [result[index - 1] intValue])
            ++index;
        else {
            [result exchangeObjectAtIndex:index withObjectAtIndex:index - 1];
            --index;
        }
    }
    
    return [result copy];
};

@end
