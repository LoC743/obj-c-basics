//
//  Flock.m
//  lesson-5.FlockOfBirds
//
//  Created by Алексей Морозов on 15.04.2021.
//

#import "Flock.h"

@implementation Flock

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Create flock");
    }
    return self;
}

- (void)configWithBirds:(NSArray *)birds {
    [birds retain];
    [birds release];
    _birds = birds;
    
    for (Bird *bird in birds) {
        NSLog(@"Add bird with name %@ into flock", bird.name);
    }
}

- (void)remove {
    NSLog(@"Removing birds from flock.");
    for (Bird *bird in _birds) {
        [bird release];
    }
}

- (void)dealloc {
    [self remove];
    NSLog(@"Dealloc Flock");
    [super dealloc];
}

@end
