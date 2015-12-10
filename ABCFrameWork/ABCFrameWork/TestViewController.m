//
//  TestViewController.m
//  ABCFrameWork
//
//  Created by Robert on 15/12/9.
//  Copyright © 2015年 NationSky. All rights reserved.
//

#import "TestViewController.h"
#import "TestRequestModel.h"
#import "PNChart.h"
#import "ABCVidepPlayerController.h"

@interface TestViewController ()

@property (nonatomic, strong) ABCVidepPlayerController *videoController;

@end

@implementation TestViewController

- (void)viewDidLoad {
    PNCircleChart * circleChart = [[PNCircleChart alloc] initWithFrame:CGRectMake(0, 80, ABC_SCREEN_WIDTH, 100) total:@(100) current:@(60) clockwise:NO shadow:NO shadowColor:[UIColor whiteColor]];
//    circleChart.countingLabel.textColor = [UIColor blackColor];
    circleChart.backgroundColor = [UIColor clearColor];
    [circleChart setStrokeColor:PNGreen];
    [circleChart strokeChart];
    
    [self.view addSubview:circleChart];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self test];
    [self testVidio];
}

- (void)testVidio {
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"150511_JiveBike" withExtension:@"mov"];
//    NSURL *videoURL = [NSURL URLWithString:@"http://krtv.qiniudn.com/150522nextapp"];
    [self playVideoWithURL:videoURL];
}

- (void)playVideoWithURL:(NSURL *)url
{
    if (!self.videoController) {
        self.videoController = [[ABCVidepPlayerController alloc] initWithFrame:CGRectMake(0, 0, ABC_SCREEN_WIDTH, ABC_SCREEN_WIDTH*(9.0/16.0))];
        __weak typeof(self)weakSelf = self;
        [self.videoController setDimissCompleteBlock:^{
            weakSelf.videoController = nil;
        }];
        [self.videoController showInWindow];
    }
    self.videoController.contentURL = url;
}

- (void)test {
    TestRequestModel *testModel = [[TestRequestModel alloc] init];
    testModel.city = @"beijing";
    testModel.key = @"ec1c681fdacfcc3d4dfc530981b86a82";
    
//    ABCNetOperation *testOperation = [[ABCNetOperation alloc] initWithUrl:@"http://web.juhe.cn:8080/environment/air/cityair?" Model:testModel OperationMethod:ABCNetOperationGetMethod];
//    testOperation.delegate = self;
//    [testOperation startOperation];
    ABCNetOperation *testOperation = [[ABCNetOperation alloc] init];
    [testOperation operationWithUrl:@"http://web.juhe.cn:8080/environment/air/cityair?" Model:testModel OperationMethod:ABCNetOperationGetMethod CallBack:^(id result, NSError *error) {
        
    }];
}

- (void)netOperationStarted:(ABCNetOperation*)operation {
    
}
- (void)netOperationSuccess:(ABCNetOperation*)operation result:(id)result {
    
}
- (void)netOperationFail:(ABCNetOperation*)operation error:(NSError*)error {
    
}
@end
