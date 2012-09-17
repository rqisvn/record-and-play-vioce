//
//  ViewController.m
//  SoundRec
//
//  Created by Developer on 9/17/12.
//  Copyright (c) 2012 Developer. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()

@end

@implementation ViewController
@synthesize recButton, playButton;

- (IBAction)recording {
    if(isNotRecording) {
        isNotRecording = NO;
        [recButton setTitle:@"Stop" forState:UIControlStateNormal];
        playButton.hidden = YES;
        recSateLabel.text = @"Recording";
        temporaryRecFile = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:@"VoiceFile"]];
        recorder = [[AVAudioRecorder alloc] initWithURL:temporaryRecFile settings:nil error:nil];
        [recorder setDelegate:self];
        [recorder prepareToRecord];
        [recorder record];
        
    }else {
        isNotRecording = YES;
        [recButton setTitle:@"REC" forState:UIControlStateNormal];
        playButton.hidden = NO;
        recSateLabel.text = @"Not Recording";
        [recorder stop];
    }
    
}
- (IBAction)playback {
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:temporaryRecFile error:nil];
    player.volume = 1;
    [player play];
    
}

- (void)viewDidLoad
{
    isNotRecording = YES;
    playButton.hidden = YES;
    recSateLabel.text = @"Not Recording";
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [audioSession setActive:YES error:nil];
     
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    NSFileManager *fileHandler = [NSFileManager defaultManager];
    [fileHandler removeItemAtPath:temporaryRecFile error:nil];
    [recorder dealloc];
    recorder = nil;
    temporaryRecFile = nil;
    playButton.hidden = yes;
    
    
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)dealloc {
    [playButton release];
    [recButton release];
    [super dealloc];
}

@end
