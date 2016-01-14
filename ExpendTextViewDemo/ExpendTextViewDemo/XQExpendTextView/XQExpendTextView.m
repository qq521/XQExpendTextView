//
//  ExpendTextView.m
//
//
//  Created by user on 16/1/12.
//  Copyright © 2016年 user. All rights reserved.
//

#import "XQExpendTextView.h"

@interface XQExpendTextView (){
    UITextView *_textView;
    CGSize _maxSize;
    CGPoint _endPoint;
    NSInteger _endIndex;
    NSMutableAttributedString *_shortString;
    NSMutableAttributedString *_longString;
    BOOL _isClosed;
    NSString *_moreString;
    
    CGFloat _fontSize;
    UIColor *_textColor;
    NSString *_expendTitle;
}
@end

@implementation XQExpendTextView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _textView = [[UITextView alloc] initWithFrame:self.bounds];
        _textView.editable =NO;
        _textView.selectable = NO;
        _textView.userInteractionEnabled = NO;
        _textView.textContainerInset = UIEdgeInsetsZero;
        _textView.showsVerticalScrollIndicator = NO;
        _textView.textAlignment = NSTextAlignmentJustified;
        _textView.backgroundColor = [UIColor clearColor];
        [self addSubview:_textView];
        [self addTarget:self action:@selector(expendOrClose) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}

#pragma mark -initData
- (void)initData {
    _longString = [[NSMutableAttributedString alloc] initWithString:_text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:self.fontSize],NSForegroundColorAttributeName:self.textColor}];
    if ([self getEndPoint]) {
        [self getEndIndex];
        [self getShortText];
        [self closed];
        self.userInteractionEnabled = YES;
    } else {
        self.userInteractionEnabled = NO;
    }
    
}

- (BOOL)getEndPoint {
    _textView.attributedText = _longString;

    _moreString = [NSString stringWithFormat:@"... %@",self.expendTitle];
   
    _maxSize = [_textView sizeThatFits:self.bounds.size];
    CGRect moreRect = [_moreString boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.frame), 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_textView.font} context:nil];
    if (_maxSize.height > CGRectGetHeight(_textView.frame)) {
        _endPoint = CGPointMake(CGRectGetWidth(self.frame) - CGRectGetWidth(moreRect) - 5, CGRectGetHeight(_textView.frame) - CGRectGetHeight(moreRect));
        return YES;
    }else{
        _endPoint = CGPointMake(CGRectGetMaxX(_textView.frame), CGRectGetHeight(_textView.frame));
        return NO;
    }
}

- (void)getEndIndex {
    _endIndex =  [_textView.layoutManager characterIndexForPoint:_endPoint inTextContainer:_textView.textContainer fractionOfDistanceBetweenInsertionPoints:nil];
}

- (void)getShortText {
    if (_text.length > _endIndex) {
        NSRange rang = NSMakeRange(_endIndex , _text.length - _endIndex);
        _shortString = [[NSMutableAttributedString alloc] initWithString:_text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:self.fontSize],NSForegroundColorAttributeName:self.textColor}];
        [_shortString replaceCharactersInRange:rang withString:_moreString];
        
        [_shortString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.13 green:0.51 blue:0.97 alpha:1] range:NSMakeRange(_shortString.length - 4, 4)];
        
    }
}

- (void)setTextViewContent:(NSMutableAttributedString *)attributedString {
    _textView.attributedText = attributedString;
    CGSize size = [_textView sizeThatFits:self.frame.size];
    _textView.frame = CGRectMake(CGRectGetMinX(_textView.frame), CGRectGetMinY(_textView.frame), CGRectGetWidth(self.frame), size.height);
}

#pragma mark -actions
- (void)expendOrClose{
    _isClosed = !_isClosed;
    if (_isClosed) {
        [self closed];
    }else{
        [self expend];
    }
    
    if (self.tapCallBack) {
        self.tapCallBack(CGRectGetHeight(self.frame));
    }
}


- (void)closed {
    _isClosed = YES;
    [self setTextViewContent:_shortString];
    self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(_textView.frame), CGRectGetHeight(_textView.frame));
    
}

- (void)expend{
    _isClosed = NO;
    [self setTextViewContent:_longString];
    self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(_textView.frame), CGRectGetHeight(_textView.frame));
}

#pragma mark -setter&getter
- (CGFloat)fontSize {
    if (_fontSize < 1) {
        return  14.0f;
    } else {
        return  _fontSize;
    }
}


- (UIColor *)textColor {
    if (_textColor) {
        return _textColor;
    } else {
        return [UIColor blackColor];
    }
}


- (void)setFontSize:(CGFloat)fontSize {
    _fontSize = fontSize;
    if (_text.length > 0) {
        [self initData];
    }
    
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor =textColor;
    if (_text.length > 0) {
        [self initData];
    }
}
- (NSString *)expendTitle {
    if (_expendTitle.length > 0) {
        return _expendTitle;
    } else {
        return @"更多";
    }
}

- (void)setExpendTitle:(NSString *)expendTitle {
    _expendTitle = expendTitle;
    if (_text.length > 0) {
        [self initData];
    }
}

- (void)setText:(NSString *)text {
    if (_text != text) {
        _text = text;
        
        [self initData];
    }
}

@end
