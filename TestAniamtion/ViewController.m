//
//  ViewController.m
//  TestAniamtion
//
//  Created by 李震 on 2017/9/13.
//  Copyright © 2017年 zhenlee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *redLayer = [[CALayer alloc] init];
    redLayer.frame = CGRectMake(0, 100, 200, 200);
    redLayer.contentsRect = CGRectMake(0.5, 0.5, 0.5, 0.5);
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:redLayer];
    
    id object ;
    [object objectForKey:@"test"];
    
}
- (IBAction)testAction:(id)sender {
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
