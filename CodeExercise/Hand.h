//
//  Hand.h
//  CodeExercise
//
//  Created by Rae Briggs on 2014-05-21.
//  Copyright (c) 2014 Rae Briggs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Hand : NSObject
@property NSMutableArray* cards;

-(bool)compareHand:(Hand*)otherHand;
//nil if no pair, else the high pair
-(int)hasAPair;
//returns nil if not a flush or the highestflush card
-(int)isAFlush;
-(void)addCard:(Card*)card;
@end

