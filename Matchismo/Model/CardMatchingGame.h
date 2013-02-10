//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Alpha Mike on 2/9/13.
//  Copyright (c) 2013 Alpha Mike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "CardDeck.h"

@interface CardMatchingGame : NSObject

// designated initializer (all initializers must call this)
- (id) initWithCardCount:(NSUInteger) count
               usingDeck:(CardDeck *) deck;

- (NSString *) flipCardAtIndex:(NSUInteger) index;

- (Card *) cardAtIndex:(NSUInteger) index;

@property (readonly, nonatomic) int score;


@end
