//
//  ZYView2.m
//  DrawCircleByFinger
//
//  Created by 雾霭天涯 on 2019/2/16.
//  Copyright © 2019 雾霭天涯. All rights reserved.
//

#import "ZYView2.h"

@implementation ZYView2


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _beginAndEndPoints = [[NSMutableArray alloc] initWithObjects:@(CGPointMake(10, 20)),@(CGPointMake(15, 23)), nil];
        self.shape = 0;
    }
    
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //每次调用 drawRect: 都会自动清空上次绘制的内容。
    
    //1.获得画布。每次获得的都是一个新的空白的画布。
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //设置颜色。
    CGContextSetStrokeColorWithColor(ctx, [[UIColor orangeColor] CGColor]);
    //2.绘制内容，链接所有的点。
    
    if (self.shape == 0) {
        CGPoint beginPoit = [self.beginAndEndPoints[0] CGPointValue];
        CGPoint endPoit = [self.beginAndEndPoints[1] CGPointValue];
        CGPoint center = CGPointMake((beginPoit.x+endPoit.x)/2.0, (beginPoit.y+endPoit.y)/2.0);
        
        //public func sqrt(_: Double) -> Double
        //sqrt()函数是求平方根的
        CGFloat distance = sqrt(pow(endPoit.x - beginPoit.x, 2)+pow(endPoit.y - beginPoit.y, 2));
        //x,y,radius 圆心和半径。
        //startAngle,enAngle 起始和结束弧度。
        //clockwise 顺逆时针。
        CGContextAddArc(ctx, center.x, center.y, distance/2.0, 0, 2*M_PI, 1);
    }else{
        CGPoint beginPoit = [self.beginAndEndPoints[0] CGPointValue];
        CGPoint endPoit = [self.beginAndEndPoints[1] CGPointValue];
        
        //添加矩形。
        CGContextAddRect(ctx, CGRectMake(beginPoit.x, beginPoit.y, endPoit.x-beginPoit.x, endPoit.y-beginPoit.y));
    }
    

    //3.绘制内容。
    CGContextStrokePath(ctx);
}


@end
