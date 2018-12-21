//
//  CLAttributedString.m
//  AttributeStringDemo
//
//  Created by 程路 on 2018/12/21.
//  Copyright © 2018年 Mcheng. All rights reserved.
//

#import "CLAttributedString.h"
#import <CoreText/CoreText.h>
@implementation CLAttributedString{
    NSInteger  Loc;
    CGRect imageFrame;
}
-(instancetype)initWithTextStr:(NSString *)textStr{
    if (self = [super init]) {
        _labelString = textStr;
        Loc = 0;
        imageFrame = CGRectMake(0, 0, 0, 0);
        _labelAttriString = [[NSMutableAttributedString alloc]initWithString:textStr attributes:nil];
    }
    return self;
}
-(void)setWordFont:(CGFloat)wordFont{
    _wordFont = wordFont;
    [_labelAttriString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:wordFont] range:NSMakeRange(0,_labelAttriString.length)];
    
}
-(CGSize)SetLabelSize:(CGSize)labelSize{
    CGSize size = [_labelAttriString boundingRectWithSize:CGSizeMake(labelSize.width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    return size;
}
-(void)SetImageName:(NSString *)imageName location:(NSUInteger)location frame:(CGRect)frame{
    _imageName = imageName;
    Loc = location;
    imageFrame = frame;
    if (imageName.length>0&&imageName!=nil) {
        NSTextAttachment *attch = [[NSTextAttachment alloc] init];
        attch.image = [UIImage imageNamed:_imageName];
        attch.bounds = imageFrame;
        NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
        [_labelAttriString insertAttributedString:string atIndex:Loc];
    }
    
}
-(void)setWordSpace:(CGFloat)wordSpace{
    _wordSpace = wordSpace;
    [_labelAttriString addAttribute:NSKernAttributeName value:@(wordSpace) range:NSMakeRange(0,_labelAttriString.length)];
}
-(void)setWordColor:(UIColor *)wordColor{
    _wordColor = wordColor;
    [_labelAttriString addAttribute:NSForegroundColorAttributeName value:wordColor range:NSMakeRange(0,_labelAttriString.length)];
}
-(void)setLineSpace:(CGFloat)lineSpace{
    _lineSpace = lineSpace;
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.lineSpacing = lineSpace;
    paraStyle.alignment = NSTextAlignmentLeft;
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:_wordFont],NSParagraphStyleAttributeName:paraStyle,NSKernAttributeName:@(_wordSpace),NSParagraphStyleAttributeName:paraStyle};
    
    [_labelAttriString addAttributes:dic range:NSMakeRange(0, _labelAttriString.length)];
}
-(void)setFont:(UIFont *)font inRange:(NSRange)range{
    [_labelAttriString addAttribute:NSFontAttributeName value:font range:range];
}
-(void)addColorWordWithColor:(UIColor *)color andRange:(NSRange)range{
    [_labelAttriString addAttribute:NSForegroundColorAttributeName value:color range:range];
}
@end
