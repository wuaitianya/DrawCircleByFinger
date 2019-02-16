//
//  ViewController.m
//  DrawCircleByFinger
//
//  Created by 雾霭天涯 on 2019/2/16.
//  Copyright © 2019 雾霭天涯. All rights reserved.
//

#import "ViewController.h"
#import "ZYView2.h"
@interface ViewController (){
    ZYView2* _view2;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _view2 = [[ZYView2 alloc] initWithFrame:self.view.bounds];
    
    _view2.backgroundColor = [UIColor whiteColor];
    
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [_view2 addGestureRecognizer:panGesture];
    
    [self.view addSubview:_view2];
    
    
    //单选控件。
    UISegmentedControl*_segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"画圆", @"画矩形"]];
    
    //设置默认选中的选项。
    _segmentedControl.selectedSegmentIndex = 0;
    
    _segmentedControl.frame = CGRectMake(20, 20, self.view.frame.size.width - 40, 44);
    
    //UIControlEventValueChanged，获得选中选项的改变。
    [_segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_segmentedControl];

}


- (void)panGesture:(UIPanGestureRecognizer* )gestuer {
    switch (gestuer.state) {
        case UIGestureRecognizerStateBegan:{
            CGPoint location = [gestuer locationInView:gestuer.view];
            [_view2.beginAndEndPoints replaceObjectAtIndex:0 withObject:@(location)];
        }
            break;
        case UIGestureRecognizerStateChanged:{
            CGPoint location = [gestuer locationInView:gestuer.view];
            [_view2.beginAndEndPoints replaceObjectAtIndex:1 withObject:@(location)];
            //可以把短时间内需要多次绘制的内容，在一个时间点统一绘制出来。
            [_view2 setNeedsDisplay];
        }
            break;
        case UIGestureRecognizerStateEnded:{
            
        }
            break;
        default:
            break;
    }
}
- (void)segmentedControlValueChanged:(UISegmentedControl* )sender {
    _view2.shape = sender.selectedSegmentIndex;
}
@end
