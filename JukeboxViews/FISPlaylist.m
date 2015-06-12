//
//  FISPlaylist.m
//  JukeboxViews
//
//  Created by Lukas Thoms on 6/11/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISPlaylist.h"

@implementation FISPlaylist

-(instancetype) init {
    self = [super init];
    _songs = [@[]mutableCopy];
    return self;
}


- (void)sortSongsByTitle {
    NSSortDescriptor *title = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    NSSortDescriptor *artist = [[NSSortDescriptor alloc] initWithKey:@"artist" ascending:YES];
    self.songs = [[self.songs sortedArrayUsingDescriptors:@[title, artist]] mutableCopy];
}
- (void)sortSongsByArtist {
    NSSortDescriptor *title = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    NSSortDescriptor *artist = [[NSSortDescriptor alloc] initWithKey:@"artist" ascending:YES];
    NSSortDescriptor *album = [[NSSortDescriptor alloc] initWithKey:@"album" ascending:YES];
    self.songs = [[self.songs sortedArrayUsingDescriptors:@[artist, album, title]] mutableCopy];
    
}
- (void)sortSongsByAlbum {
    NSSortDescriptor *album = [[NSSortDescriptor alloc] initWithKey:@"album" ascending:YES];
    NSSortDescriptor *title = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    self.songs = [[self.songs sortedArrayUsingDescriptors:@[album, title]] mutableCopy];
}
- (NSString *)description {
    NSMutableString *playlist =[@"" mutableCopy];
    for (NSUInteger i=0; i < self.songs.count; i++) {
        FISSong *song = self.songs[i];
        [playlist appendFormat:@"%lu. Title: %@ Artist: %@ Album: %@\n",(i+1), song.title, song.artist, song.album];
    }
    NSString *newPlaylist = playlist;
    return newPlaylist;
}
- (FISSong *)songAtPosition:(NSNumber *)position {
    if ([position integerValue] < 1 || [position integerValue] > self.songs.count) {
        return nil;
    } else {
    return self.songs[[position integerValue]-1];
    }
}

@end
