//
//  PlayingCard.h
//  Matchismo
//
//  Created by Alpha Mike on 2/9/13.
//  Copyright (c) 2013 Alpha Mike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;

// typdef'd to unsigned integer
@property ( nonatomic) NSUInteger rank;

+ (NSArray*) validSuits;

+ (NSArray*) rankStrings;

+ (NSUInteger) maxRank;


@end
