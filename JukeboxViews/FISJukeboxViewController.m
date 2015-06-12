//
//  FISJukeboxViewController.m
//  JukeboxViews
//
//  Created by Lukas Thoms on 6/12/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISJukeboxViewController.h"

@interface FISJukeboxViewController ()

@end

@implementation FISJukeboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FISSong *firstSong = [[FISSong alloc] initWithTitle:@"Oh No" artist:@"Girl Talk" album:@"All day" andFileName:@"01 - Girl Talk - Oh No"];
    FISSong *secondSong = [[FISSong alloc] initWithTitle:@"Let It Out" artist:@"Girl Talk" album:@"All Day" andFileName:@"02 - Girl Talk - Let It Out"];
    FISSong *thirdSong = [[FISSong alloc] initWithTitle:@"Hold On Be Strong" artist:@"Tupac" album:@"R U Still Down?" andFileName:@"hold_on_be_strong"];
    FISSong *fourthSong = [[FISSong alloc] initWithTitle:@"Bailando" artist:@"Enrique Iglesias" album:@"Sex and Love" andFileName:@"bailando"];
    FISSong *fifthSong = [[FISSong alloc] initWithTitle:@"Old Thing Back" artist:@"The Notorious B.I.G." album:@"Duets: The Final Chapter" andFileName:@"old_things_back"];
    self.currentPlaylist = [[FISPlaylist alloc] init];
    self.currentPlaylist.songs = [@[firstSong, secondSong, thirdSong, fourthSong, fifthSong] mutableCopy];
    self.playlistDisplay.text = self.currentPlaylist.description;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)playButton:(id)sender {
    NSUInteger chosenSong = [self.textField.text integerValue];
    chosenSong -= 1;
    NSLog(@"You picked %@", [self.currentPlaylist.songs[chosenSong] title]);
    [self setupAVAudioPlayWithFileName:[self.currentPlaylist.songs[chosenSong] fileName]];
    [self.audioPlayer play];
};

- (IBAction)stopButton:(id)sender {
    [self.audioPlayer stop];
}

- (IBAction)artistButton:(id)sender {
    [self.currentPlaylist sortSongsByArtist];
    self.playlistDisplay.text = self.currentPlaylist.description;
}

- (IBAction)albumButton:(id)sender {
    [self.currentPlaylist sortSongsByAlbum];
    self.playlistDisplay.text = self.currentPlaylist.description;
}
- (IBAction)titleButton:(id)sender {
    [self.currentPlaylist sortSongsByTitle];
    self.playlistDisplay.text = self.currentPlaylist.description;
}

- (void)setupAVAudioPlayWithFileName:(NSString *)fileName
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:fileName
                                         ofType:@"mp3"]];
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:url
                        error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        [self.audioPlayer prepareToPlay];
    }
}

@end
