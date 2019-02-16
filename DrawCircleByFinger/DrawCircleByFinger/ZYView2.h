//
//  ZYView2.h
//  DrawCircleByFinger
//
//  Created by 雾霭天涯 on 2019/2/16.
//  Copyright © 2019 雾霭天涯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYView2 : UIView
@property (nonatomic,strong) NSMutableArray* beginAndEndPoints;
@property (nonatomic,assign) NSInteger shape;
@end

NS_ASSUME_NONNULL_END
