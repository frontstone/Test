//
//  PresentViewController.m
//  TestAniamtion
//
//  Created by frontstone on 2017/9/29.
//  Copyright © 2017年 zhenlee. All rights reserved.
//

#import "PresentViewController.h"

@interface PresentViewController ()


@end

@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)dismissAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
