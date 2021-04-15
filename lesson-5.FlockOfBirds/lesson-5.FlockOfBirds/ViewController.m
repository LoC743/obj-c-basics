//
//  ViewController.m
//  lesson-5.FlockOfBirds
//
//  Created by Алексей Морозов on 15.04.2021.
//

#import "ViewController.h"
#import "Flock.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Flock *flock = [Flock new];
    // Создание первой птицы
    Bird *bird1 = [[Bird alloc] initWithName:@"Eagle 1"];
    // Создание второй птицы
    Bird *bird2 = [[Bird alloc] initWithName:@"Eagle 2"];
    // Создание третьей птицы
    Bird *bird3 = [[Bird alloc] initWithName:@"Eagle 3"];
    
    NSArray *birds = [[NSArray alloc] initWithObjects:bird1,bird2,bird3, nil];
    
    [flock configWithBirds:birds];
    [flock release];

}


@end
