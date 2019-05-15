//
//  ViewController.m
//  TQHtmlParseDemo
//
//  Created by litianqi on 2019/5/15.
//  Copyright © 2019 edu24ol. All rights reserved.
//

#import "ViewController.h"
#import <TQHtmlParse/HtmlParseManager.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString * strHtml = @"<html><div>qq<img src=\"http://www.w3school.com.cn/i/eg_tulip.jpg\" /></div><li><img src=\"https://imgsa.baidu.com/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=ca5abb5b7bf0f736ccf344536b3cd87c/29381f30e924b899c83ff41c6d061d950a7bf697.jpg\" />qq</li><img src=\"http://img01.taopic.com/141128/240418-14112P9345826.jpg\" />11111111</html>";
    NSLog(@"************原始html 源码:%@\n",strHtml);
    
    NSDictionary * dic = [HtmlParseManager parseDetailExtension:strHtml];
    NSArray * picArray = [HtmlParseManager parseDetailToImgArray:strHtml];
    NSLog(@"************解析后:%@\n",dic);
    NSLog(@"************解析图片:%@\n",picArray);
}


@end
