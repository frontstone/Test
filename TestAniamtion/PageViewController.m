//
//  PageViewController.m
//  TestAniamtion
//
//  Created by frontstone on 2017/9/28.
//  Copyright © 2017年 zhenlee. All rights reserved.
//

#import "PageViewController.h"
#import "DetailViewController.h"

@interface PageViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property (nonatomic, strong) UIPageViewController *pageVC;
@property (nonatomic, strong) NSArray *viewControllers;
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageVC = [[UIPageViewController alloc] initWithTransitionStyle:(UIPageViewControllerTransitionStyleScroll) navigationOrientation:(UIPageViewControllerNavigationOrientationHorizontal) options:@{UIPageViewControllerOptionInterPageSpacingKey:@(0)}];
    self.pageVC.view.frame = CGRectMake(0, 300, self.view.bounds.size.width, 200);
    self.pageVC.delegate = self;
    self.pageVC.dataSource = self;
    
    [self.view addSubview:self.pageVC.view];
    self.pageVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:self.pageVC];
    
    
    DetailViewController *vc1 = [[DetailViewController alloc] init];
    vc1.view.backgroundColor = [UIColor greenColor];
    
    DetailViewController *vc2 = [[DetailViewController alloc] init];
    vc2.view.backgroundColor = [UIColor yellowColor];
    
    self.viewControllers = @[vc1,vc2];
    
    [self.pageVC setViewControllers:@[vc1] direction:(UIPageViewControllerNavigationDirectionForward) animated:YES completion:nil];
    

}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    return [self.viewControllers firstObject];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    return [self.viewControllers lastObject];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.viewControllers.count;
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
