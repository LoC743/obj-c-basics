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
    self.gridView = [[UIView alloc] initWithFrame:CGRectMake(0, HALF_SCREEN_HEIGHT - 2, SCREEN_WIDTH, 4)];
    self.gridView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:self.gridView];
}

- (void)setupTopRacket {
    self.racketTop = [[UIImageView alloc] initWithFrame:CGRectMake(30, 40, 90, 60)];
    self.racketTop.image = [UIImage imageNamed:@"racketTop"];
    self.racketTop.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.racketTop];
}

- (void)setupBottomRacket {
    self.racketBottom = [[UIImageView alloc] initWithFrame:CGRectMake(30, SCREEN_HEIGHT - 90, 90, 60)];
    self.racketBottom.image = [UIImage imageNamed:@"racketBottom"];
    self.racketBottom.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.racketBottom];
}

- (void)setupBall {
    self.ball = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 10, self.view.center.y - 10, 20, 20)];
    self.ball.backgroundColor = [UIColor whiteColor];
    self.ball.layer.cornerRadius = 10;
    self.ball.hidden = YES;
    [self.view addSubview:self.ball];
}

- (void)setupScoreTop {
    self.scoreTop = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, HALF_SCREEN_HEIGHT - 70, 50, 50)];
    self.scoreTop.textColor = [UIColor whiteColor];
    self.scoreTop.text = @"0";
    self.scoreTop.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    self.scoreTop.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.scoreTop];
}

- (void)setupScoreBottom {
    self.scoreBottom = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, HALF_SCREEN_HEIGHT + 70, 50, 50)];
    _scoreBottom.textColor = [UIColor whiteColor];
    self.scoreBottom.text = @"0";
    self.scoreBottom.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    self.scoreBottom.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.scoreBottom];
}

@end
