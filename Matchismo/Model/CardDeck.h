//
//  CardDeck.h
//  Matchismo
//
//  Created by Alpha Mike on 2/9/13.
//  Copyright (c) 2013 Alpha Mike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface CardDeck : NSObject

- (void)addCard:(Card*)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
