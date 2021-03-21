//
//  main.m
//  lesson-1.Average
//
//  Created by Alexey on 21.03.2021.
//

#import <Foundation/Foundation.h>

float my_fabs(float value) {
    if (value < 0) {
        return -value;
    } else {
        return value;
    }
}

int main(int argc, const char * argv[]) {
    
    int first;
    int second;
    int third;
    
    printf("Input first number: ");
    scanf("%d", &first);
    
    printf("Input second number: ");
    scanf("%d", &second);
    
    printf("Input third number: ");
    scanf("%d", &third);
    
    NSInteger firstValue = (NSInteger) first;
    NSInteger secondValue = (NSInteger) second;
    NSInteger thirdValue = (NSInteger) third;
    
    NSInteger sum = firstValue + secondValue + thirdValue;
    CGFloat mean = sum / 3;
    
    NSLog(@"Numbers: %ld, %ld, %ld. Arithmetical mean is %g", firstValue, secondValue, thirdValue, mean);
    
    NSInteger avg;
    
    if (my_fabs(firstValue - mean) < my_fabs(secondValue - mean) &&
        my_fabs(firstValue - mean) < my_fabs(thirdValue - mean)) {
        avg = firstValue;
    } else if (my_fabs(secondValue - mean) < my_fabs(firstValue - mean) &&
               my_fabs(secondValue - mean) < my_fabs(thirdValue - mean)) {
        avg = second;
    } else {
        avg = third;
    }
    
    NSLog(@"Average is %ld", avg);
    
    return 0;
}
