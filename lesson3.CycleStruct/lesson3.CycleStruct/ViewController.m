//
//  ViewController.m
//  lesson3.CycleStruct
//
//  Created by Alexey on 29.03.2021.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property NSMutableArray *stringArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _stringArray = [[NSMutableArray alloc] init];
//    NSArray *stringArray = @[@"Lorem", @"ipsum", @"dolor", @"sit", @"amet,", @"consectetur", @"adipiscing", @"elit.", @"Vivamus", @"efficitur."];
//    [self printLoop: stringArray];
    [self printStruct];
}

- (IBAction)addToArrayTapped:(id)sender {
    NSString *string = [[self textField] text];
    NSLog(@"%@", _stringArray);
    [_stringArray addObject: string];
    
    [self printLoop: _stringArray];
}

- (void)printLoop:(NSArray *) stringArray {
    
    // MARK: - For in loop
    NSLog(@"[For in loop]");
    for (NSString *string in stringArray) {
        NSLog(@"%@", string);
    }
    
    // MARK: - For loop
    NSLog(@"[For loop]");
    for (NSUInteger i = 0; i < [stringArray count]; ++i) {
        NSString *string = [stringArray objectAtIndex: i];
//        NSString *string = stringArray[i];
        NSLog(@"%@", string);
    }
    
    // MARK: - While loop
    NSLog(@"[While loop]");
    NSUInteger index = 0;
    while (index < [stringArray count]) {
        NSString *string = [stringArray objectAtIndex: index];
//        NSString *string = stringArray[index];
        NSLog(@"%@", string);
        
        ++index;
    }
    
    // MARK: - Do While loop
    NSLog(@"[Do While loop]");
    index = 0;
    do {
        NSString *string = [stringArray objectAtIndex: index];
//        NSString *string = stringArray[index];
        NSLog(@"%@", string);
        
        ++index;
    } while (index < [stringArray count]);
}


// MARK: - struct Human
typedef enum Gender {
    male,
    female,
} Gender;

-(NSString *) genderToString:(Gender) gender {
    switch (gender) {
        case male:
            return @"Male";
        case female:
            return @"Female";
    }
}

struct Human {
    NSString *name;
    NSInteger age;
    Gender gender;
};
typedef struct Human Human;

-(void) printHuman:(Human) human {
    NSLog(@"\n[Human]\nName: %@\nAge: %ld\nGender: %@\n",
          human.name, human.age, [self genderToString: human.gender]);
}

-(void) printStruct {
    Human ivan = { @"Ivan", 25, male };
    Human eva = { @"Eva", 17, female };
    Human johnny = { @"Johnny", 24, male };
    johnny.age = 34;
    
    [self printHuman: ivan];
    [self printHuman: eva];
    [self printHuman: johnny];
}


@end
