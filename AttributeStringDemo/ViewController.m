//
//  ViewController.m
//  AttributeStringDemo
//
//  Created by 程路 on 2018/12/21.
//  Copyright © 2018年 Mcheng. All rights reserved.
//
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define NEW_B_EQUAL(oldA,oldB,newA) (((newA)*(oldB))/(oldA))    // oldA/oldB=newA/newB  算其中一个
#define NEW_WIDTH(oldW) NEW_B_EQUAL(375, oldW, WIDTH) //以6的屏幕宽度，适配宽度
#define RGB(x,y,z) [UIColor colorWithRed:x/255.0f green:y/255.0f blue:z/255.0f alpha:1.0f]
#define RGB_gray(x) [UIColor colorWithRed:x/255.0f green:x/255.0f blue:x/255.0f alpha:1.0f]
#define RGBP(x,y,z,p) [UIColor colorWithRed:x/255.0f green:y/255.0f blue:z/255.0f alpha:p]

#import "ViewController.h"
#import "CLAttributedString.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图文混排富文本";
    self.view.backgroundColor = [UIColor whiteColor];
    [self InterFace];
}
-(void)InterFace{
    CLAttributedString * la = [[CLAttributedString alloc]initWithTextStr:@" 广东省深圳市南山区炳海大道某某小区2302"];
    [la SetImageName:@"wfirst" location:0 frame:CGRectMake(0, 0, 40, 40)];
    [la SetImageName:@"wfirst" location:3 frame:CGRectMake(0, 0, 40, 40)];
    [la SetImageName:@"wfirst" location:8 frame:CGRectMake(0, 0, 40, 40)];
    la.wordFont = 14.0f;
    la.wordColor = [UIColor blueColor];
    la.wordSpace = 1.0f;
    la.lineSpace = 20.0f;
    
    CGSize size = [la SetLabelSize:CGSizeMake(WIDTH-100 ,30)];
    UILabel * mayLabel = [[UILabel alloc]initWithFrame:CGRectMake(50,100 ,WIDTH-100 ,30)];
    mayLabel.attributedText = la.labelAttriString;
    mayLabel.numberOfLines = 0;
    mayLabel.backgroundColor = [UIColor lightGrayColor];
    mayLabel.frame = CGRectMake((WIDTH-size.width)/2.0f,100 ,size.width ,size.height);
    [self.view addSubview:mayLabel];
    
}

@end
