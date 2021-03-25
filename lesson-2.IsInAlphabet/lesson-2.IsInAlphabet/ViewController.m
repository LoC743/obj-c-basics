//
//  ViewController.m
//  lesson-2.IsInAlphabet
//
//  Created by Alexey on 24.03.2021.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *character = @"z";
    
    if ([self isInEnglishAlphabetContains: character]) {
        NSLog(@"[YES]: English alphabet contains letter %@", character);
    } else {
        NSLog(@"[NO]: English alphabet does not contains letter %@", character);
    }
}

-(BOOL) isInEnglishAlphabetContains: (NSString *) character {
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    
    if ([alphabet containsString: character]) {
        return YES;
    } else {
        return NO;
    }
}


@end
