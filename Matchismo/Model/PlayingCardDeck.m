//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Alpha Mike on 2/9/13.
//  Copyright (c) 2013 Alpha Mike. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

// Do the init this way by convention
- (id) init {
    // self is special variable, only place self= is used is init
    self = [super init];
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                card.playable = YES;
                card.faceUp = NO;
                [self addCard:card atTop:YES];
            }
        }
        
    }
    return self;
}

@end
