//
//  Card.h
//  Matchismo
//
//  Created by Alpha Mike on 2/9/13.
//  Copyright (c) 2013 Alpha Mike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isPlayable) BOOL playable;

- (int) match:(NSArray *) otherCards;

@end
