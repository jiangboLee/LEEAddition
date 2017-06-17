//
//  UITextView+LEETextField.m
//  LEEAddition
//
//  Created by 李江波 on 2017/6/17.
//  Copyright © 2017年 lijiangbo. All rights reserved.
//

#import "UITextView+LEETextView.h"
#import <objc/runtime.h>
@interface UITextView ()

@property (nonatomic, strong) UILabel *placeholderLabel;//占位符
@property (nonatomic, strong) UILabel *wordCountLabel;//计算字数
@end

@implementation UITextView (LEETextView)

+ (void)Lee_changeLineSpaceForLabel:(UITextView *)textView WithSpace:(float)space {

    NSString *lableText = textView.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:lableText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, lableText.length)];
    textView.attributedText = attributedString;
    textView.textAlignment = NSTextAlignmentCenter;
    [textView sizeToFit];
}
/**********************************************************************/
static NSString *PLACEHOLDLABEL = @"placelabel";
static NSString *PLACEHOLD = @"placehold";
static NSString *WORDCOUNTLABEL = @"wordcount";
static const void *limitLengthKey = &limitLengthKey;

#pragma mark : - set/get
- (void)setPlaceholder:(NSString *)placeholder {

    objc_setAssociatedObject(self, &PLACEHOLD, placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setPlaceHolderLabel:placeholder];
}
- (NSString *)placeholder {

    return objc_getAssociatedObject(self, &PLACEHOLD);
}

- (void)setLimitLength:(NSNumber *)limitLength {
    objc_setAssociatedObject(self, limitLengthKey, limitLength, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addLimitLengthObserver:[limitLength intValue]];
    
    [self setWordcountLable:limitLength];
    
}
- (NSNumber *)limitLength {
    
    return objc_getAssociatedObject(self, limitLengthKey);
}
- (void)setPlaceholderLabel:(UILabel *)placeholderLabel {
    
    objc_setAssociatedObject(self, &PLACEHOLDLABEL, placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)placeholderLabel {
    
    return objc_getAssociatedObject(self, &PLACEHOLDLABEL);
}
- (void)setWordCountLabel:(UILabel *)wordCountLabel {
    
    objc_setAssociatedObject(self, &WORDCOUNTLABEL, wordCountLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
- (UILabel *)wordCountLabel {
    
    return objc_getAssociatedObject(self, &WORDCOUNTLABEL);
}

#pragma mark : - 配置占位符标签
- (void)setPlaceHolderLabel:(NSString *)placeholder {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChanged:) name:UITextViewTextDidChangeNotification object:self];
    if (self.placeholderLabel) {
        [self.placeholderLabel removeFromSuperview];
    }
    /*
     *  占位字符
     */
    self.placeholderLabel = [[UILabel alloc] init];
    self.placeholderLabel.font = [UIFont systemFontOfSize:13.];
    self.placeholderLabel.text = placeholder;
    self.placeholderLabel.numberOfLines = 0;
    self.placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.placeholderLabel.textColor = [UIColor lightGrayColor];
    CGRect rect = [placeholder boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.frame) - 7, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13.]} context:nil];
    self.placeholderLabel.frame = CGRectMake(7, 7, rect.size.width, rect.size.height);
    [self addSubview:self.placeholderLabel];
    self.placeholderLabel.hidden = self.text.length > 0 ? YES : NO;
    self.wordCountLabel.text = [NSString stringWithFormat:@"%lu/%@",(unsigned long)self.text.length,self.limitLength];
    
}

#pragma mark -- 配置字数限制标签
- (void)setWordcountLable:(NSNumber *)limitLength {
    if (self.wordCountLabel) {
        [self.wordCountLabel removeFromSuperview];
    }
    /*
     *  字数限制
     */
    self.wordCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) - 65, CGRectGetHeight(self.frame) - 20, 60, 20)];
    self.wordCountLabel.textAlignment = NSTextAlignmentRight;
    self.wordCountLabel.textColor = [UIColor lightGrayColor];
    self.wordCountLabel.font = [UIFont systemFontOfSize:13.];
    if (self.text.length > [limitLength integerValue]) {
        self.text = [self.text substringToIndex:[self.limitLength integerValue]];
    }
    self.wordCountLabel.text = [NSString stringWithFormat:@"%lu/%@",(unsigned long)self.text.length,limitLength];
    [self addSubview:self.wordCountLabel];
    
}


#pragma mark -- 增加限制位数的通知
- (void)addLimitLengthObserver:(int)length {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(limitLengthEvent) name:UITextViewTextDidChangeNotification object:self];
}

#pragma mark -- 限制输入的位数
- (void)limitLengthEvent {
    
    if ([self.text length] > [self.limitLength integerValue]) {
        
        self.text = [self.text substringToIndex:[self.limitLength integerValue]];
    }
}


#pragma mark -- NSNotification

- (void)textFieldChanged:(NSNotification *)notification {
    if (self.placeholder) {
        self.placeholderLabel.hidden = YES;
        
        if (self.text.length == 0) {
            
            self.placeholderLabel.hidden = NO;
        }
    }
    if (self.limitLength) {
        
        NSUInteger wordCount = self.text.length;
        if (wordCount > [self.limitLength integerValue]) {
            wordCount = [self.limitLength integerValue];
        }
        self.wordCountLabel.text = [NSString stringWithFormat:@"%ld/%@",(long)wordCount,self.limitLength];
    }
    
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidChangeNotification
                                                  object:self];
}

@end














