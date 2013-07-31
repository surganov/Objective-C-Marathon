//
//  Camera.m
//  Tricky Driver
//
//  Created by Zoreslav Khimich on 18/06/2013.
//  Copyright (c) 2013 Tricky Eyes. All rights reserved.
//

#import "Camera.h"

#import <AVFoundation/AVFoundation.h>

static AVCaptureSession *_captureSession;
static AVCaptureVideoPreviewLayer *_previewLayer;

@implementation Camera

+ (void)startInView:(UIView *)superview {
	
	AVCaptureDevice* camera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
	
	if (!camera)
		return;
	
    _captureSession = [[AVCaptureSession alloc] init];
    
    _captureSession.sessionPreset = AVCaptureSessionPresetPhoto;
    
    NSError *deviceError;
    
    AVCaptureDeviceInput *videoInput = [AVCaptureDeviceInput deviceInputWithDevice:camera error:&deviceError];
    
    if (deviceError) {
        
        NSLog(@"Failed to create %@: %@", [AVCaptureDeviceInput class], deviceError);
        
        return;
        
    }
    
    [_captureSession addInput:videoInput];
    
    _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_captureSession];
    
    _previewLayer.frame = superview.bounds;
    _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    [self updateOrientation];
	
    [superview.layer insertSublayer:_previewLayer atIndex:0];
    
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
		[_captureSession startRunning];
        
	});
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateOrientation) name:UIDeviceOrientationDidChangeNotification object:nil];
    
}

+ (void)stop {
    
    [_captureSession stopRunning];
    [_previewLayer removeFromSuperlayer];
    
    _previewLayer = nil;
    _captureSession = nil;
    
}

+ (void)updateOrientation {
    
    AVCaptureConnection *connection = [_previewLayer connection];
	
    if (![connection isVideoOrientationSupported])
        return;
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
	
    [CATransaction begin];
	
    if (orientation == UIInterfaceOrientationLandscapeLeft)
        [connection setVideoOrientation:AVCaptureVideoOrientationLandscapeLeft];
	
    else if (orientation == UIInterfaceOrientationLandscapeRight)
        [connection setVideoOrientation:AVCaptureVideoOrientationLandscapeRight];
    
    [CATransaction commit];
	
    
}


@end
