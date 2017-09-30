//
//  TabbarController.m
//  TestAniamtion
//
//  Created by frontstone on 2017/9/27.
//  Copyright © 2017年 zhenlee. All rights reserved.
//

#import "TabbarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface TabbarController ()

@end

@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tabBarItem
    FirstViewController *vc1 = [[FirstViewController alloc] init];
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:vc1]];
    
    SecondViewController *vc2 = [[SecondViewController alloc] init];
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:vc2]];
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
