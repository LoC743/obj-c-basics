//
//  Flock.h
//  lesson-5.FlockOfBirds
//
//  Created by Алексей Морозов on 15.04.2021.
//

#import <Foundation/Foundation.h>
#import "Bird.h"

NS_ASSUME_NONNULL_BEGIN

@interface Flock : NSObject

- (void)configWithBirds:(NSArray *)birds;

@property (nonatomic, strong) NSArray *birds;

@end

NS_ASSUME_NONNULL_END
