//
//  ViewController.m
//  OC图文混排复习
//
//  Created by jyh on 2017/12/15.
//  Copyright © 2017年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 附件
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    // 来源图片
    attachment.image = [UIImage imageNamed:@"lxh_haobang"];
    
    //lineHeight 大致和字体的大小相等
    CGFloat height = self.label.font.lineHeight;
    // 设置 大小
    attachment.bounds = CGRectMake(0, -4, height, height);
    
    // 图像字符串
    NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:attachment];

    // 定义一个可变的字符串
    NSMutableAttributedString *attrStrM = [[NSMutableAttributedString alloc] initWithString:@"我"];
    
    //拼接图片文本
    [attrStrM appendAttributedString:imageStr];
    
    [attrStrM appendAttributedString:[[NSMutableAttributedString alloc] initWithString:@"88!"]];
    
    // 设置属性文本
    self.label.attributedText = attrStrM;
    
    
}



@end
