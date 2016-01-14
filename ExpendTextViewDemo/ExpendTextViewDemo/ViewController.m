//
//  ViewController.m
//  ExpendTextViewDemo
//
//  Created by user on 16/1/14.
//  Copyright © 2016年 XQExpendTextView. All rights reserved.
//

#import "ViewController.h"
#import "XQExpendTextView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    XQExpendTextView *expendTextView = [[XQExpendTextView alloc] initWithFrame:CGRectMake(10, 200, CGRectGetWidth(self.view.frame) - 20, 50)];
    expendTextView.text = @"这是一个可以展开闭合的textView.这是一个可以展开闭合的textView.这是一个可以展开闭合的textView.这是一个可以展开闭合的textView.这是一个可以展开闭合的textView.这是一个可以展开闭合的textView.这是一个可以展开闭合的textView.这是一个可以展开闭合的textView.";
    expendTextView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:expendTextView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
