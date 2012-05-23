//
//  CaptureAction.m
//  CameraCapture
//
//  Created by Vladimir Nelepov on 22.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CaptureAction.h"
#import <ImageIO/ImageIO.h>

@implementation CaptureAction

@synthesize captureThread;
@synthesize captureLayer;
@synthesize captureStillOutput;
@synthesize delegate;

-(void) dealloc{
    [captureThread stopRunning];
    [captureThread release];
    [captureLayer release];
    [captureStillOutput release];
    
    [super dealloc];
}

-(id)init{
    if (self=[super init]) {
        captureThread=[[AVCaptureSession alloc] init];
        
    }
    return self;
}



-(void)initDevice{
    
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (captureDevice) {
        NSError *error;
        AVCaptureDeviceInput *inputDevice = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
        if (!error) {
            if ([captureThread canAddInput:inputDevice]) {
                [captureThread addInput:inputDevice];
            } else{
                NSLog(@"Error! Add input to thread.");
            }
        } else {
            NSLog(@"Error! Can't create input.");
        }
        error=nil;
        AVCaptureVideoDataOutput *outputDevice = [[AVCaptureVideoDataOutput alloc] init];
        outputDevice.alwaysDiscardsLateVideoFrames = YES;
        dispatch_queue_t queue;
        queue = dispatch_queue_create("cameraQueue", NULL);
        [outputDevice setSampleBufferDelegate:delegate queue:queue];
        dispatch_release(queue);
        NSString* key = (NSString*)kCVPixelBufferPixelFormatTypeKey; 
        NSNumber* value = [NSNumber numberWithUnsignedInt:kCVPixelFormatType_32BGRA]; 
        NSDictionary* videoSettings = [NSDictionary dictionaryWithObject:value forKey:key]; 
        [outputDevice setVideoSettings:videoSettings]; 
        [captureThread addOutput:outputDevice];
        [outputDevice release];
        
    } else {
        NSLog(@"Error! Can't create device.");
    }
    
    
}

- (void)addVideoLayer{
    captureLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:captureThread];
    captureLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
}

- (void)addOutput{
    
    captureStillOutput = [[AVCaptureStillImageOutput alloc] init];
    captureStillOutput.outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey, nil];
    
    AVCaptureConnection *imageConnection = nil;
    
    for (AVCaptureConnection *conn in captureStillOutput.connections) {
        for (AVCaptureInputPort *port in conn.inputPorts) {
            if ([port.mediaType isEqual:AVMediaTypeVideo]) {
                imageConnection = conn;
                break;
            }
        }
        if (imageConnection) {
            break;
        }
    }
    [captureThread addOutput:captureStillOutput];
    
}



@end
