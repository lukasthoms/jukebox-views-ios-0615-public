//
//  FISSong.m
//  JukeboxViews
//
//  Created by Lukas Thoms on 6/11/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISSong.h"

@implementation FISSong

-(instancetype)initWithTitle:(NSString*)title  artist:(NSString*)artist album:(NSString*)album andFileName:(NSString *)fileName {
    self = [super init];
    _title = title;
    _artist = artist;
    _album = album;
    _fileName = fileName;
    return self;
}

-(instancetype)init {
    self = [[FISSong alloc] initWithTitle:@"" artist:@"" album:@"" andFileName:@""];
    return self;
}

@end
