//
//  ViewController.m
//  Calculator
//
//  Created by Alexey on 21.03.2021.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonCollection;
@end

@implementation ViewController

// MARK: - Operation list
typedef enum Operations: NSUInteger {
    addition,
    subtraction,
    multiplication,
    division,
    none
} Operations;

Operations currentOperation = none;
CGFloat lastValue = 0;
BOOL isNewValueStarts = NO;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MARK: - Setup buttons style
    for (UIButton *button in _buttonCollection) {
        button.layer.cornerRadius = button.frame.size.height/2;
        button.layer.masksToBounds = YES;
    }
}

- (IBAction)numberButtonTapped:(UIButton *)sender {
    if ([_resultLabel.text  isEqual: @"0"] ||
        isNewValueStarts) {
        _resultLabel.text = sender.titleLabel.text;
        isNewValueStarts = NO;
    } else {
        _resultLabel.text = [_resultLabel.text stringByAppendingString:sender.titleLabel.text];
    }
}

// MARK: - Clear result label
- (IBAction)clearButtonTapped:(UIButton *)sender {
    _resultLabel.text = @"0";
    lastValue = 0;
}

// MARK: - Operation Actions

- (IBAction)operationButtonTapped:(UIButton *)sender {
    isNewValueStarts = YES;
    lastValue = [_resultLabel.text floatValue];
    
    if ([sender.titleLabel.text isEqual: @"+"]) {
        currentOperation = addition;
    } else if ([sender.titleLabel.text isEqual: @"-"]) {
        currentOperation = subtraction;
    } else if ([sender.titleLabel.text isEqual: @"×"]) {
        currentOperation = multiplication;
    } else if ([sender.titleLabel.text isEqual: @"÷"]) {
        currentOperation = division;
    } else {
        currentOperation = none;
    }
}

// MARK: - Handle operations

- (void) handleAddition {
    CGFloat resultValue = lastValue + [_resultLabel.text floatValue];
    _resultLabel.text = [NSString stringWithFormat: @"%g", resultValue];
}

- (void) handleStutraction {
    CGFloat resultValue = lastValue - [_resultLabel.text floatValue];
    _resultLabel.text = [NSString stringWithFormat: @"%g", resultValue];
}

- (void) handleMultiplication {
    CGFloat resultValue = lastValue * [_resultLabel.text floatValue];
    _resultLabel.text = [NSString stringWithFormat: @"%g", resultValue];
}

- (void) handleDivision {
    CGFloat resultValue = lastValue / [_resultLabel.text floatValue];
    _resultLabel.text = [NSString stringWithFormat: @"%g", resultValue];
}

// MARK: - Calcualte
- (IBAction)calculateButtonTapped:(UIButton *)sender {
    switch (currentOperation) {
        case addition:
            [self handleAddition];
            break;
        case subtraction:
            [self handleStutraction];
            break;
        case multiplication:
            [self handleMultiplication];
            break;
        case division:
            [self handleDivision];
            break;
        case none:
            break;
    }
}

@end
