//
//  Bird.h
//  lesson-5.FlockOfBirds
//
//  Created by Алексей Морозов on 15.04.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Bird : NSObject

@property (nonatomic, strong) NSString *name;
- (instancetype) initWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
