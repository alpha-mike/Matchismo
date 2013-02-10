//
//  PlayingCard.m
//  Matchismo
//
//  Created by Alpha Mike on 2/9/13.
//  Copyright (c) 2013 Alpha Mike. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard : Card

@synthesize suit = _suit; // because we implemented setter and getter

- (int)match:(NSArray *)otherCards {
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([self.suit isEqualToString:otherCard.suit]) return 1;
        if (self.rank == otherCard.rank) return 4;
    }
    return 0;
}


// class methods start with +
+ (NSArray*) validSuits {
    return @[@"♥",@"♣",@"♦",@"♠"];
}

+ (NSArray*) rankStrings {
    // todo: move arrays to statics
    return @[@"?",@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger) maxRank {
    return [self rankStrings].count-1;
}

- (NSString *) contents {
    // @[ .. ] creates an array on the fly
    // @".." creates a string on the fly
    NSArray *rankStrings = [PlayingCard rankStrings];
    // gets rank string, appends suit string
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (void) setSuit:(NSString*)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *) suit {
    return _suit ? _suit : @"?";
}

- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
