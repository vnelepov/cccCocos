//
//  CaptureAction.h
//  CameraCapture
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 RusWizards LLC. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@interface CaptureAction : NSObject

@property (retain) AVCaptureVideoPreviewLayer *captureLayer;
@property (retain) AVCaptureSession *captureThread;
@property (retain) AVCaptureStillImageOutput *captureStillOutput;
@property (assign, nonatomic) id <AVCaptureVideoDataOutputSampleBufferDelegate> delegate;

- (void) initDevice;
- (void) addVideoLayer;
- (void) addOutput;


@end