//
//  FISJukeboxViewController.h
//  JukeboxViews
//
//  Created by Lukas Thoms on 6/12/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISPlaylist.h"
#import <AVFoundation/AVFoundation.h>

@interface FISJukeboxViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *playlistDisplay;
@property (strong, nonatomic) FISPlaylist *currentPlaylist;
@property (weak, nonatomic) IBOutlet UIButton *titleButton;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;


- (IBAction)playButton:(id)sender;
- (IBAction)stopButton:(id)sender;
- (IBAction)artistButton:(id)sender;
- (IBAction)albumButton:(id)sender;
- (IBAction)titleButton:(id)sender;
- (void)setupAVAudioPlayWithFileName:(NSString *)fileName;

@end
