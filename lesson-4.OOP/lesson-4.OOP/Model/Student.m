//
//  Student.m
//  lesson-4.OOP
//
//  Created by Alexey on 11.04.2021.
//

#import "Student.h"

@interface Student ()

@property (nonatomic, readwrite) NSInteger age;
@end


@implementation Student

- (instancetype)initWithName: (NSString *)name withSurname: (NSString *)surname
                     withAge: (NSInteger)age {
    self = [super init];
    if (self) {
        self.name = name;
        self.surname = surname;
        self.age = age;
    }
    return self;
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

- (void) incrementAge {
    ++self.age;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"\n[Student]\nname: %@\nsurname: %@\nage: %ld",
            self.name, self.surname, self.age];
}

- (void)dealloc {
    NSLog(@"Student deallocated");
}

@end
