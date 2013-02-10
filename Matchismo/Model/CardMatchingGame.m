//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Alpha Mike on 2/9/13.
//  Copyright (c) 2013 Alpha Mike. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
// public readonly, private readwrite
@property (readwrite, nonatomic) int score;
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@end


@implementation CardMatchingGame

// Consider moving to initializer
#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (NSString *) flipCardAtIndex:(NSUInteger) index {
    Card *card = self.cards[index]; // deviates from presentation
    NSString *result = nil;
    if (card && card.isPlayable) {
        if (!card.isFaceUp) { // not face up... so search before flipping
            result = [NSString stringWithFormat:@"Flipped: %@", card.contents];
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && otherCard.isPlayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        result = [NSString stringWithFormat:@"Match: %@ and %@ for %d points!", card.contents, otherCard.contents, matchScore];
                        card.playable = NO;
                        otherCard.playable = NO;                        
                        self.score += matchScore * MATCH_BONUS;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        result = [NSString stringWithFormat:@"Mismatch: %@ and %@ for loss of %d", card.contents, otherCard.contents, matchScore];
                    }
                }
            }
            self.score -= FLIP_COST; // only on flip up
        }
        card.faceUp = !card.isFaceUp;
    }
    return result;
}


- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (Card *) cardAtIndex:(NSUInteger) index {
    // protect from index out of bounds (maybe should check < 0 too?)
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (id) initWithCardCount:(NSUInteger) count
               usingDeck:(CardDeck *) deck {
    self = [super init];
    if (self) {
        for (int j = 0; j < count; ++j) {
            Card *card = [deck drawRandomCard];
            if (card) {
                self.cards[j] = card; // needs lazy instantiation
            } else { // could use assert and crash the app if count > cards in a deck
                self = nil;
                break;
            }
        }
    }
    return self;
}

@end