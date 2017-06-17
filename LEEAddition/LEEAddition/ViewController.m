//
//  ViewController.m
//  LEEAddition
//
//  Created by 李江波 on 2017/6/17.
//  Copyright © 2017年 lijiangbo. All rights reserved.
//

#import "ViewController.h"
#import "LEEAddition.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *demoView;
@property (weak, nonatomic) IBOutlet UIImageView *demoImage;
@property (weak, nonatomic) IBOutlet UILabel *demoLable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [UILabel Lee_changeWordSpaceForLabel:self.demoLable WithSpace:15];
    NSString *str = @"你好";
    NSLog(@"%@",[str Lee_transformToPinyin]);
    NSLog(@"%@",[str Lee_transformToPinyinFirstLetter]);
    
    NSArray *arr = @[@"你", @"我", @"他"];
    NSLog(@"%@",arr);
    NSDictionary *dict = @{@"我": @"你", @"你": @"她"};
    NSLog(@"%@",dict);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    self.demoImage.image = [_demoView lee_snapshotImage];
//    self.demoImage.image = [UIImage Lee_blurImage:[UIImage imageNamed:@"flux"] blur:1.0];
    
    self.demoLable.attributedText = [NSMutableAttributedString Lee_imageTextWithImage:[UIImage imageNamed:@"flux"] imageWH:50 title:@"nihaoddddddd" fontSize:12 titleColor:[UIColor redColor] spacing:2];
}


@end
