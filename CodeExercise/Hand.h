//
//  Hand.h
//  CodeExercise
//
//  Created by Rae Briggs on 2014-05-21.
//  Copyright (c) 2014 Rae Briggs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

enum HandValue
{
    highcard,
    flush,
    pair
};
@interface Hand : NSObject
@property NSMutableArray* cards;
@property enum HandValue handValue;

-(int)highCard;

-(void)addCard:(Card*)card;
-(NSString*)highValueString;
@end

