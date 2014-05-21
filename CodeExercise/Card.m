//
//  Card.m
//  CodeExercise
//
//  Created by Rae Briggs on 2014-05-21.
//  Copyright (c) 2014 Rae Briggs. All rights reserved.
//

#import "Card.h"

@implementation Card
@synthesize suit,rank;

-(id)initWithCardIndex:(int)cardIndex{
    self = [super init];
    if(self){
        suit = [self findSuite:cardIndex];
        rank = [self findRank:cardIndex];
    }
    return self;
}
-(enum suit)findSuite:(int)cardIndex
{
    if(cardIndex < 14){
        return hearts;
    }else if (cardIndex < 27){
        return diamonds;
    }else if (cardIndex < 40){
        return spades;
    }else{
        return clubs;
    }
}
-(int)findRank:(int)cardIndex
{
    if(cardIndex < 14){
        return cardIndex;
    }else{
        return cardIndex - ([self findSuite:cardIndex ] * 13);
    }
}
-(NSString*)toString
{
    return [NSString stringWithFormat:@"%i of %@", rank,[self suitStringFromType] ];
}
/*This should not be specific to class
 * Need a card utility class
 */
-(NSString*)suitStringFromType{
    switch(suit){
        case hearts:
            return @"Hearts";
            break;
        case diamonds:
            return @"Diamonds";
            break;
        case spades:
            return @"Spades";
            break;
        case clubs:
            return @"Clubs";
            break;

    };
}

@end
