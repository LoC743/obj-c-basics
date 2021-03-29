//
//  ViewController.m
//  lesson3.CycleStruct
//
//  Created by Alexey on 29.03.2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loop];
}

- (void)loop {
    NSArray *stringArray = @[@"Lorem", @"ipsum", @"dolor", @"sit", @"amet,", @"consectetur", @"adipiscing", @"elit.", @"Vivamus", @"efficitur."];
    
    // MARK: - For in loop
    for (NSString *string in stringArray) {
        NSLog(@"%@", string);
    }
    
    // MARK: - For loop
    for (NSUInteger i = 0; i < [stringArray count]; ++i) {
        NSString *string = [stringArray objectAtIndex: i];
//        NSString *string = stringArray[i];
        NSLog(@"%@", string);
    }
    
    // MARK: - While loop
    NSUInteger index = 0;
    while (index < [stringArray count]) {
        NSString *string = [stringArray objectAtIndex: index];
//        NSString *string = stringArray[index];
        NSLog(@"%@", string);
        
        ++index;
    }
}


@end
