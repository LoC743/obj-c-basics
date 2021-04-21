//
//  Bird.m
//  lesson-5.FlockOfBirds
//
//  Created by Алексей Морозов on 15.04.2021.
//

#import "Bird.h"

@implementation Bird

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        [name retain];
        [name release];
        self.name = name;
        NSLog(@"Bird name - %@", name);
    }
    return  self;
}

- (void)dealloc {
    NSLog(@"Dealloc Bird - %@", self.name);
    [self.name retain];
    [self.name release];
    [super dealloc];
}

@end
