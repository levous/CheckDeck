//
//  SoundEffects.m
//  CheckDeck
//
//  Created by Rusty Zarse on 1/2/11.
//  Copyright 2011 LeVous, LLC. All rights reserved.
//

#import "SoundEffects.h"


@implementation SoundEffects

- (id)init{
  if (self == [super init]) {
    NSString * path = [[NSBundle mainBundle] pathForResource:@"burp" ofType:@"wav"];
    checkItemSound = [[AVAudioPlayer alloc] initWithData:[NSData dataWithContentsOfFile:path] error:nil];
    [checkItemSound performSelectorInBackground:@selector(prepareToPlay) withObject:nil];
  }
  return self;
}

- (void)playCheckedOffSound{
  [checkItemSound play];
}

- (void)dealloc{
  [checkItemSound release];
  [super dealloc];
}
@end
