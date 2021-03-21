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

- (IBAction)addOperationTapped:(UIButton *)sender {
    currentOperation = addition;
    isNewValueStarts = YES;
    lastValue = [_resultLabel.text floatValue];
}

- (IBAction)subtractionOperationTapped:(UIButton *)sender {
}

- (IBAction)multiplicationOperationTapped:(UIButton *)sender {
}

- (IBAction)divisionOperationTapped:(UIButton *)sender {
}

// MARK: - Handle operations

- (void) handleAddition {
    CGFloat resultValue = lastValue + [_resultLabel.text floatValue];
    _resultLabel.text = [NSString stringWithFormat: @"%f", resultValue];
}

// MARK: - Calcualte
- (IBAction)calculateButtonTapped:(UIButton *)sender {
    switch (currentOperation) {
        case addition:
            [self handleAddition];
            break;
        case subtraction:
            break;
        case multiplication:
            break;
        case division:
            break;
        case none:
            break;
    }
}

@end
