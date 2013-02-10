//
//  CardDeck.m
//  Matchismo
//
//  Created by Alpha Mike on 2/9/13.
//  Copyright (c) 2013 Alpha Mike. All rights reserved.
//

#import "CardDeck.h"

@interface CardDeck()
@property (strong,nonatomic) NSMutableArray *cards;
@end


@implementation CardDeck

// Override getter to prevent ever returning nil
- (NSMutableArray*) cards {
    // Common idiom, always use this: [[Array alloc]init]
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (Card*)drawRandomCard {
    Card *randomCard;
    if (self.cards.count) {
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end
