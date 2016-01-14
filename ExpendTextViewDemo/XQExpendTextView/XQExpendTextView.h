//
//  ExpendTextView.h
//  
//
//  Created by user on 16/1/12.
//  Copyright © 2016年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^XQExpendTextViewTapBlock)(CGFloat height);
@interface XQExpendTextView : UIControl
@property (nonatomic,copy) XQExpendTextViewTapBlock tapCallBack;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,strong) UIColor *textColor;
@property (nonatomic,assign) CGFloat fontSize;
@property (nonatomic,copy) NSString *expendTitle;
@end
