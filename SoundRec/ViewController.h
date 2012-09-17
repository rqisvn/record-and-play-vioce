//
//  ViewController.h
//  SoundRec
//
//  Created by Developer on 9/17/12.
//  Copyright (c) 2012 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

@interface ViewController : UIViewController <AVAudioRecorderDelegate> {
    
    IBOutlet UIButton *playButton;
    IBOutlet UIButton *recButton;
    IBOutlet UILabel *recSateLabel;
    
    BOOL isNotRecording;
    NSURL *temporaryRecFile;
    AVAudioRecorder *recorder;
        
}

@property(nonatomic, retain)IBOutlet UIButton *playButton;
@property(nonatomic, retain)IBOutlet UIButton *recButton;

- (IBAction)recording;
- (IBAction)playback;

@end
