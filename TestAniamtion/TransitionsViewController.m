//
//  TransitionsViewController.m
//  TestAniamtion
//
//  Created by frontstone on 2017/9/29.
//  Copyright © 2017年 zhenlee. All rights reserved.
//

#import "TransitionsViewController.h"
#import "PresentViewController.h"

#import "FlipPresentAnimationController.h"
#import "FlipDismissAnimationController.h"


@interface TransitionsViewController ()<UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UIView *transitionsView;

@property (nonatomic, strong) FlipPresentAnimationController *flipDismissAnimationController;
@property (nonatomic, strong) FlipDismissAnimationController *dismiss;
@end

@implementation TransitionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.flipDismissAnimationController = [[FlipPresentAnimationController alloc] init];
    self.dismiss = [[FlipDismissAnimationController alloc] init];
    
    self.transitionsView.layer.masksToBounds = YES;
    self.transitionsView.layer.cornerRadius = 25.f;
    
}

- (IBAction)action:(id)sender {
    PresentViewController *vc = [[PresentViewController alloc] init];
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.flipDismissAnimationController.originRect = self.transitionsView.frame;
    return self.flipDismissAnimationController;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.dismiss.finalFrame = self.transitionsView.frame;
    return self.dismiss;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
