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
- (void)orientationChanged:(NSNotification*)notification;
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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}

- (void)orientationChanged:(NSNotification*)notification {
    switch ([UIDevice currentDevice].orientation) {
        case UIDeviceOrientationFaceUp:
            [self newFortune];
            break;
        default:
            [self fadeFortune];
            break;
    }
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

@end
