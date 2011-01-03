//
//  SoundEffects.m
//  CheckDeck
//
//  Created by Rusty Zarse on 1/2/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "SoundEffects.h"


@implementation SoundEffects
- (void)playCheckedOffSound{
  NSString * path = [[NSBundle mainBundle] pathForResource:@"burp" ofType:@"wav"];
	
  AVAudioPlayer *soundPlayer = [[AVAudioPlayer alloc] initWithData:[NSData dataWithContentsOfFile:path] error:nil];
  //[soundPlayer setDelegate:self];
  [soundPlayer prepareToPlay];
  [soundPlayer play];
}
@end
