//
//  GameViewController.m
//  lesson-7.PingPong
//
//  Created by Алексей Морозов on 21.04.2021.
//

#import "GameViewController.h"

@interface GameViewController ()

@property (strong, nonatomic) UIImageView *racketTop;
@property (strong, nonatomic) UIImageView *racketBottom;
@property (strong, nonatomic) UIView *gridView;
@property (strong, nonatomic) UIView *ball;
@property (strong, nonatomic) UITouch *topTouch;
@property (strong, nonatomic) UITouch *bottomTouch;
@property (strong, nonatomic) NSTimer * timer;
@property (nonatomic) float dx;
@property (nonatomic) float dy;
@property (nonatomic) float speed;
@property (strong, nonatomic) UILabel *scoreTop;
@property (strong, nonatomic) UILabel *scoreBottom;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

// MARK: - Setup UI

- (void)setupUI {
    self.view.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:135.0/255.0 blue:191.0/255.0 alpha:1.0];
    
    [self setupGrid];
    [self setupTopRacket];
    [self setupBottomRacket];
    [self setupBall];
    [self setupScoreTop];
    [self setupScoreBottom];
}

- (void)setupGrid {
    _gridView = [[UIView alloc] initWithFrame:CGRectMake(0, HALF_SCREEN_HEIGHT - 2, SCREEN_WIDTH, 4)];
    _gridView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:_gridView];
}

- (void)setupTopRacket {
    _racketTop = [[UIImageView alloc] initWithFrame:CGRectMake(30, 40, 90, 60)];
    _racketTop.image = [UIImage imageNamed:@"racketTop"];
    _racketTop.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_racketTop];
}

- (void)setupBottomRacket {
    _racketBottom = [[UIImageView alloc] initWithFrame:CGRectMake(30, SCREEN_HEIGHT - 90, 90, 60)];
    _racketBottom.image = [UIImage imageNamed:@"racketBottom"];
    _racketBottom.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_racketBottom];
}

- (void)setupBall {
    _ball = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 10, self.view.center.y - 10, 20, 20)];
    _ball.backgroundColor = [UIColor whiteColor];
    _ball.layer.cornerRadius = 10;
    _ball.hidden = YES;
    [self.view addSubview:_ball];
}

- (void)setupScoreTop {
    _scoreTop = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, HALF_SCREEN_HEIGHT - 70, 50, 50)];
    _scoreTop.textColor = [UIColor whiteColor];
    _scoreTop.text = @"0";
    _scoreTop.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    _scoreTop.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_scoreTop];
}

- (void)setupScoreBottom {
    _scoreBottom = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, HALF_SCREEN_HEIGHT + 70, 50, 50)];
    _scoreBottom.textColor = [UIColor whiteColor];
    _scoreBottom.text = @"0";
    _scoreBottom.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    _scoreBottom.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_scoreBottom];
}

@end
