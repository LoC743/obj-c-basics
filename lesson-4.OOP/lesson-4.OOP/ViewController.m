//
//  ViewController.m
//  lesson-4.OOP
//
//  Created by Alexey on 11.04.2021.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *surnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@end

@implementation ViewController

- (IBAction)createNewStudentButtonTapped:(id)sender {
    NSString *studentName = [self.nameTextField text];
    NSString *studentSurname = [self.surnameTextField text];
    NSInteger studentAge = [[self.ageTextField text] intValue];
    
    Student *student = [[Student alloc] initWithName:studentName
                                         withSurname:studentSurname
                                             withAge:studentAge];
//    [student incrementAge];
    NSLog(@"FullName: %@", student.fullName);
    
    NSLog(@"%@", student);
}


@end
