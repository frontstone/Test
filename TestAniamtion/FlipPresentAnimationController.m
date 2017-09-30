//
//  FlipPresentAnimationController.m
//  TestAniamtion
//
//  Created by frontstone on 2017/9/29.
//  Copyright © 2017年 zhenlee. All rights reserved.
//

#import "FlipPresentAnimationController.h"

#import "AnimationHelper.h"

@implementation FlipPresentAnimationController 

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 2.0;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect initialFrame = self.originRect;
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    
    UIView *snapshot = [toVC.view snapshotViewAfterScreenUpdates:YES];
    snapshot.frame = initialFrame;
    snapshot.layer.cornerRadius = 25;
    snapshot.layer.masksToBounds = YES;
    snapshot.backgroundColor = [UIColor blueColor];
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapshot];
    toVC.view.hidden = YES;
   
    snapshot.layer.transform = CATransform3DMakeRotation(0, 0, 0, 0);

    CGFloat duration = [self transitionDuration:transitionContext];
    [UIView animateKeyframesWithDuration:duration delay:0 options:(UIViewKeyframeAnimationOptionCalculationModeLinear) animations:^{
        fromVC.view.layer.transform = CATransform3DIdentity;
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1/2.0 animations:^{
            fromVC.view.layer.transform = CATransform3DMakeRotation(-M_PI_2, 0, 1, 0);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:1/2.0  relativeDuration:1/2.0 animations:^{
            snapshot.frame = finalFrame;
        }];
        
    } completion:^(BOOL finished) {
        fromVC.view.layer.transform = CATransform3DIdentity;
        fromVC.view.layer.transform = CATransform3DMakeRotation(0, 0, 0, 0);
        toVC.view.hidden = NO;
        toVC.view.frame = finalFrame;
        [snapshot removeFromSuperview];
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
//    AnimationHelper.perspectiveTransformForContainerView(containerView)
//    snapshot.layer.transform = AnimationHelper.yRotation(M_PI_2)
}



@end
