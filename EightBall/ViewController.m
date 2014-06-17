//
//  ViewController.m
//  EightBall
//
//  Created by Алексей Протасов on 17.06.14.
//  Copyright (c) 2014 Alexey Protasov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)fadeFortune;
- (void)newFortune;
@end

static NSString *gAnswers[] = {
    @"\rYES",
    @"\rNO",
    @"\rMAYBE",
    @"I\rDON'T\rKNOW",
    @"TRY\rAGAIN",
    @"READ\rTHE\rMANUAL"
};

#define kNumberOfAnswers (sizeof(gAnswers)/sizeof(NSString*))

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fadeFortune {
    [UIView animateWithDuration:0.75 animations:^{
        self.answerView.alpha = 0.0;
    }];
}

- (void)newFortune {
    self.answerView.text = gAnswers[arc4random_uniform(kNumberOfAnswers)];
    
    [UIView animateWithDuration:2.0 animations:^{
        self.answerView.alpha = 1.0;
    }];
}

// Motion methods
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [self fadeFortune];
    }
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [self newFortune];
    }
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [self newFortune];
    }
}

@end
