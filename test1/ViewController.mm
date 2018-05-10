//
//  ViewController.m
//  test1
//
//  Created by ChenWei on 2017/5/21.
//  Copyright © 2017年 ChenWei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize videoCamera, videoView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layout];
    self.videoCamera = [[CvVideoCamera alloc] initWithParentView:self.videoView];
    self.videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionBack;
    self.videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset1280x720;
    self.videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.videoCamera.delegate = self;
    self.videoCamera.defaultFPS = 30;
    self.videoCamera.grayscaleMode = NO;

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
        [self.videoCamera start];
}

-(void)layout {
    int screenWidth = [UIScreen mainScreen].bounds.size.width;
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    self.videoView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    self.videoView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:videoView];
    
    NSMutableDictionary * viewDict = [NSMutableDictionary dictionaryWithObject:self.videoView forKey:@"videoView"];
    [viewDict setObject:self.view forKey:@"window"];
    
    NSString *horizontalConstrainsParam = @"H:|[videoView]|";
    NSString *verticalConstrainsParam = @"V:|[videoView]|";
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:horizontalConstrainsParam
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewDict
                               ]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:verticalConstrainsParam
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewDict]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)processImage:(cv::Mat&)image{
    cv::Mat image_bgr, image_gauss;
    cv::cvtColor(image, image_bgr, CV_BGRA2BGR);
    GaussianBlur(image_bgr, image_gauss, cv::Size(7, 7), 5, 5);
    cv::cvtColor(image_gauss, image, CV_BGR2BGRA);
    
    dispatch_sync( dispatch_get_main_queue(),^{
        
    });
}

@end
