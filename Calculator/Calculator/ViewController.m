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
    mod,
    intDiv,
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
        _resultLabel.text = [_resultLabel.text stringByAppendingString: sender.titleLabel.text];
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
    } else if ([sender.titleLabel.text isEqual: @"mod"]) {
        currentOperation = mod;
    } else if ([sender.titleLabel.text isEqual: @"div"]) {
        currentOperation = intDiv;
    } else {
        currentOperation = none;
    }
}

// MARK: - Handle operations

- (void) handleAddition {
    CGFloat currentValue = [_resultLabel.text floatValue];
    CGFloat resultValue = lastValue + currentValue;
    _resultLabel.text = [NSString stringWithFormat: @"%g", resultValue];
    NSLog(@"[Addition]: %g + %g = %g", lastValue, currentValue, resultValue);
}

- (void) handleSubtraction {
    CGFloat currentValue = [_resultLabel.text floatValue];
    CGFloat resultValue = lastValue - currentValue;
    _resultLabel.text = [NSString stringWithFormat: @"%g", resultValue];
    NSLog(@"[Subtraction]: %g - %g = %g", lastValue, currentValue, resultValue);
}

- (void) handleMultiplication {
    CGFloat currentValue = [_resultLabel.text floatValue];
    CGFloat resultValue = lastValue * currentValue;
    _resultLabel.text = [NSString stringWithFormat: @"%g", resultValue];
    NSLog(@"[Multiplication]: %g × %g = %g", lastValue, currentValue, resultValue);
}

- (void) handleDivision {
    CGFloat currentValue = [_resultLabel.text floatValue];
    CGFloat resultValue = lastValue / currentValue;
    _resultLabel.text = [NSString stringWithFormat: @"%g", resultValue];
    NSLog(@"[Division]: %g ÷ %g = %g", lastValue, currentValue, resultValue);
}

- (void) handleMod {
    CGFloat currentValue = [_resultLabel.text floatValue];
    CGFloat resultValue = (float)((int)lastValue % (int)currentValue);
    _resultLabel.text = [NSString stringWithFormat: @"%g", resultValue];
    NSLog(@"[Mod]: %g %% %g = %g", lastValue, currentValue, resultValue);
}

- (void) handleDiv {
    CGFloat currentValue = [_resultLabel.text floatValue];
    NSInteger resultValue = lastValue / currentValue;
    _resultLabel.text = [NSString stringWithFormat: @"%ld", (long)resultValue];
    NSLog(@"[Div]: %g // %g = %ld", lastValue, currentValue, (long)resultValue);
}

// MARK: - Calcualte
- (IBAction)calculateButtonTapped:(UIButton *)sender {
    switch (currentOperation) {
        case addition:
            [self handleAddition];
            break;
        case subtraction:
            [self handleSubtraction];
            break;
        case multiplication:
            [self handleMultiplication];
            break;
        case division:
            [self handleDivision];
            break;
        case mod:
            [self handleMod];
            break;
        case intDiv:
            [self handleDiv];
            break;
        case none:
            break;
    }
}

// MARK: (Action) Additional buttons

- (IBAction)plusMinusButtonTapped:(UIButton *)sender {
    if (![_resultLabel.text isEqual: @"0"]) {
        CGFloat value = [_resultLabel.text floatValue];
        value = -value;
        _resultLabel.text = [NSString stringWithFormat: @"%g", value];
    }
}

- (IBAction)commaButtonTapped:(UIButton *)sender {
    NSString *lastChar = [_resultLabel.text substringFromIndex:
                          [_resultLabel.text length] - 1];
    if (![lastChar isEqual: @"."]) {
        _resultLabel.text = [_resultLabel.text stringByAppendingString: @"."];
    }
}

@end
