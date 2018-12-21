//
//  CLAttributedString.h
//  AttributeStringDemo
//
//  Created by 程路 on 2018/12/21.
//  Copyright © 2018年 Mcheng. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CLAttributedString : NSObject
@property(nonatomic,copy)NSMutableAttributedString * labelAttriString; //富文本
@property(nonatomic,copy)NSString * labelString; //文本
@property(nonatomic)CGFloat wordSpace; //字间距
@property(nonatomic)CGFloat lineSpace;//行间距
@property(nonatomic)CGSize labelSize;//计算高度时的size
@property(nonatomic)CGFloat wordFont;//字体大小
@property(nonatomic)UIColor * wordColor;//字体颜色
@property(nonatomic,copy)NSString * imageName;//图片的名字
-(instancetype)initWithTextStr:(NSString *)textStr;
/**
 *  插入图片
 *
 *  @param imageName  图片的名字
 *  @param location   插入的位置
 *  @param frame  图片的frame
 *
 */
-(void)SetImageName:(NSString *)imageName location:(NSUInteger)location frame:(CGRect)frame;
/**
 *  计算高度
 *
 *  @param labelSize  文本的宽高
 *
 */
-(CGSize)SetLabelSize:(CGSize)labelSize;
/**
 *  设置字号
 *
 *  @param font  字号
 *  @param range 区域
 */
-(void)setFont:(UIFont *)font inRange:(NSRange)range;
/**
 *  设置字体颜色
 *
 *  @param color 字体颜色
 *  @param range 区域
 */
-(void)addColorWordWithColor:(UIColor*)color andRange:(NSRange)range;
@end

