//
//  FISSong.h
//  JukeboxViews
//
//  Created by Lukas Thoms on 6/11/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSong : NSObject

@property (strong, nonatomic) NSString*title;
@property (strong, nonatomic) NSString*artist;
@property (strong, nonatomic) NSString*album;
@property (strong ,nonatomic) NSString*fileName;

-(instancetype)initWithTitle:(NSString*)title  artist:(NSString*)artist album:(NSString*)album andFileName:(NSString*)fileName;
-(instancetype)init;

@end
