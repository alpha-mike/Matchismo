//
//  Card.m
//  Matchismo
//
//  Created by Alpha Mike on 2/9/13.
//  Copyright (c) 2013 Alpha Mike. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
