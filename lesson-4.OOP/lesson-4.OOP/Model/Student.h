//
//  Student.h
//  lesson-4.OOP
//
//  Created by Alexey on 11.04.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *surname;
@property (nonatomic, readonly) NSInteger age;
@property (nonatomic, strong, readonly) NSString *fullName;

- (instancetype)initWithName: (NSString *)name withSurname: (NSString *)surname
                     withAge: (NSInteger)age;

- (void) incrementAge;

@end

NS_ASSUME_NONNULL_END
