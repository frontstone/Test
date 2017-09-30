//
//  FlipDismissAnimationController.m
//  TestAniamtion
//
//  Created by frontstone on 2017/9/29.
//  Copyright © 2017年 zhenlee. All rights reserved.
//

#import "FlipDismissAnimationController.h"

@implementation FlipDismissAnimationController

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 2.6f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 1
    CGRect initialFrame = [transitionContext initialFrameForViewController:fromVC];
    
    // 2
    UIView *snapshot = [fromVC.view snapshotViewAfterScreenUpdates:YES];
    snapshot.layer.cornerRadius = 25;
    snapshot.layer.masksToBounds = true;
    snapshot.backgroundColor = [UIColor yellowColor];
    
    // 3
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapshot];
    fromVC.view.hidden = YES;
    
    //4
    toVC.view.layer.transform = CATransform3DIdentity;
    toVC.view.layer.transform = CATransform3DMakeRotation(-M_PI_2, 0, 1, 0);
    
    [UIView animateKeyframesWithDuration:6.f delay:0 options:(UIViewKeyframeAnimationOptionCalculationModeLinear) animations:^{
        snapshot.layer.transform = CATransform3DIdentity;
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1/3 animations:^{
            snapshot.frame = self.finalFrame;
        }];
        
//
//        [UIView addKeyframeWithRelativeStartTime:1/3 relativeDuration:1/3 animations:^{
//            snapshot.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 1, 0);
//        }];
//        
//        [UIView addKeyframeWithRelativeStartTime:2/3 relativeDuration:1/3 animations:^{
//            toVC.view.layer.transform = CATransform3DMakeRotation(0, 0, 1, 0);
//
//        }];
        
    } completion:^(BOOL finished) {
        
        fromVC.view.hidden = NO;
        [snapshot removeFromSuperview];
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
 
}
@end
