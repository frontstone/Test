//
//  FlipPresentAnimationController.h
//  TestAniamtion
//
//  Created by frontstone on 2017/9/29.
//  Copyright © 2017年 zhenlee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlipPresentAnimationController : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) CGRect originRect;
@end
