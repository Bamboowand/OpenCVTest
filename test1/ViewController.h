//
//  ViewController.h
//  test1
//
//  Created by ChenWei on 2017/5/21.
//  Copyright © 2017年 ChenWei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <opencv2/highgui/cap_ios.h>
#import "opencv2/opencv.hpp"

@interface ViewController : UIViewController<CvVideoCameraDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *videoView;
@property (nonatomic, retain) CvVideoCamera* videoCamera;

@end
